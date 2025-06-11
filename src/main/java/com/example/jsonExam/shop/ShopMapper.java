package com.example.jsonExam.shop;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ShopMapper {

    // 주문 존재 여부 확인 (주문 중복 방지용)
    @Select("SELECT COUNT(*) > 0 FROM orders WHERE order_id = #{orderId}")
    boolean existsSimpleOrder(@Param("orderId") String orderId);

    // 주문 저장
    @Insert("INSERT INTO orders (order_id, customer_name, customer_phone, customer_address, quantity, total_price) " +
            "VALUES (#{orderId}, #{customerName}, #{customerPhone}, #{customerAddress}, #{quantity}, #{totalPrice})")
    void saveSimpleOrder(SimpleOrderDto dto);
}
