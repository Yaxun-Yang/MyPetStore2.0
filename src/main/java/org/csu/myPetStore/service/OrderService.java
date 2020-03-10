package org.csu.myPetStore.service;

import org.csu.myPetStore.domain.LineItem;
import org.csu.myPetStore.domain.Order;
import org.csu.myPetStore.persistence.*;
import org.csu.myPetStore.persistence.impl.*;
import org.csu.myPetStore.domain.Item;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderService {

        private ItemDAO itemDAO;
        private OrderDAO orderDAO;
        private LineItemDAO lineItemDAO;
        private OrderStatusDAO orderStatusDAO;
        private SequenceDAO sequenceDAO;

        public OrderService(){
            itemDAO = new ItemDAOimpl();
            orderDAO = new OrderDAOimpl();
            lineItemDAO = new LineItemDAOimpl();
            orderStatusDAO =new OrderStatusDAOimpl();
            sequenceDAO = new SequenceDAOimpl();
        }

        public void insertOrder(Order order) {
            Map<String, Integer> param = new HashMap<String, Integer>(2);
            //System.out.println("insertOrder");

            for (int i = 0; i < order.getLineItems().size(); i++) {
                LineItem lineItem = order.getLineItems().get(i);
                String itemId = lineItem.getItemId();
                Integer increment = lineItem.getQuantity();
                param.put(itemId, increment);

            }
            itemDAO.updateInventoryQuantity(param);
            orderDAO.insertOrder(order);
            order.setOderId(sequenceDAO.getOrderNum());
            sequenceDAO.incrementOrder();
            orderStatusDAO.CreateNewOrder(order);

            for (int i = 0; i < order.getLineItems().size(); i++) {
                LineItem lineItem = order.getLineItems().get(i);
                lineItem.setOrderId(order.getOrderId());
                lineItem.setLineNumber(sequenceDAO.getLineNum());
                sequenceDAO.incrementLineItem();
                lineItemDAO.insertLineItem(lineItem);
            }

        }
        public void payForOrder(Order order)
        {
            order.setStatus("Paid");
            orderStatusDAO.OrderPaid(order);
        }
        public Order getOrder(int orderId) {
            Order order = orderDAO.getOrder(orderId);
            order.setLineItems(lineItemDAO.getLineItemsByOrderId(orderId));

            for (int i = 0; i < order.getLineItems().size(); i++) {
                LineItem lineItem =  order.getLineItems().get(i);
                Item item = itemDAO.getItem(lineItem.getItemId());
                item.setQuantity(itemDAO.getInventoryQuantity(lineItem.getItemId()));
                lineItem.setItem(item);
            }

            return order;
        }

        public List<Order> getOrdersByUsername(String username) {
            return orderDAO.getOrdersByUsername(username);
        }


}
