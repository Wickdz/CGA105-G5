package com.musclebeach.product.model.dao.impl;

import com.musclebeach.product.model.dao.ProductDao;
import com.musclebeach.product.model.entity.Product;
import com.musclebeach.product.model.entity.ProductImg;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository("ProductDaoImplBack")
public class ProductDaoImplBack implements ProductDao {
    @PersistenceContext
    Session session;

    @Override
    public List<Product> selectByProdType(Integer prodType) {
        return null;
    }

    @Override
    public List<Product> selectByKeyword(String keyword) {
        return null;
    }

    @Override
    public void updateWithProd_IMG(Product product, ProductImg productImgs) {
        String sql = "update Product p set p.pro_name = ?, p.type_id = ?, p.pro_qty = ?"
                + ", p.pro_price = ?, p.pro_content= ?, p.pro_status = ? where p.pro_id = ?";
        Query query = session.createNativeQuery(sql);
        query.setParameter(1, product.getProName());
        query.setParameter(2, product.getTypeID());
        query.setParameter(3, product.getProQty());
        query.setParameter(4, product.getProPrice());
        query.setParameter(5, product.getProContent());
        query.setParameter(6, product.getProStatus());
        query.setParameter(7, product.getProID());
        query.executeUpdate();

        String sql2 = "update product_img set pro_img= ? where pro_id = ?";
        Query query2 = session.createNativeQuery(sql2);
        query2.setParameter(1, productImgs.getProImg());
        query2.setParameter(2, product.getProID());
        query2.executeUpdate();
    }

    @Override
    public List<Product> getAll() {
        String hql = "from Product p order by proID";
        return session.createQuery(hql, Product.class).list();
    }

    @Override
    public Product getById(Integer ID) {
        return session.get(Product.class, ID);
    }

    @Override
    public Integer add(Product product) {
        session.saveOrUpdate(product);
        return product.getProID();
    }

    @Override
    public void update(Product product) {
        String sql = "update Product p set p.pro_name = ?, p.type_id = ?, p.pro_qty = ?"
                + ", p.pro_price = ?, p.pro_content= ?, p.pro_status = ? where p.pro_id = ?";
        Query query = session.createNativeQuery(sql);
        query.setParameter(1, product.getProName());
        query.setParameter(2, product.getTypeID());
        query.setParameter(3, product.getProQty());
        query.setParameter(4, product.getProPrice());
        query.setParameter(5, product.getProContent());
        query.setParameter(6, product.getProStatus());
        query.setParameter(7, product.getProID());
        query.executeUpdate();
    }

    @Override
    public void delete(Integer prodID) {
        Query query = session.createSQLQuery("delete from product_img where pro_id = ?");
        query.setParameter(1, prodID);
        query.executeUpdate();

        Query query2 = session.createSQLQuery("delete from product where pro_id = ?");
        query2.setParameter(1, prodID);
        query2.executeUpdate();
    }

    @Override
    public void insertWithProd_IMG(Product product, List<ProductImg> list) {
        session.save(product);
        for (ProductImg alist : list) {
            alist.setProID(product.getProID());
            session.saveOrUpdate(alist);
        }
    }
}
