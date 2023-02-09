package com.musclebeach.product.model.service;

import com.musclebeach.product.model.dao.ProductTypeDao;
import com.musclebeach.product.model.entity.ProductType;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductTypeServiceBack {
    @Qualifier("ProductTypeDaoImplBack")
    private ProductTypeDao dao;

    public List<ProductType> getAll() {
        return dao.getAll();
    }

    public ProductType getOneProdType(Integer prodTypeID) {
        return dao.getById(prodTypeID);
    }

    public ProductType addProdType(String typeName) {

        ProductType productType = new ProductType();

        productType.setTypeName(typeName);
        dao.add(productType);

        return productType;
    }
}
