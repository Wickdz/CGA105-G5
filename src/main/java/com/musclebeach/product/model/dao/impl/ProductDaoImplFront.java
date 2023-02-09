package com.musclebeach.product.model.dao.impl;

import com.musclebeach.product.model.dao.ProductDao;
import com.musclebeach.product.model.entity.Product;
import com.musclebeach.product.model.entity.ProductImg;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.PersistenceContext;
import java.util.List;

@Repository("ProductDaoImplFront")
public class ProductDaoImplFront implements ProductDao {
    @PersistenceContext
    Session session;

    @Override
    public Product getById(Integer id) {

        return session.get(Product.class, id);
    }

    @Override
    public Integer add(Product t) {

        return null;
    }

    @Override
    public List<Product> getAll() {
        final String hql = "From Product";
        return session.createQuery(hql, Product.class).list();
    }

    @Override
    public List<Product> selectByProdType(Integer prodType) {
        final String hql = "From Product Where typeID = :prodType";
        return session.createQuery(hql, Product.class).setParameter("prodType", prodType).list();
    }

    @Override
    public List<Product> selectByKeyword(String keyword) {
        final String hql = "From Product Where proName like :keyword";
        return session.createQuery(hql, Product.class).setParameter("keyword", "%" + keyword + "%").list();
    }

    @Override
    public void updateWithProd_IMG(Product product, ProductImg productImgs) {

    }

    @Override
    public void update(Product product) {

    }

    @Override
    public void delete(Integer prodID) {

    }

    @Override
    public void insertWithProd_IMG(Product product, List<ProductImg> list) {

    }
}
