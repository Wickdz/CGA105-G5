package com.musclebeach.cart.service.impl;

import com.musclebeach.cart.entity.CartItem;
import com.musclebeach.cart.mapper.CartMapper;
import com.musclebeach.cart.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService {
    @Resource
    private CartMapper cartMapper;

    @Override
    public void changeInCart(Integer memID, CartItem cartItem) {
        Integer proID = cartItem.getProID();
        Integer count = cartItem.getCount();
        cartMapper.change(memID, proID, count);
    }

    @Override
    public void deleteInCart(Integer memID, CartItem cartItem) {
        cartMapper.delete(memID, cartItem.getProID());
    }

    @Override
    public List<CartItem> getAllInCartByMemID(Integer memID) {
        Map<Integer, Integer> map = cartMapper.selectAllByID(memID);
        List<CartItem> list = new ArrayList<>();
        map.forEach((k, v) -> {
            CartItem cartItem = new CartItem();
            cartItem.setProID(k);
            cartItem.setCount(v);
            list.add(cartItem);
        });
        return list;
    }
}
