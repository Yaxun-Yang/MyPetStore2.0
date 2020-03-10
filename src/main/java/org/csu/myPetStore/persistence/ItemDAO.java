package org.csu.myPetStore.persistence;

import org.csu.myPetStore.domain.Item;

import java.util.List;
import java.util.Map;

public interface ItemDAO {
    void updateInventoryQuantity(Map<String, Integer> param);

    int getInventoryQuantity(String itemId);

    List<Item> getItemListByProduct(String productId);

    Item getItem(String itemId);
}
