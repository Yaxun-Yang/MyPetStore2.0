package org.csu.mypetstore.persistence;

import org.csu.mypetstore.domain.Item;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ItemMapper {
    void updateInventoryQuantity(String itemId, int quantity);

    int  getInventoryQuantity(String itemId);

    void setItemStatusP(String itemId);

    void setItemStatusN(String itemId);


    List<Item> getItemListByProduct(String productId);

    Item getItem(String itemId);

    void updateInventoryQuantity(Map<String, Object> param);
}
