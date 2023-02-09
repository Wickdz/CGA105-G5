package com.musclebeach.cart.service;

import com.musclebeach.backstage.entity.Member;
import com.musclebeach.cart.entity.CartItem;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CartService {
    void changeInCart(Member member, CartItem cartItem);

    void deleteInCart(Member member, CartItem cartItem);

    List<CartItem> getAllInCartByMemID(Member member);
}
