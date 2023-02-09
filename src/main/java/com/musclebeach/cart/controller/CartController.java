package com.musclebeach.cart.controller;

import com.musclebeach.backstage.entity.Member;
import com.musclebeach.cart.entity.CartItem;
import com.musclebeach.cart.service.CartService;
import com.musclebeach.common.controller.Code;
import com.musclebeach.common.controller.Result;
import com.musclebeach.product.model.service.ProductService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/carts")
public class CartController {
    @Resource
    private CartService cartService;
    @Resource
    private ProductService productService;

    @GetMapping
    public Result getAll() {
        Member member = new Member();
        member.setMemID(1);
        List<CartItem> allInCartByMemID = cartService.getAllInCartByMemID(member);
        Integer code = allInCartByMemID != null ? Code.READ_OK : Code.READ_ERR;
        String msg = allInCartByMemID != null ? "查詢成功" : "查詢失敗";
        return new Result(code, allInCartByMemID, msg);
    }

    @PostMapping
    public Result addInCart(@RequestBody List<CartItem> cartItems) {
        Member member = new Member();
        member.setMemID(1);
        for (CartItem cartItem : cartItems) {
            cartService.changeInCart(member, cartItem);
        }
        return new Result(Code.CREATE_OK, true, "成功");
    }

    @DeleteMapping
    public Result deleteInCart(@RequestBody List<CartItem> cartItems) {
        Member member = new Member();
        member.setMemID(1);
        for (CartItem cartItem : cartItems) {
            cartService.deleteInCart(member, cartItem);
        }
        return new Result(Code.DELETE_OK, true, "成功");
    }
}
