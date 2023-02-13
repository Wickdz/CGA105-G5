package com.musclebeach.order.model.service;

import com.musclebeach.order.model.dao.DetailDao;
import com.musclebeach.order.model.dao.MasterDao;
import com.musclebeach.order.model.entity.OrderDetail;
import com.musclebeach.order.model.entity.OrderMaster;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional("hibernate")
public class MasterService {
    @Resource
    private MasterDao dao;
    @Resource
    private DetailDao dao1;

    public Integer addMaster(Integer memID, Integer totalPrice, String orderRecName, String orderRecPhone,
                             String orderAddress, Integer orderStatus) {

        OrderMaster orderMaster = new OrderMaster();

        orderMaster.setMemID(memID);
        orderMaster.setTotalPrice(totalPrice);
        orderMaster.setOrderRecName(orderRecName);
        orderMaster.setOrderRecPhone(orderRecPhone);
        orderMaster.setOrderAddress(orderAddress);
        orderMaster.setOrderStatus(orderStatus);

        return dao.add(orderMaster);
    }

    public void delete(Integer orderID) {
        dao.delete(orderID);
    }

    public OrderMaster getOneMaster(Integer orderID) {
        return dao.getById(orderID);
    }

    public List<OrderDetail> getOneDetail(Integer orderID) {
        return dao1.findByOrderID(orderID);
    }

    public List<OrderMaster> getAll() {
        return dao.getAll();
    }

    public OrderMaster changeStatus(Integer orderID, Integer orderStatus) {

        OrderMaster orderMaster = new OrderMaster();

        orderMaster.setOrderID(orderID);
        orderMaster.setOrderStatus(orderStatus);
        dao.updateStatus(orderMaster);
        return orderMaster;
    }
}
