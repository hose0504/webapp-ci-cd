package com.example.jsonExam.shop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory; // LoggerFactory를 위한 import
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ShopController {

    // 1. Logger를 직접 선언하고 초기화합니다.
    private static final Logger log = LoggerFactory.getLogger(ShopController.class);

    // 2. final 필드인 ShopService를 생성자를 통해 주입받습니다.
    private final ShopService shopService;

    // 3. @RequiredArgsConstructor 대신 직접 생성자를 선언합니다.
    public ShopController(ShopService shopService) {
        this.shopService = shopService;
    }

    /**
     * 바나나 구매 페이지 이동
     */
    @GetMapping("/shop")
    public String shop() {
        return "shop"; // → /jsp/shop.jsp
    }

    /**
     * 간단한 주문 처리 (AJAX)
     */
    @PostMapping("/shop")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> submitOrder(@RequestParam String customerName,
                                                         @RequestParam String orderId) {
        Map<String, Object> response = new HashMap<>();

        try {
            log.info("주문 요청 - 이름: {}, 주문번호: {}", customerName, orderId);

            // Lombok의 builder() 대신, SimpleOrderDto의 생성자를 사용하거나 setter를 사용합니다.
            // 아래는 SimpleOrderDto에 (String customerName, String orderId) 생성자가 있다고 가정합니다.
            SimpleOrderDto order = new SimpleOrderDto(customerName, orderId);

            // 만약 SimpleOrderDto에 인자를 받는 생성자가 없다면,
            // 기본 생성자 후 setter를 사용해야 합니다:
            // SimpleOrderDto order = new SimpleOrderDto();
            // order.setCustomerName(customerName);
            // order.setOrderId(orderId);

            shopService.saveSimpleOrder(order);

            response.put("success", true);
            response.put("orderId", orderId);
            response.put("message", "구매가 완료되었습니다!");

            log.info("주문 저장 완료: {}", orderId);
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            log.error("주문 처리 중 오류 발생", e);
            response.put("success", false);
            response.put("message", "주문 처리 중 오류가 발생했습니다");
            return ResponseEntity.badRequest().body(response);
        }
    }
}