package org.csu.myPetStore.service;

import org.csu.myPetStore.persistence.LogDAO;
import org.csu.myPetStore.persistence.impl.LogDAOimpl;

public class LogService {
    private LogDAO logDAO;

    public LogService()
    {
        logDAO = new LogDAOimpl();

    }

    public void viewCategory(String username,String categoryId)
    {
        logDAO.insertNewLog(username,"View Category",categoryId);
    }
    public void viewProduct(String username,String productId)
    {
       logDAO.insertNewLog(username,"View Product",productId);
    }
    public void viewItem(String username, String itemId)
    {
        logDAO.insertNewLog(username,"View Item",itemId);
    }
    public void addItem(String username,String itemId)
    {
        logDAO.insertNewLog(username,"Add Item",itemId);
    }
    public void removeItem(String username,String itemId)
    {
        logDAO.insertNewLog(username,"Remove Item",itemId);
    }
    public void createOrder(String username,String orderId)
    {
        logDAO.insertNewLog(username,"Create Order",orderId);
    }
    public void payForOrder(String username, String orderId)
    {
        logDAO.insertNewLog(username,"Pay Order",orderId);
    }



}
