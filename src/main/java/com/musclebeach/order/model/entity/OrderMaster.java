package com.musclebeach.order.model.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "order_master")
public class OrderMaster implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer orderID;
    @OneToMany(mappedBy = "orderMaster", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<OrderDetail> orderDetail;
    @Column(name = "mem_id")
    private Integer memID;
    @Column(name = "total_price")
    private Integer totalPrice;
    @Column(name = "order_rec_name")
    private String orderRecName;
    @Column(name = "order_rec_phone")
    private String orderRecPhone;
    @Column(name = "order_address")
    private String orderAddress;
    @Column(name = "order_status")
    private Integer orderStatus;
    @Column(name = "createtime", insertable = false, updatable = false)
    private Timestamp createTime;
    @Column(name = "updatetime", insertable = false)
    private Timestamp updateTime;

    @Override
    public String toString() {
        return "OrderMaster [orderID=" + orderID + ", orderDetail=" + orderDetail + ", memID=" + memID + ", totalPrice="
                + totalPrice + ", orderRecName=" + orderRecName + ", orderRecPhone=" + orderRecPhone + ", orderAddress="
                + orderAddress + ", orderStatus=" + orderStatus + ", createTime=" + createTime + ", updateTime="
                + updateTime + "]";
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Integer getMemID() {
        return memID;
    }

    public void setMemID(Integer memID) {
        this.memID = memID;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderRecName() {
        return orderRecName;
    }

    public void setOrderRecName(String orderRecName) {
        this.orderRecName = orderRecName;
    }

    public String getOrderRecPhone() {
        return orderRecPhone;
    }

    public void setOrderRecPhone(String orderRecPhone) {
        this.orderRecPhone = orderRecPhone;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public List<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

}
