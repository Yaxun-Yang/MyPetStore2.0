package org.csu.myPetStore.domain;

import java.io.Serializable;


public class Cart  implements Serializable {

    private int cartId;
    private  String username;

  public int  getCartId() {
    return cartId;
  }

  public String getUsername() {
    return username;
  }

  public void setCartId(int cartId) {
    this.cartId = cartId;
  }

  public void setUsername(String username) {
    this.username = username;
  }
}
