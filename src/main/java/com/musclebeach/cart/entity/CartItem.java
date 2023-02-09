package com.musclebeach.cart.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.musclebeach.product.model.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CartItem implements Serializable {
    private Product product;
    private Integer count;
}
