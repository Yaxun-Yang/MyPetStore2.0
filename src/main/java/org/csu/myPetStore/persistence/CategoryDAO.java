package org.csu.myPetStore.persistence;

import org.csu.myPetStore.domain.Category;
import java.util.List;

public interface CategoryDAO {
    List<Category> getCategoryList();

    Category getCategory(String categoryId);

}
