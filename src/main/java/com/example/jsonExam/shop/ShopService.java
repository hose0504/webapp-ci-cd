package com.example.jsonExam.shop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
public class ShopService {

	private final ShopMapper shopMapper;

    public ShopService(ShopMapper shopMapper) {
        this.shopMapper = shopMapper;
    }

    public void saveSimpleOrder(SimpleOrderDto dto) {
        if (shopMapper.existsSimpleOrder(dto.getOrderId())) {
            throw new RuntimeException("중복된 주문번호입니다.");
        }
        shopMapper.saveSimpleOrder(dto);
    }
}