package org.csu.mypetstore.domain;

import java.math.BigDecimal;

public class CartItem {


    private String itemId;
    private String cartId;
    private int quantity;
    private String categoryId;
    private Item item;

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }





//    private Item item;
//
//    private boolean inStock;
//    private BigDecimal total;
//
//    public boolean isInStock() {
//        return inStock;
//    }
//
//    public void setInStock(boolean inStock) {
//        this.inStock = inStock;
//    }
//
//    public BigDecimal getTotal() {
//        return total;
//    }
//
//    public Item getItem() {
//        return item;
//    }
//
//    public void setItem(Item item) {
//        this.item = item;
//        calculateTotal();
//    }
//
//
//
//    public void incrementQuantity() {
//        quantity++;
//        calculateTotal();
//    }
//
//    private void calculateTotal() {
//        if (item != null && item.getListPrice() != null) {
//            total = item.getListPrice().multiply(new BigDecimal(quantity));
//        } else {
//            total = null;
//        }
 //   }
}
