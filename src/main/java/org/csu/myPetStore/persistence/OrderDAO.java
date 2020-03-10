package org.csu.myPetStore.persistence;

import org.csu.myPetStore.domain.Order;

import java.util.List;

public interface OrderDAO {
    List<Order> getOrdersByUsername(String username);

    Order getOrder(int orderId);

    void insertOrder(Order order);

}

