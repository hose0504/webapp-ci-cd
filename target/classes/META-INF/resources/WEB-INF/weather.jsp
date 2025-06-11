<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TEAM5 날씨 게시판</title>
     <style>
        /* Font & Box-reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Malgun Gothic', sans-serif;
        }

        /* Body background: Gros Michel 스타일 그라데이션 */
        body {
            background: linear-gradient(135deg, #fffef7 0%, #fefcf0 50%, #fdf8e1 100%);
            min-height: 100vh;
            color: #222;
        }

        .container {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
            padding: 0 20px;
            position: relative;
            z-index: 1;
        }

        /* Header: 노란색 그라데이션 */
        header {
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            padding: 15px 0;
            box-shadow: 0 2px 10px rgba(244, 224, 77, 0.3);
            position: relative;
        }
        
        .logo {
            color: #8b6914;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
        }

        /* 뒤로가기 버튼 */
        .back-btn {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            background-color: white;
            color: #8b6914;
            border: 1px solid #8b6914;
            padding: 8px 16px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.2s;
        }
        .back-btn:hover {
            background-color: #f5f5f5;
        }

        /* Navigation bar: 반투명 흰 배경 + 블러 */
        .nav {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            padding: 10px 20px;
            box-shadow: 0 2px 8px rgba(244, 224, 77, 0.2);
        }
        .nav .container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .nav-links {
            display: flex;
            list-style: none;
            margin: 0 auto;
        }
        .nav-links li {
            margin: 0 20px;
        }
        .nav-links a {
            text-decoration: none;
            color: #8b6914;
            font-size: 15px;
            font-weight: 500;
            position: relative;
        }
        .nav-links a:hover,
        .nav-links a.active {
            color: #c49a1a;
            font-weight: bold;
        }
        .nav-links a.active:after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 3px;
            background-color: #c49a1a;
        }

        /* 날씨 카드 및 게시판 스타일 공통 */
        .weather-container {
            margin: 30px 0;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .weather-card {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(8px);
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            padding: 20px;
            text-align: center;
            width: 48%;
            border: 1px solid rgba(244, 224, 77, 0.2);
        }
        @media (max-width: 768px) {
            .weather-card {
                width: 100%;
            }
        }
        .weather-card h2 {
            color: #8b6914;
            margin-bottom: 15px;
            font-size: 18px;
            padding-bottom: 10px;
            border-bottom: 1px solid #f0f0f0;
        }
        .weather-icon {
            font-size: 60px;
            margin: 10px 0;
        }
        .temp {
            font-size: 36px;
            font-weight: bold;
            margin: 10px 0;
            color: #8b6914;
        }
        .details {
            color: #666;
            line-height: 1.6;
        }

        /* 게시판 영역 */
        .board {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(8px);
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(244, 224, 77, 0.15);
            padding: 20px;
            margin-bottom: 30px;
            border: 1px solid rgba(244, 224, 77, 0.2);
        }
        .board-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .board-title {
            font-size: 20px;
            font-weight: bold;
            color: #8b6914;
        }
        .write-btn {
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            color: #8b6914;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s;
        }
        .write-btn:hover {
            background: linear-gradient(135deg, #f7e83b, #f4e04d);
        }

        .search-container {
            margin: 20px 0;
            text-align: center;
        }
        .search-input {
            width: 300px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        .search-btn {
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            color: #8b6914;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            margin-left: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.2s;
        }
        .search-btn:hover {
            background: linear-gradient(135deg, #f7e83b, #f4e04d);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        thead th {
            background: rgba(255, 254, 247, 0.8);
            padding: 12px;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            color: #8b6914;
            font-size: 14px;
        }
        tbody td {
            padding: 14px 12px;
            border-bottom: 1px solid #eee;
            color: #555;
            font-size: 14px;
        }
        tbody tr:hover {
            background-color: #fefcf0;
        }

        .pagination {
            margin: 30px 0 10px;
            text-align: center;
        }
        .pagination a {
            display: inline-block;
            padding: 6px 12px;
            margin: 0 2px;
            color: #555;
            text-decoration: none;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: all 0.2s;
        }
        .pagination a.active {
            background: linear-gradient(135deg, #f4e04d, #f7e83b);
            color: #8b6914;
            border-color: #f7e83b;
        }
        .pagination a:hover:not(.active) {
            background-color: #fefcf0;
        }

        /* 주간 예보 테이블 스타일 */
        .weekly-forecast {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .weekly-forecast tr {
            border-bottom: 1px solid #f0f0f0;
        }
        .weekly-forecast tr:last-child {
            border-bottom: none;
        }
        .weekly-forecast td {
            padding: 12px 8px;
            text-align: center;
            font-size: 14px;
            color: #8b6914;
        }
        .weekly-forecast td:first-child {
            font-weight: bold;
            color: #8b6914;
        }
        .weather-emoji {
            font-size: 24px;
            margin: 5px 0;
        }

        /* 알림 배너 */
        .alert-banner {
            background: rgba(255, 254, 247, 0.8);
            border: 1px solid #f4e04d;
            border-radius: 8px;
            padding: 12px 20px;
            margin: 20px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .alert-banner p {
            color: #8b6914;
            font-size: 14px;
        }
        .alert-banner button {
            background: none;
            border: none;
            color: #c49a1a;
            font-weight: bold;
            cursor: pointer;
        }

        /* Footer */
        footer {
            background: linear-gradient(135deg, #8b6914, #c49a1a);
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <button class="back-btn" onclick="location.href='http://www.team5.click/project1/template'">◀ 돌아가기</button>
        <h1 class="logo">TEAM5 날씨 게시판</h1>
    </div>
</header>

<nav class="nav">
    <div class="container">
        <ul class="nav-links">
            <li><a href="#" class="active"><spring:message code="menu.weather.info" /></a></li>
            <li><a href="#"><spring:message code="menu.forecast" /></a></li>
            <li><a href="#"><spring:message code="menu.dust" /></a></li>
            <li><a href="#"><spring:message code="menu.typhoon" /></a></li>
            <li><a href="#"><spring:message code="menu.community" /></a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <!-- 알림 배너 -->
    <div class="alert-banner">
        <p>📢 <spring:message code="alert.banner" /></p>
        <button><spring:message code="button.detail" /></button>
    </div>

    <div class="weather-container">
        <div class="weather-card">
            <h2><spring:message code="section.current.weather" /></h2>
            <div class="weather-icon">
                ⛅
            </div>
            <div class="temp">${weatherData.temp}°C</div>
            <div class="details">
                <p><spring:message code="label.humidity" />: ${weatherData.moisture}% | <spring:message code="label.wind.speed" />: ${weatherData.windSpeed}m/s</p>
                <p><strong><spring:message code="label.location.seoul" /></strong></p>
                <p>${weatherData.date}</p>
            </div>
        </div>

        <div class="weather-card">
            <h2><spring:message code="section.weekly.forecast" /></h2>
            <table class="weekly-forecast">
                <tr>
                    <td><spring:message code="day.today" /></td>
                    <td><div class="weather-emoji">☀️</div></td>
                    <td>${weeklyForecast[0].highTemp}°C / ${weeklyForecast[0].lowTemp}°C</td>
                </tr>
                <tr>
                    <td><spring:message code="day.tomorrow" /></td>
                    <td><div class="weather-emoji">⛅</div></td>
                    <td>${weeklyForecast[1].highTemp}°C / ${weeklyForecast[1].lowTemp}°C</td>
                </tr>
                <tr>
                    <td><spring:message code="day.thursday" /></td>
                    <td><div class="weather-emoji">🌧️</div></td>
                    <td>${weeklyForecast[2].highTemp}°C / ${weeklyForecast[2].lowTemp}°C</td>
                </tr>
                <tr>
                    <td><spring:message code="day.friday" /></td>
                    <td><div class="weather-emoji">⛅</div></td>
                    <td>${weeklyForecast[3].highTemp}°C / ${weeklyForecast[3].lowTemp}°C</td>
                </tr>
                <tr>
                    <td><spring:message code="day.saturday" /></td>
                    <td><div class="weather-emoji">☀️</div></td>
                    <td>${weeklyForecast[4].highTemp}°C / ${weeklyForecast[4].lowTemp}°C</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="board">
        <div class="board-header">
            <div class="board-title"><spring:message code="board.title" /></div>
            <button class="write-btn"><spring:message code="button.write" /></button>
        </div>
        
        <div class="search-container" style="text-align: center;">
            <form action="search.jsp" method="get">
                <input type="text" name="keyword" class="search-input" placeholder="<spring:message code='placeholder.search' />">
                <button type="submit" class="search-btn"><spring:message code="button.search" /></button>
            </form>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th width="8%"><spring:message code="table.header.no" /></th>
                    <th width="52%"><spring:message code="table.header.title" /></th>
                    <th width="15%"><spring:message code="table.header.writer" /></th>
                    <th width="15%"><spring:message code="table.header.date" /></th>
                    <th width="10%"><spring:message code="table.header.views" /></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>5</td>
                    <td style="text-align: left;"><a href="#">내일 강남 지역 우산 챙기세요! 오후부터 비 예상</a> <span style="color: #03c75a; font-size: 12px;">[3]</span></td>
                    <td>기상알리미</td>
                    <td>2025.03.18</td>
                    <td>42</td>
                </tr>
                <!-- 반복 생략 -->
            </tbody>
        </table>
        
        <div class="pagination" style="text-align: center;">
            <a href="#">&laquo;</a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">&raquo;</a>
        </div>
    </div>
</div>

</body>
</html>
