package org.csu.myPetStore.persistence;

import org.csu.myPetStore.domain.LineItem;

import java.util.List;

public interface LineItemDAO {
    List<LineItem> getLineItemsByOrderId(int orderId);

    void insertLineItem(LineItem lineItem);
}
