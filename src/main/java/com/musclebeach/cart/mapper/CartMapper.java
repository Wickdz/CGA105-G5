package com.musclebeach.cart.mapper;

import com.musclebeach.product.model.entity.Product;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Map;

@Repository
public class CartMapper {
    @Resource
    HashOperations<Integer, Product, Integer> operations;

    public void change(Integer memID, Product product, Integer count) {
        operations.put(memID, product, count);
    }

    public void delete(Integer memID, Product product) {
        operations.delete(memID, product);
    }

    public Map<Product, Integer> selectAllByID(Integer memID) {
        return operations.entries(memID);
    }
}
