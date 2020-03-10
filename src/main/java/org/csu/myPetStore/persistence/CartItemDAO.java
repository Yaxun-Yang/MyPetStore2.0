package org.csu.myPetStore.persistence;

import org.csu.myPetStore.domain.Cart;
import org.csu.myPetStore.domain.CartItem;

import java.util.List;

public interface CartItemDAO {

    List<CartItem> getCartItemList(Cart cart);

    void insertItem(Cart cart,String itemId);

    void deleteItem(Cart cart,String itemId);

    void updateQuantity(Cart cart,String itemId,int quantity);

    int getQuantity(Cart cart, String itemId);

    void clearCart(Cart cart);


}
