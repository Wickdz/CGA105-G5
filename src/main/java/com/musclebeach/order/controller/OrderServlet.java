package com.musclebeach.order.controller;


import com.musclebeach.common.util.ApplicationContextUtil;
import com.musclebeach.order.model.entity.OrderDetail;
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
import java.util.LinkedList;
import java.util.List;

@WebServlet({"/back-end/order/"})
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ApplicationContext context = ApplicationContextUtil.getContext();
    private final DetailService detailService = context.getBean(DetailService.class);
    private final MasterService masterService = context.getBean(MasterService.class);

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");


//		if ("listOrder_details_ByOrder".equals(action)) {
//
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//				/*************************** 1.接收請求參數 ****************************************/
//				Integer orderID = Integer.valueOf(req.getParameter("orderID"));
//
//				/*************************** 2.開始查詢資料 ****************************************/
//				MasterService orderSvc = new MasterService();
//				Set<OrderDetail> set = orderSvc.getOrder_detailsByOrder(orderID);
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//				req.setAttribute("listOrder_details_ByOrder", set);    // 資料庫取出的list物件,存入request
//
//				String url = null;
//				if ("listOrder_details_ByOrder".equals(action))
//					url = "/back-end/order_detail/listOrder_details_ByOrder.jsp";
//
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//		}

        if ("getOne_For_Update".equals(action)) {

            /***************************1.接收請求參數****************************************/
            Integer orderID = Integer.valueOf(req.getParameter("orderID"));
            /***************************2.開始查詢資料****************************************/
            OrderMaster orderVO = masterService.getOneMaster(orderID);
            /***************************3.查詢完成,準備轉交(Send the Success view)************/
            req.setAttribute("orderVO", orderVO);         // 資料庫取出的orderVO物件,存入req

            String url = "/back-end/order/updateOrderStatus.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 updateOrderStatus.jsp
            successView.forward(req, res);
            return;
        }

        if ("changeStatus".equals(action)) {

            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to send the ErrorPage view.
            req.setAttribute("errorMsgs", errorMsgs);

            /***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
            Integer orderID = Integer.valueOf(req.getParameter("orderID").trim());

            Integer orderStatus = Integer.valueOf(req.getParameter("orderStatus").trim());

            OrderMaster orderVO = new OrderMaster();
            orderVO.setOrderID(orderID);
            orderVO.setOrderStatus(orderStatus);

            /***************************2.開始修改資料*****************************************/

            orderVO = masterService.changeStatus(orderID, orderStatus);

            /***************************3.修改完成,準備轉交(Send the Success view)*************/
            req.setAttribute("orderVO", orderVO);
            String url = "/back-end/order/listAllOrder.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);
        }
        if ("getOne_For_Detail".equals(action)) {

            /***************************1.接收請求參數****************************************/
            Integer orderID = Integer.valueOf(req.getParameter("orderID"));
            /***************************2.開始查詢資料****************************************/
            List<OrderDetail> detailVO = masterService.getOneDetail(orderID);

//			for(OrderDetail order:detailVO) {
//				System.out.println("價格:" +order.getDetPrice());
//			}
            /***************************3.查詢完成,準備轉交(Send the Success view)************/
            req.setAttribute("detailVO", detailVO);         // 資料庫取出的detailVO物件,存入req
            String url = "/back-end/order/listAllOrderDetail.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listAllOrderDetail.jsp
            successView.forward(req, res);
        }
    }
}
