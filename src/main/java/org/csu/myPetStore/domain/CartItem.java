package org.csu.myPetStore.domain;

import java.io.Serializable;

public class CartItem implements Serializable {

  private int cartId;
  private String  itemId;
  private int quantity;

  public CartItem(){}

  public CartItem(int cartId)
  {
    this.cartId = cartId;
  }

  public int getCartId() {
    return cartId;
  }

  public String getItemId() {
    return itemId;
  }

  public void setItemId(String itemId) {
    this.itemId = itemId;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

}
