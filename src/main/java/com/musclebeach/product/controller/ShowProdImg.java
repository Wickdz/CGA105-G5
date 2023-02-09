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
import java.io.InputStream;

@WebServlet("/back-end/product/ShowProdImg")
public class ShowProdImg extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ApplicationContext context = ApplicationContextUtil.getContext();
    ProductService productService = context.getBean(ProductService.class);

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("image/gif");
        ServletOutputStream out = response.getOutputStream();


        try {
            Integer proID = Integer.valueOf(request.getParameter("proID"));

            out.write(productService.getOneProdIMG(proID).getProImg());

        } catch (Exception e) {
            e.printStackTrace();
            InputStream in = getServletContext().getResourceAsStream("/back-end/product/images/nopic.png");
            byte[] buf = new byte[in.available()];
            in.read(buf);
            out.write(buf);
            in.close();
        }
    }

}
