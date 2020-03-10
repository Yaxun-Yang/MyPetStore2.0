package org.csu.myPetStore.persistence.impl;

import org.csu.myPetStore.persistence.DBUtil;
import org.csu.myPetStore.persistence.LogDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LogDAOimpl implements LogDAO {
    private static final String INSERT_NEW_LOG = "INSERT INTO LOG (USERNAME ,LOGDATE, LOGTYPE , OBJECTID) VALUES (?,?,?,?)";
    @Override
    public void insertNewLog(String username, String logType, String objectId) {
        try {

           // System.out.println(username);
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_LOG);

            Date date= new Date();
            String sqlDate;
            sqlDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,sqlDate);
            preparedStatement.setString(3,logType);
            preparedStatement.setString(4,objectId);

            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
