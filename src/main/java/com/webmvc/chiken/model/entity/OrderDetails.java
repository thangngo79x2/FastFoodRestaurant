package com.webmvc.chiken.model.entity;

public class OrderDetails {
    private String total;
    public OrderDetails(String total) {
        this.total = total;
    }
    public void setTotal(String total) {
        this.total = total;
    }

    public String getTotal() {
        return total;
    }
}
