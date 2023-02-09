package com.musclebeach.product.controller;


import com.musclebeach.common.util.ApplicationContextUtil;
import com.musclebeach.product.model.entity.Product;
import com.musclebeach.product.model.service.ProductServiceFront;
import org.springframework.context.ApplicationContext;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/front-end/shop/category", "/front-end/shop/search", "/front-end/shop/detail"})
public class ViewProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ApplicationContext context = ApplicationContextUtil.getContext();
    private final ProductServiceFront productServiceFront = context.getBean(ProductServiceFront.class);

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

//		search by category
        if (req.getParameter("typeID") != null) {

            Integer typeID = Integer.parseInt(req.getParameter("typeID"));
            List<Product> list = productServiceFront.findSameCategoryProduct(typeID);

            req.setAttribute("list", list);
            RequestDispatcher successView = req.getRequestDispatcher("/front-end/shop/searchByCategory.jsp");
            successView.forward(req, res);
        }

//		search by keyword
        if (req.getParameter("keyword") != null) {

            String keyword = req.getParameter("keyword");
            List<Product> list = productServiceFront.findSpecifiedProduct(keyword);
            System.out.println(list.size());
            req.setAttribute("list", list);
            RequestDispatcher successView = req.getRequestDispatcher("/front-end/shop/searchByKeyword.jsp");
            successView.forward(req, res);
        }

//		view product detail
        if (req.getParameter("prodID") != null) {

            Integer prodID = Integer.parseInt(req.getParameter("prodID"));
            Product product = productServiceFront.getSpecifiedProduct(prodID);
            req.setAttribute("product", product);
            RequestDispatcher successView = req.getRequestDispatcher("/front-end/shop/productDetail.jsp");
            successView.forward(req, res);
        }
    }
}
