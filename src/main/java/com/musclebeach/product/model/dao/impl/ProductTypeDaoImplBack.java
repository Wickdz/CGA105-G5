package com.musclebeach.product.model.dao.impl;

import com.musclebeach.product.model.dao.ProductTypeDao;
import com.musclebeach.product.model.entity.ProductType;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.PersistenceContext;
import java.util.List;

@Repository("ProductTypeDaoImplBack")
public class ProductTypeDaoImplBack implements ProductTypeDao {
    @PersistenceContext
    Session session;

    @Override
    public List<ProductType> getAll() {
        String hql = "FROM ProductType";
        return session.createQuery(hql, ProductType.class).list();
    }

    @Override
    public ProductType getById(Integer ID) {
        return session.get(ProductType.class, ID);
    }

    @Override
    public Integer add(ProductType ProductType) {
        session.persist(ProductType);
        return ProductType.getTypeID();
    }
}
