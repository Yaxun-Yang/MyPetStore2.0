package org.csu.myPetStore.domain;

import java.io.Serializable;
import java.math.BigDecimal;

public class LineItem  implements Serializable{

  private int orderId;
  private int lineNumber;
  private int quantity;
  private String itemId;
  private BigDecimal unitPrice;
  private Item item;
  private BigDecimal total;

  public LineItem() {
  }

  public LineItem( CartItemShow cartItemShow) {
    this.quantity = cartItemShow.getQuantity();
    this.itemId = cartItemShow.getItem().getItemId();
    this.unitPrice =cartItemShow .getItem().getListPrice();
    this.item = cartItemShow.getItem();
    calculateTotal();
  }

  public int getOrderId() {
    return orderId;
  }

  public void setOrderId(int orderId) {
    this.orderId = orderId;
  }

  public int getLineNumber() {
    return lineNumber;
  }

  public void setLineNumber(int lineNumber) {
    this.lineNumber = lineNumber;
  }

  public String getItemId() {
    return itemId;
  }

  public void setItemId(String itemId) {
    this.itemId = itemId;
  }

  public BigDecimal getUnitPrice() {
    return unitPrice;
  }

  public void setUnitPrice(BigDecimal unitPrice) {
    this.unitPrice = unitPrice;
  }

  public BigDecimal getTotal() {
    return total;
  }

  public Item getItem() {
    return item;
  }

  public void setItem(Item item) {
    this.item = item;
    calculateTotal();
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
    calculateTotal();
  }

  private void calculateTotal() {
    if (item != null && item.getListPrice() != null) {
      total = item.getListPrice().multiply(new BigDecimal(quantity));
    } else {
      total = null;
    }
  }

}
