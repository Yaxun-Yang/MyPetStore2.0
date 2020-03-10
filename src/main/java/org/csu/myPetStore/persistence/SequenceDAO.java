package org.csu.myPetStore.persistence;

public interface SequenceDAO {
    int getLineNum();
    void incrementLineItem();
    int getOrderNum();
    void incrementOrder();
    int getCartNum();
    void incrementCart();
}
