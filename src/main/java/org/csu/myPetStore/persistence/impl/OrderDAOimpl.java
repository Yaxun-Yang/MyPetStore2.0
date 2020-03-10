package org.csu.myPetStore.persistence.impl;

import org.csu.myPetStore.persistence.DBUtil;
import org.csu.myPetStore.persistence.OrderDAO;
import org.csu.myPetStore.domain.Order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOimpl implements OrderDAO {
    private static final String GET_ORDER = "select BILLADDR1 AS billAddress1, BILLADDR2 AS billAddress2," +
            " BILLCITY, BILLCOUNTRY, BILLSTATE, BILLTOFIRSTNAME, BILLTOLASTNAME, BILLZIP, SHIPADDR1 AS shipAddress1," +
            " SHIPADDR2 AS shipAddress2, SHIPCITY, SHIPCOUNTRY, SHIPSTATE, SHIPTOFIRSTNAME, SHIPTOLASTNAME, SHIPZIP," +
            " CARDTYPE, COURIER, CREDITCARD, EXPRDATE AS expiryDate, LOCALE, ORDERDATE, ORDERS.ORDERID, TOTALPRICE," +
            " USERID AS username, STATUS FROM ORDERS, ORDERSTATUS WHERE ORDERS.ORDERID = ? " +
            "AND ORDERS.ORDERID = ORDERSTATUS.ORDERID";
    private static final String GET_ORDER_BY_USERNAME =
            "select BILLADDR1 AS billAddress1, BILLADDR2 AS billAddress2," +
            " BILLCITY, BILLCOUNTRY, BILLSTATE, BILLTOFIRSTNAME, BILLTOLASTNAME, BILLZIP, SHIPADDR1 AS shipAddress1," +
            " SHIPADDR2 AS shipAddress2, SHIPCITY, SHIPCOUNTRY, SHIPSTATE, SHIPTOFIRSTNAME, SHIPTOLASTNAME, SHIPZIP," +
            " CARDTYPE, COURIER, CREDITCARD, EXPRDATE AS expiryDate, LOCALE, ORDERDATE, ORDERS.ORDERID, TOTALPRICE," +
            " USERID AS username, STATUS FROM ORDERS, ORDERSTATUS WHERE ORDERS.USERID = ? " +
            "AND ORDERS.ORDERID = ORDERSTATUS.ORDERID ORDER BY ORDERDATE";

    private static final String INSERT_ORDER =
            "INSERT INTO ORDERS ( USERID, ORDERDATE, SHIPADDR1, SHIPADDR2, SHIPCITY, SHIPSTATE," +
                    " SHIPZIP, SHIPCOUNTRY, BILLADDR1, BILLADDR2, BILLCITY, BILLSTATE, BILLZIP, BILLCOUNTRY," +
                    " COURIER, TOTALPRICE, BILLTOFIRSTNAME, BILLTOLASTNAME, SHIPTOFIRSTNAME, SHIPTOLASTNAME, " +
                    "CREDITCARD, EXPRDATE, CARDTYPE, LOCALE) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?," +
                    " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    @Override
    public List<Order> getOrdersByUsername(String username) {
        List<Order> orderList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_BY_USERNAME);
            preparedStatement.setString(1,username);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                Order order = new Order();
                order.setBillAddress1(resultSet.getString(1));
                order.setBillAddress2(resultSet.getString(2));
                order.setBillCity(resultSet.getString(3));
                order.setBillCountry(resultSet.getString(4));
                order.setBillState(resultSet.getString(5));
                order.setBillToFirstName(resultSet.getString(6));
                order.setBillToLastName(resultSet.getString(7));
                order.setBillZip(resultSet.getString(8));
                order.setShipAddress1(resultSet.getString(9));
                order.setShipAddress2(resultSet.getString(10));
                order.setShipCity(resultSet.getString(11));
                order.setShipState(resultSet.getString(12));
                order.setShipToFirstName(resultSet.getString(13));
                order.setShipToLastName(resultSet.getString(14));
                order.setShipZip(resultSet.getString(15));
                order.setCardType(resultSet.getString(16));
                order.setCourier(resultSet.getString(17));
                order.setCreditCard(resultSet.getString(18));
                order.setExpiryDate(resultSet.getString(19));
                order.setLocale(resultSet.getString(20));
                order.setOrderDate(resultSet.getDate(21));
                order.setTotalPrice(resultSet.getBigDecimal(22));
                order.setUsername(resultSet.getString(23));
                order.setStatus(resultSet.getString(24));

                orderList.add(order);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public Order getOrder(int orderId) {
        Order order = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER);
            preparedStatement.setInt(1,orderId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                order = new Order();
                order.setBillAddress1(resultSet.getString(1));
                order.setBillAddress2(resultSet.getString(2));
                order.setBillCity(resultSet.getString(3));
                order.setBillCountry(resultSet.getString(4));
                order.setBillState(resultSet.getString(5));
                order.setBillToFirstName(resultSet.getString(6));
                order.setBillToLastName(resultSet.getString(7));
                order.setBillZip(resultSet.getString(8));
                order.setShipAddress1(resultSet.getString(9));
                order.setShipAddress2(resultSet.getString(10));
                order.setShipCity(resultSet.getString(11));
                order.setShipState(resultSet.getString(12));
                order.setShipToFirstName(resultSet.getString(13));
                order.setShipToLastName(resultSet.getString(14));
                order.setShipZip(resultSet.getString(15));
                order.setCardType(resultSet.getString(16));
                order.setCourier(resultSet.getString(17));
                order.setCreditCard(resultSet.getString(18));
                order.setExpiryDate(resultSet.getString(19));
                order.setLocale(resultSet.getString(20));
                order.setOrderDate(resultSet.getDate(21));
                order.setTotalPrice(resultSet.getBigDecimal(22));
                order.setUsername(resultSet.getString(23));
                order.setStatus(resultSet.getString(24));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public void insertOrder(Order order) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER);
            preparedStatement.setString(1,order.getUsername());
            Date sqlDate = new Date(order.getOrderDate().getTime());
            preparedStatement.setDate(2, sqlDate);
            preparedStatement.setString(3,order.getShipAddress1());
            preparedStatement.setString(4,order.getShipAddress2());
            preparedStatement.setString(5,order.getShipCity());
            preparedStatement.setString(6,order.getShipState());
            preparedStatement.setString(7,order.getShipZip());
            preparedStatement.setString(8,order.getShipCountry());
            preparedStatement.setString(9,order.getBillAddress1());
            preparedStatement.setString(10,order.getBillAddress2());
            preparedStatement.setString(11,order.getBillCity());
            preparedStatement.setString(12,order.getBillState());
            preparedStatement.setString(13,order.getBillZip());
            preparedStatement.setString(14,order.getBillCountry());
            preparedStatement.setString(15,order.getCourier());
            preparedStatement.setBigDecimal(16,order.getTotalPrice());
            preparedStatement.setString(17,order.getBillToFirstName());
            preparedStatement.setString(18,order.getBillToLastName());
            preparedStatement.setString(19,order.getShipToFirstName());
            preparedStatement.setString(20,order.getShipToLastName());
            preparedStatement.setString(21,order.getCreditCard());
            preparedStatement.setString(22,order.getExpiryDate());
            preparedStatement.setString(23,order.getCardType());
            preparedStatement.setString(24,order.getLocale());

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e) {
            e.printStackTrace();
        }


    }

}
