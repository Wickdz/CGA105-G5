package com.musclebeach.product.controller;

import com.musclebeach.common.util.ApplicationContextUtil;
import com.musclebeach.product.model.service.ProductServiceBack;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/back-end/product/ShowProdImgFront")
public class ShowProdImgFront extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductServiceBack prodSvc = ApplicationContextUtil.getContext().getBean(ProductServiceBack.class);

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("image/gif");
        ServletOutputStream out = response.getOutputStream();

        Integer prodID = Integer.valueOf(request.getParameter("prodID"));

        if (prodID <= 9) {
            try {
                out.write(prodSvc.getOneProdIMG(prodID).getProImg());
            } catch (Exception e) {

                InputStream in = getServletContext()
                        .getResourceAsStream("/back-end/product/images/product" + prodID + ".jpg");
                byte[] buf = new byte[in.available()];
                in.read(buf);
                out.write(buf);
                in.close();
                prodSvc.upload(buf, prodID);
            }
        } else {
            out.write(prodSvc.getOneProdIMG(prodID).getProImg());
        }

    }

}
