package com.musclebeach.cart.controller;

import com.musclebeach.cart.entity.CartItem;
import com.musclebeach.cart.entity.CartProduct;
import com.musclebeach.cart.service.CartProductService;
import com.musclebeach.cart.service.CartService;
import com.musclebeach.common.controller.Code;
import com.musclebeach.common.controller.Result;
import com.musclebeach.mem.model.MemVO;
import com.musclebeach.product.model.service.ProductService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/carts")
public class CartController {
    @Resource
    private CartService cartService;
    @Resource
    private ProductService productService;
    @Resource
    private CartProductService cartProductService;

    @GetMapping
    public Result getAll(HttpServletRequest request) {
        MemVO memVO = (MemVO) request.getSession().getAttribute("memVO");
        Integer memID = -1;
        if (memVO != null) {
            memID = memVO.getMemID();
        }
        List<CartItem> allInCartByMemID = cartService.getAllInCartByMemID(memID);
        List<CartProduct> cartProductList = cartProductService.getCartProduct(allInCartByMemID);
        Integer code = cartProductList.isEmpty() ? Code.READ_OK : Code.READ_ERR;
        String msg = cartProductList.isEmpty() ? "查詢成功" : "查詢失敗";
        return new Result(code, cartProductList, msg);
    }

    @PostMapping
    public Result addInCart(@RequestBody List<CartItem> cartItems, HttpServletRequest request) {
        MemVO memVO = (MemVO) request.getSession().getAttribute("memVO");
        Integer memID = -1;
        if (memVO != null) {
            memID = memVO.getMemID();
        }
        for (CartItem cartItem : cartItems) {
            cartService.changeInCart(memID, cartItem);
        }
        return new Result(Code.CREATE_OK, true, "成功");
    }

    @DeleteMapping
    public Result deleteInCart(@RequestBody List<CartItem> cartItems, HttpServletRequest request) {
        MemVO memVO = (MemVO) request.getSession().getAttribute("memVO");
        Integer memID = -1;
        if (memVO != null) {
            memID = memVO.getMemID();
        }
        for (CartItem cartItem : cartItems) {
            cartService.deleteInCart(memID, cartItem);
        }
        return new Result(Code.DELETE_OK, true, "成功");
    }
}
