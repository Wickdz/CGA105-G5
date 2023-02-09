package com.musclebeach.product.model.dao.impl;

import com.musclebeach.product.model.dao.ProductImgDao;
import com.musclebeach.product.model.entity.ProductImg;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.PersistenceContext;
import java.sql.Connection;
import java.util.List;

@Repository("ProductImgDaoImplFront")
public class ProductImgDaoImplFront implements ProductImgDao {
    @PersistenceContext
    Session session;

    @Override
    public List<ProductImg> getAll() {

        return null;
    }

    @Override
    public ProductImg getById(Integer id) {

        return null;
    }

    @Override
    public Integer add(ProductImg t) {

        return null;
    }

    @Override
    public ProductImg getByProdID(Integer proID) {
        final String hql = "From ProductImg where proID = :proID";
        return session.createQuery(hql, ProductImg.class).setParameter("proID", proID).uniqueResult();
    }

    @Override
    public void insert(ProductImg prod_IMGVO) {
    }

    @Override
    public void update(ProductImg prod_IMGVO) {
    }

    @Override
    public ProductImg findByProdID(Integer proID) {
        return null;
    }

    @Override
    public void insert2(ProductImg prod_IMGVO, Connection conn) {
    }

    @Override
    public void delete(Integer prodid) {
    }

}
