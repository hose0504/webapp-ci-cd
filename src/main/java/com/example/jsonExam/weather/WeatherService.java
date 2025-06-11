package com.example.jsonExam.weather;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
public class WeatherService {

    private final RestTemplate restTemplate = new RestTemplate();

    private static final String API_URL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
    private static final String API_KEY = "83J%2BZlSbumSCc2rBcCipXddnGvjm7eTJIpu6ZFEJFY3BV2SqHP3VsxxsXK3m5jQhb8D%2FoXKVulq5Gv4xzLu72Q%3D%3D";
    private static final String PAGE_NO = "1";
    private static final String PAGE_SIZE = "100";

    public WeatherModel.WeatherResponse getUltraSrtNcst() throws URISyntaxException {
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String baseTime = getNearestBaseTime();

        URI uri = new URI(API_URL +
                "?serviceKey=" + API_KEY +
                "&numOfRows=" + PAGE_SIZE +
                "&pageNo=" + PAGE_NO +
                "&base_date=" + date +
                "&base_time=" + baseTime +
                "&nx=60&ny=127" +   // 서울 종로구 기준 좌표
                "&dataType=JSON");

        WeatherModel.WeatherSearchData weather = restTemplate.getForObject(uri, WeatherModel.WeatherSearchData.class);

        if (weather == null || weather.getWeatherItems() == null) {
            return new WeatherModel.WeatherResponse("N/A", "N/A", "N/A", LocalDate.now().toString());
        }

        List<WeatherModel.WeatherItem> items = weather.getWeatherItems();

        String temp = getWeatherInfo(items, "TMP");
        String humidity = getWeatherInfo(items, "REH");
        String wind = getWeatherInfo(items, "WSD");

        return new WeatherModel.WeatherResponse(temp, humidity, wind, LocalDate.now().toString());
    }

    // 가장 가까운 base_time (기상청 기준: 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300)
    private String getNearestBaseTime() {
        String[] baseTimes = {"2300", "2000", "1700", "1400", "1100", "0800", "0500", "0200"};
        LocalTime now = LocalTime.now();

        for (String base : baseTimes) {
            LocalTime baseTime = LocalTime.parse(base, DateTimeFormatter.ofPattern("HHmm"));
            if (now.isAfter(baseTime)) {
                return base;
            }
        }
        return "0200"; // 새벽 이전엔 0200 고정
    }

    private String getWeatherInfo(List<WeatherModel.WeatherItem> items, String category) {
        return items.stream()
                .filter(i -> i.getCategory().equals(category))
                .map(WeatherModel.WeatherItem::getFcstValue)
                .findFirst()
                .orElse("N/A");
    }
}
