package com.musclebeach.product.controller;

import com.musclebeach.common.util.ApplicationContextUtil;
import com.musclebeach.product.model.service.ProductService;
import org.springframework.context.ApplicationContext;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/front-end/shop/showImg")
public class ShowImgServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ApplicationContext context = ApplicationContextUtil.getContext();
    private final ProductService productServiceFront = context.getBean(ProductService.class);

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        Integer proID = Integer.parseInt(req.getParameter("proID"));
        ServletOutputStream out = res.getOutputStream();
        res.setContentType("image/jpg");
        res.setContentLength(productServiceFront.findProductImg(proID).length);
        out.write(productServiceFront.findProductImg(proID));
        out.close();
    }
}
