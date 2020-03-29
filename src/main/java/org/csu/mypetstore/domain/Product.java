package org.csu.mypetstore.domain;

public class Product {
    private String productId;
    private String categoryId;
    private String name;
    private String image;
    private String text;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image.trim();
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text.trim();
    }
}
