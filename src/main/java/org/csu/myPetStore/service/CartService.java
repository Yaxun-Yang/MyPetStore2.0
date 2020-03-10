package org.csu.myPetStore.service;

import org.csu.myPetStore.persistence.CartDAO;
import org.csu.myPetStore.persistence.CartItemDAO;
import org.csu.myPetStore.persistence.impl.CartDAOimpl;
import org.csu.myPetStore.persistence.impl.CartItemDAOimpl;
import org.csu.myPetStore.domain.Cart;
import org.csu.myPetStore.domain.CartItem;
import org.csu.myPetStore.domain.CartItemShow;

import java.util.ArrayList;
import java.util.List;

public class CartService {
    private CartDAO cartDAO;
    private CartItemDAO cartItemDAO;
    private CatalogService catalogService;

    public  void insertNewCart(Cart cart)
    {
        cartDAO = new CartDAOimpl();
        cartDAO.insertCart(cart);
    }
    public List<CartItem> getCartItemList(Cart cart)
    {
        cartDAO = new CartDAOimpl();
        cartItemDAO = new CartItemDAOimpl();
        List<CartItem> cartItemList = new ArrayList<CartItem>();
        cartItemList = cartItemDAO.getCartItemList(cart);
        return cartItemList;
    }

    public void addItem(Cart cart,String itemId)
    {
        cartItemDAO = new CartItemDAOimpl();
        cartDAO = new CartDAOimpl() ;
        cartItemDAO.insertItem(cart,itemId);
    }

    public void incrementQuantityByItemId(Cart cart ,String itemId)
    {
        cartItemDAO = new CartItemDAOimpl();
        cartDAO = new CartDAOimpl() ;
        cartItemDAO.updateQuantity(cart,itemId,cartItemDAO.getQuantity(cart,itemId)+1);
    }

    public void removeItem(Cart cart, String itemId)
    {
        cartItemDAO = new CartItemDAOimpl();
        cartDAO = new CartDAOimpl();
        cartItemDAO.deleteItem(cart,itemId);
    }

    public void updateQuantity(Cart cart,String itemId,int quantity)
    {
        cartItemDAO = new CartItemDAOimpl();
        cartDAO = new CartDAOimpl();
        cartItemDAO.updateQuantity(cart,itemId,quantity);
    }

    public boolean containItem(Cart cart, String itemId)
    {
        cartItemDAO = new CartItemDAOimpl();
        cartDAO = new CartDAOimpl();
        if(cartItemDAO.getQuantity(cart,itemId) > 0)
            return true;
        return false;
    }

    public int getQuantity(Cart cart, String itemId)
    {
        cartItemDAO = new CartItemDAOimpl();
        cartDAO = new CartDAOimpl();
        return cartItemDAO.getQuantity(cart,itemId);

    }
    public Cart  getCart(String username)
    {
        cartDAO = new CartDAOimpl();
//        if (cartDAO.getCart(username) == null)
//            System.out.println("null");
        return cartDAO.getCart(username);
    }
    public void clear(Cart cart,List<CartItemShow> buyCartShow)
    {
         for(int i=0;i<buyCartShow.size();i++)
         {
             removeItem(cart,buyCartShow.get(i).getItem().getItemId());
         }
    }
    public List<CartItemShow> getCartItemShowsByCartItems(List<CartItem> cartItems)
    {
        List<CartItemShow> cartItemShows= new ArrayList<>();
        for (int i= 0;i<cartItems.size();i++)
        {
            CartItemShow cartItemShow = new CartItemShow(cartItems.get(i));
            cartItemShows.add(cartItemShow);
        }
     //   System.out.println(cartItems.size()+" "+cartItemShows.size());
        return cartItemShows;
    }
}
