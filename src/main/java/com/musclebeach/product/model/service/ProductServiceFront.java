package com.musclebeach.product.model.service;

import com.musclebeach.product.model.dao.ProductDao;
import com.musclebeach.product.model.dao.ProductImgDao;
import com.musclebeach.product.model.entity.Product;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductServiceFront {
    @Qualifier("ProductDaoImplFront")
    private ProductDao daoProduct;
    @Qualifier("ProductImgDaoImplFront")
    private ProductImgDao daoProductImg;

    public Product getSpecifiedProduct(Integer prodID) {
        return daoProduct.getById(prodID);
    }

    public List<Product> findAllProduct() {
        return daoProduct.getAll();
    }

    public List<Product> findSameCategoryProduct(Integer prodType) {
        return daoProduct.selectByProdType(prodType);
    }

    public List<Product> findSpecifiedProduct(String keyword) {
        return daoProduct.selectByKeyword(keyword);
    }

    public byte[] findProductImg(Integer prodID) {
        return daoProductImg.getByProdID(prodID).getProImg();
    }

}
