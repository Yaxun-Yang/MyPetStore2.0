package org.csu.myPetStore.persistence;

import java.sql.*;

public class DBUtil {
    private static String drive = "com.mysql.cj.jdbc.Driver";
    private static String connectionString = "jdbc:mySQL://localhost:3306/mypetstore?serverTimezone=UTC";
    private static String userName = "root";
    private static String password = "";

    public static Connection getConnection() throws Exception
    {
        Connection connection = null;
        try
        {
            Class.forName(drive);
            connection = DriverManager.getConnection(connectionString,userName,password);
        }catch (Exception e)
        {
            throw e;
        }

        return connection;
    }

    public static void closeConnection(Connection connection) throws Exception
    {
        connection.close();
    }

    public static void closeStatement(Statement statement) throws  Exception
    {
        statement.close();
    }

    public static void closePreparedStatement(PreparedStatement preparedStatement) throws Exception
    {
        preparedStatement.close();
    }

    public static void closeResultSet(ResultSet resultSet)throws Exception
    {
        resultSet.close();
    }


    /*
    public static void main(String [] args) throws Exception
    {
        Connection conn = getConnection();
        System.out.println(conn) ;
    }
     */

}
