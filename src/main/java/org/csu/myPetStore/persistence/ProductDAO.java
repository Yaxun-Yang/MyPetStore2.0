package org.csu.myPetStore.persistence;
import java.util.List;
import org.csu.myPetStore.domain.Product;

public interface ProductDAO {
    List<Product> getProductListByCategory(String categoryId);

    Product getProduct(String productId);

    List<Product> searchProductList(String keywords);

}
