package org.csu.myPetStore.persistence;


import org.csu.myPetStore.domain.Order;

public interface OrderStatusDAO {
   void  CreateNewOrder(Order order);
   void  OrderPaid(Order order);
}
