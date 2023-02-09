package com.musclebeach.product.model;

import com.musclebeach.common.config.SpringConfig;
import com.musclebeach.product.model.entity.ProductImg;
import com.musclebeach.product.model.service.ProductService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.io.IOException;

public class TestMain {
    public static void main(String[] args) throws IOException {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
        ProductService productService = context.getBean(ProductService.class);
        ProductImg productImg = new ProductImg();
        productImg.setProID(2002);
        byte[] img = productService.getOneProdIMG(2002).getProImg();
        System.out.println(img);
    }
}
