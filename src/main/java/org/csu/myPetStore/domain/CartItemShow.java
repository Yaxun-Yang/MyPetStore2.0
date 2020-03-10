package org.csu.myPetStore.domain;

import org.csu.myPetStore.service.CatalogService;

import java.math.BigDecimal;

public class CartItemShow {
    private Item item;
    private boolean inStock;
    private int quantity;
    private BigDecimal totalCost;

    public CartItemShow(CartItem cartItem)
    {
        CatalogService catalogService;
        catalogService =new CatalogService();
        item = catalogService.getItem(cartItem.getItemId());
        inStock = catalogService.isItemInStock(cartItem.getItemId());
        quantity = cartItem.getQuantity();
        totalCost =item.getListPrice().multiply(new BigDecimal(String.valueOf(quantity)));
    }

    public BigDecimal getTotalCost() {
        return totalCost;
    }
    public int getQuantity()
    {
        return quantity;
    }
    public  Item getItem()
    {
        return item;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean getInStock()
    {
        return inStock;
    }
}


