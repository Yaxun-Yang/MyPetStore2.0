package org.csu.myPetStore.persistence;

import org.csu.myPetStore.domain.Cart;

public interface CartDAO {



    void insertCart(Cart cart);
    Cart getCart(String username);

}
