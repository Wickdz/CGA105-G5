package com.musclebeach.order.controller;


import com.musclebeach.common.util.ApplicationContextUtil;
import com.musclebeach.order.model.entity.OrderMaster;
import com.musclebeach.order.model.service.DetailService;
import com.musclebeach.order.model.service.MasterService;
import org.springframework.context.ApplicationContext;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/front-end/order/view"})
public class ViewOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ApplicationContext context = ApplicationContextUtil.getContext();
    private final DetailService detailService = context.getBean(DetailService.class);
    private final MasterService masterService = context.getBean(MasterService.class);

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        /***************************1.接收請求參數****************************************/
        Integer memID = Integer.valueOf(req.getParameter("memID"));
        /***************************2.開始查詢資料****************************************/
        OrderMaster orderVO = masterService.getOneMasterByMem(memID);

        /***************************3.查詢完成,準備轉交(Send the Success view)************/
        req.setAttribute("orderVO", orderVO);         // 資料庫取出的detailVO物件,存入req
        String url = "/front-end/product/memOrderDetail.jsp";
        RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listAllOrderDetail.jsp
        successView.forward(req, res);

    }
}
