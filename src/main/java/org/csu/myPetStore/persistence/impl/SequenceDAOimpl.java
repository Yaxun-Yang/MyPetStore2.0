package org.csu.myPetStore.persistence.impl;

import org.csu.myPetStore.persistence.DBUtil;
import org.csu.myPetStore.persistence.SequenceDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SequenceDAOimpl implements SequenceDAO {
    private static final String GET_NUM="SELECT NEXTID FROM SEQUENCE WHERE TYPENAME = ? ";
    private static final String INCREMENT="UPDATE SEQUENCE SET NEXTID = ? WHERE TYPENAME = ? ";

    @Override
    public int getLineNum() {
        int num = -1;
        try
        {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_NUM);
            preparedStatement.setString(1,"linenum");
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next())
            {
                num = resultSet.getInt(1);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public void incrementLineItem() {

        try
        {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INCREMENT);
            preparedStatement.setInt(1,getLineNum()+1);
            preparedStatement.setString(2,"linenum");

            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }

    @Override
    public int getOrderNum() {
        int num = -1;
        try
        {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_NUM);
            preparedStatement.setString(1,"ordernum");
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next())
            {
                num = resultSet.getInt(1);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public void incrementOrder() {
        try
        {
            System.out.println("increment Order");
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INCREMENT);
            preparedStatement.setInt(1,getOrderNum()+1);
            preparedStatement.setString(2,"ordernum");

            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public int getCartNum() {
        int num = -1;
        try
        {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(GET_NUM);
            preparedStatement.setString(1,"cartnum");
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next())
            {
                num = resultSet.getInt(1);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public void incrementCart() {
        try
        {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(INCREMENT);
            preparedStatement.setInt(1,getCartNum()+1);
            preparedStatement.setString(2,"cartnum");

            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
