package com.example.jsonExam.shop;

public class SimpleOrderDto {
    private String orderId;
    private String customerName;
    private String customerPhone;
    private String customerAddress;
    private int quantity;
    private int totalPrice;

    // 👇 생성자 추가
    public SimpleOrderDto(String customerName, String orderId) {
        this.customerName = customerName;
        this.orderId = orderId;
    }

    public SimpleOrderDto() {} // 기본 생성자

    public String getOrderId() {
        return orderId;
    }
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }
    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
}
