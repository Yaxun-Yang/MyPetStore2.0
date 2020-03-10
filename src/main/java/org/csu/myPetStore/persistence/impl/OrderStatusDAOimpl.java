package org.csu.myPetStore.persistence.impl;

import org.csu.myPetStore.persistence.DBUtil;
import org.csu.myPetStore.persistence.OrderStatusDAO;
import org.csu.myPetStore.domain.Order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

public class OrderStatusDAOimpl implements OrderStatusDAO {
    public static final String CREATE_NEW_ORDER="INSERT INTO ORDERSTATUS (ORDERID , TIMESTAMP, STATUS) VALUES (?,?,?)";
    public static final String ORDER_PAID = "UPDATE ORDERSTATUS SET STATUS = ? WHERE ORDERID = ?";
    @Override
    public void CreateNewOrder(Order order) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_NEW_ORDER);

            preparedStatement.setInt(1,order.getOrderId());
            Date sqlDate = new Date(order.getOrderDate().getTime());
            preparedStatement.setDate(2,sqlDate);
            preparedStatement.setString(3,"Not Paid");

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void OrderPaid(Order order) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ORDER_PAID);

            preparedStatement.setInt(2,order.getOrderId());

            preparedStatement.setString(1,"Paid");

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
