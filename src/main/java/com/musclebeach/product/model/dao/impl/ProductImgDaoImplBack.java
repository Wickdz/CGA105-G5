package com.musclebeach.product.model.dao.impl;

import com.musclebeach.product.model.dao.ProductImgDao;
import com.musclebeach.product.model.entity.ProductImg;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.PersistenceContext;
import java.sql.Connection;
import java.util.List;

@Repository("ProductImgDaoImplBack")
public class ProductImgDaoImplBack implements ProductImgDao {
    @PersistenceContext
    Session session;

    @Override
    public List<ProductImg> getAll() {
        String hql = "FROM ProductImg";
        return session.createQuery(hql, ProductImg.class).list();
    }

    @Override
    public ProductImg getById(Integer ID) {
        return session.get(ProductImg.class, ID);
    }

    @Override
    public Integer add(ProductImg productImg) {
        session.persist(productImg);
        return productImg.getImgID();
    }

    @Override
    public void insert(ProductImg prod_IMGVO) {
        session.save(prod_IMGVO);

    }

    @Override
    public void update(ProductImg prod_IMGVO) {

    }

    @Override
    public ProductImg findByProdID(Integer prodID) {
//		ProductImg productImg = new ProductImg();
//		productImg.setProdID(prodID);
//		productImg.setImgFile(null);
//		productImg.setImgID(prodID);
//

        return session.get(ProductImg.class, prodID);
    }

    @Override
    public void insert2(ProductImg prod_IMGVO, Connection conn) {

    }

    @Override
    public void delete(Integer prodid) {
        ProductImg productImg = new ProductImg();
        productImg.setProID(prodid);
        session.delete(prodid);
    }


    @Override
    public ProductImg getByProdID(Integer prodID) {

        return null;
    }

}
