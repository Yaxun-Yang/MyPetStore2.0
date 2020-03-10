package org.csu.myPetStore.service;

import org.csu.myPetStore.persistence.CategoryDAO;
import org.csu.myPetStore.persistence.ItemDAO;
import org.csu.myPetStore.persistence.ProductDAO;
import org.csu.myPetStore.persistence.impl.CategoryDAOimpl;
import org.csu.myPetStore.persistence.impl.ItemDAOimpl;
import org.csu.myPetStore.persistence.impl.ProductDAOimpl;
import org.csu.myPetStore.domain.Category;
import org.csu.myPetStore.domain.Item;
import org.csu.myPetStore.domain.Product;

import java.util.List;

public class CatalogService {

    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;
    private ItemDAO itemDAO;
    public CatalogService()
    {
        categoryDAO = new CategoryDAOimpl();
        productDAO = new ProductDAOimpl();
        itemDAO = new ItemDAOimpl();
    }
    public List<Category> getCategoryList()
    {
        return categoryDAO.getCategoryList();
    }

    public Category getCategory(String categoryId)
    {
        return categoryDAO.getCategory(categoryId);
    }

    public Product getProduct(String productId)
    {
        return productDAO.getProduct(productId);
    }

    public List<Product> getProductListByCategory(String categoryId) {
        return productDAO.getProductListByCategory(categoryId);
    }

    // TODO enable using more than one keyword
    public List<Product> searchProductList(String keyword) {
        return productDAO.searchProductList("%" + keyword.toLowerCase() + "%");
    }

    public List<Item> getItemListByProduct(String productId) {
        return itemDAO.getItemListByProduct(productId);
    }

    public Item getItem(String itemId)
    {
        return itemDAO.getItem(itemId);
    }

    public boolean isItemInStock(String itemId)
    {
        return itemDAO.getInventoryQuantity(itemId) > 0;
    }

    public int getItemQuantity(String itemId){
        return  itemDAO.getInventoryQuantity(itemId);
    }
}
