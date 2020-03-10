package org.csu.myPetStore.persistence.impl;

import org.csu.myPetStore.persistence.CartItemDAO;
import org.csu.myPetStore.persistence.DBUtil;
import org.csu.myPetStore.domain.Cart;
import org.csu.myPetStore.domain.CartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartItemDAOimpl implements CartItemDAO {
    private static final String GET_CART_ITEM_LIST = "SELECT ITEMID, QUANTITY FROM CARTITEM WHERE CARTID =?";
    private static final String INSERT_ITEM ="INSERT INTO CARTITEM (CARTID, ITEMID, QUANTITY) VALUES (?,?,?)";
    private static final String DELETE_ITEM = "DELETE FROM CARTITEM WHERE CARTID = ? AND ITEMID =?";
    private static final String UPDATE_QUANTITY = "UPDATE CARTITEM SET QUANTITY = ? WHERE CARTID= ? AND ITEMID = ?";
    private static final String GET_QUANTITY = "SELECT QUANTITY FROM CARTITEM WHERE CARTID =? AND ITEMID =?";
    private static final String CLEAR = "DELETE FROM CARTITEM WHERE CARTID = ?";

    @Override
    public List<CartItem> getCartItemList(Cart cart) {
        List<CartItem> itemList = new ArrayList<CartItem>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CART_ITEM_LIST);
            preparedStatement.setInt(1,cart.getCartId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                CartItem cartItem = new CartItem();
                cartItem.setItemId(resultSet.getString(1));
                cartItem.setQuantity(resultSet.getInt(2));

                itemList.add(cartItem);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return itemList;
    }

    @Override
    public void insertItem(Cart cart, String itemId) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ITEM);

            preparedStatement.setInt(1,cart.getCartId());
            preparedStatement.setString(2,itemId);
            preparedStatement.setInt(3,1);

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteItem(Cart cart, String itemId) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ITEM);

            preparedStatement.setInt(1,cart.getCartId());
            preparedStatement.setString(2,itemId);

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void updateQuantity(Cart cart, String itemId, int quantity) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_QUANTITY);

            preparedStatement.setInt(2,cart.getCartId());
            preparedStatement.setString(3,itemId);
            preparedStatement.setInt(1,quantity);

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getQuantity(Cart cart, String itemId) {
        int result = -1;
        try
        {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_QUANTITY);
            preparedStatement.setInt(1,cart.getCartId());
            preparedStatement.setString(2,itemId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
            {
                result = resultSet.getInt(1);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public void clearCart(Cart cart) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CLEAR);


            preparedStatement.setInt(1,cart.getCartId());

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
