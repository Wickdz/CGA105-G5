package com.musclebeach.order.model.entity;

import com.musclebeach.product.model.entity.Product;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "order_detail")
public class OrderDetail implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private Integer orderID;

    @ManyToOne
    @JoinColumn(name = "order_id", insertable = false, updatable = false)
    private OrderMaster orderMaster;

    @Id
    @Column(name = "pro_id")
    private Integer proID;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "pro_id", insertable = false, updatable = false)
    private Product product;

    @Column(name = "det_qty")
    private Integer detQty;
    @Column(name = "det_price")
    private Integer detPrice;

    @Override
    public String toString() {
        return "OrderDetail [orderID=" + orderID + ", orderMaster=" + orderMaster + ", proID=" + proID + ", product="
                + product + ", detQty=" + detQty + ", detPrice=" + detPrice + "]";
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Integer getProID() {
        return proID;
    }

    public void setProID(Integer proID) {
        this.proID = proID;
    }

    public Integer getDetQty() {
        return detQty;
    }

    public void setDetQty(Integer detQty) {
        this.detQty = detQty;
    }

    public Integer getDetPrice() {
        return detPrice;
    }

    public void setDetPrice(Integer detPrice) {
        this.detPrice = detPrice;
    }

    public OrderMaster getOrderMaster() {
        return orderMaster;
    }

    public void setOrderMaster(OrderMaster orderMaster) {
        this.orderMaster = orderMaster;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
