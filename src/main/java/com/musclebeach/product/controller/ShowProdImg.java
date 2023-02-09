package com.musclebeach.product.controller;

import com.musclebeach.product.model.service.ProductServiceBack;

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

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("image/gif");
        ServletOutputStream out = response.getOutputStream();


        try {
            Integer prodID = Integer.valueOf(request.getParameter("prodID"));
            ProductServiceBack prodSvc = new ProductServiceBack();

            out.write(prodSvc.getOneProdIMG(prodID).getProImg());

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
