package com.musclebeach.product.controller;

import com.musclebeach.common.util.ApplicationContextUtil;
import com.musclebeach.product.model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

@WebServlet({"/back-end/product/ShowProdImg", "/front-end/product/ShowProdImg"})
public class ShowProdImg extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductService prodSvc = ApplicationContextUtil.getContext().getBean(ProductService.class);

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("image/gif");
        ServletOutputStream out = response.getOutputStream();

        Integer proID = Integer.valueOf(request.getParameter("proID"));

        try {
            out.write(prodSvc.getOneProdIMG(proID).getProImg());
        } catch (Exception e) {

            InputStream in = getServletContext()
                    .getResourceAsStream("/back-end/product/images/product" + proID + ".jpg");
            byte[] buf = new byte[in.available()];
            in.read(buf);
            out.write(buf);
            in.close();
            prodSvc.upload(buf, proID);
        }

    }

}
