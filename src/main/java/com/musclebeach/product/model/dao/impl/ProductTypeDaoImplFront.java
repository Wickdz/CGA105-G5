package com.musclebeach.product.model.dao.impl;

import com.musclebeach.product.model.dao.ProductTypeDao;
import com.musclebeach.product.model.entity.ProductType;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("ProductTypeDaoImplFront")
public class ProductTypeDaoImplFront implements ProductTypeDao {
    @Override
    public List<ProductType> getAll() {
        return null;
    }

    @Override
    public ProductType getById(Integer id) {
        return null;
    }

    @Override
    public Integer add(ProductType t) {
        return null;
    }
}
