package org.csu.myPetStore.persistence.impl;

import org.csu.myPetStore.persistence.CartDAO;
import org.csu.myPetStore.persistence.DBUtil;
import org.csu.myPetStore.persistence.SequenceDAO;
import org.csu.myPetStore.domain.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAOimpl implements CartDAO {
    private static final String INSERT_CART = "INSERT INTO CART (USERNAME) VALUES (?)";
    private static final String GET_CART_ID_BY_USERNAME ="SELECT CARTID FROM CART WHERE USERNAME = ?";
    @Override
    public void insertCart(Cart cart) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CART);

            preparedStatement.setString(1,cart.getUsername());

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }

        SequenceDAO sequenceDAO = new SequenceDAOimpl();
        cart.setCartId(sequenceDAO.getCartNum());
        sequenceDAO.incrementCart();

    }

    @Override
    public Cart getCart(String username) {
        Cart cart = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CART_ID_BY_USERNAME);

            preparedStatement.setString(1,username);

            ResultSet resultSet = preparedStatement.executeQuery();
            int num = -1;
            if (resultSet.next())
            {
                num = resultSet.getInt(1);

            }
            if(num != -1)
            {
                cart = new Cart();
                cart.setCartId(num);
                cart.setUsername(username);
              //  System.out.println(num);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }

       return cart;
    }
}
