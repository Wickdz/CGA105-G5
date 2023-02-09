package com.musclebeach.product.model.service;

import com.musclebeach.product.model.dao.ProductImgDao;
import com.musclebeach.product.model.entity.ProductImg;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductImgServiceBack {
    @Qualifier("ProductDaoImplBack")
    private ProductImgDao dao;

    public ProductImg getOneProdID(Integer prodID) {
        return dao.getById(prodID);
    }

    public ProductImg insertImg(Integer prodID, byte[] proImg) {
        ProductImg productImg = new ProductImg();

        productImg.setProImg(proImg);
        productImg.setImgID(prodID);
        dao.add(productImg);

        return productImg;
    }
}
