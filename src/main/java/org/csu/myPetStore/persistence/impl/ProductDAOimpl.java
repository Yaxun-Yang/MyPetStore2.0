package org.csu.myPetStore.persistence.impl;

import org.csu.myPetStore.persistence.DBUtil;
import org.csu.myPetStore.persistence.ProductDAO;
import org.csu.myPetStore.domain.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOimpl implements ProductDAO {
    private static final String GET_PRODUCT_LIST_BY_CATEGORY ="select PRODUCTID, CATEGORY as categoryId, NAME, DESCN as description from PRODUCT WHERE CATEGORY = ? ";
    private static final String GET_PRODUCT = "select PRODUCTID,  CATEGORY as categoryId,NAME, DESCN as description from PRODUCT WHERE PRODUCTID = ?";
    private static final String SEARCH_PRODUCT_LIST = "select PRODUCTID,CATEGORY as categoryId,  NAME, DESCN as description from PRODUCT WHERE lower(name) like ?";

    @Override
    public List<Product> getProductListByCategory (String categoryId)
    {
       List <Product>  productList = new ArrayList<Product>();

       try
       {
           Connection connection = DBUtil.getConnection();
           PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_LIST_BY_CATEGORY);
           preparedStatement.setString(1,categoryId);
           ResultSet resultSet = preparedStatement.executeQuery();
           while (resultSet.next())
           {
               Product product = new Product();
              product.setProductId(resultSet.getString(1));
               product.setCategoryId(resultSet.getString(2));
               product.setName(resultSet.getString(3));
               product.setDescription(resultSet.getString(4));
               productList.add(product);
           }
           DBUtil.closeResultSet(resultSet);
           DBUtil.closePreparedStatement(preparedStatement);
           DBUtil.closeConnection(connection);

       }catch (Exception e)
       {
           e.printStackTrace();
       }

       return productList;
    }

    @Override
    public Product getProduct(String productId)
    {
        Product product = null;

        try
        {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT);
            preparedStatement.setString(1,productId);
            ResultSet resultSet = preparedStatement.executeQuery();
           if (resultSet.next())
            {
                product =new Product();
                product.setProductId(resultSet.getString(1));
                product.setCategoryId(resultSet.getString(2));
                product.setName(resultSet.getString(3));
                product.setDescription(resultSet.getString(4));

            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e)
        {
            e.printStackTrace();
        }

        return product;
    }

    @Override
    public List<Product> searchProductList(String keywords)
    {
        List <Product>  productList = new  ArrayList <Product> ();

        try
        {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_PRODUCT_LIST);
            preparedStatement.setString(1,keywords);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                Product product = new Product();
                product.setProductId(resultSet.getString(1));
                product.setCategoryId(resultSet.getString(2));
                product.setName(resultSet.getString(3));
                product.setDescription(resultSet.getString(4));
                productList.add(product);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e)
        {
            e.printStackTrace();
        }

        return productList;
    }
}
