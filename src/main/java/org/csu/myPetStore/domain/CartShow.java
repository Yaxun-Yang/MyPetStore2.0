package org.csu.myPetStore.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CartShow {
    private List<CartItemShow> cartItemShowList ;
    private BigDecimal subTotal;
    private int numberOfItems;

    public CartShow(List<CartItemShow> cartItemShows)
    {
        cartItemShowList = cartItemShows;

        numberOfItems = cartItemShows.size();
        sortCartItemShow();
        getSubTotal();
    }
    public void  sortCartItemShow()
    {
        List<CartItemShow> newCartItemShowList = new ArrayList<>();

        for(int i=0 ; i<cartItemShowList.size();i++)
        {
            if(cartItemShowList.get(i).getItem().getProduct().getCategoryId().equals("FISH"))
            {
                newCartItemShowList.add(cartItemShowList.get(i));
            }
        }
        for(int i=0 ; i<cartItemShowList.size();i++)
        {
            if(cartItemShowList.get(i).getItem().getProduct().getCategoryId().equals("DOGS"))
            {
                newCartItemShowList.add(cartItemShowList.get(i));
            }
        }
        for(int i=0 ; i<cartItemShowList.size();i++)
        {
            if(cartItemShowList.get(i).getItem().getProduct().getCategoryId().equals("REPTILES"))
            {
                newCartItemShowList.add(cartItemShowList.get(i));
            }
        }
        for(int i=0 ; i<cartItemShowList.size();i++)
        {
            if(cartItemShowList.get(i).getItem().getProduct().getCategoryId().equals("CATS"))
            {
                newCartItemShowList.add(cartItemShowList.get(i));
            }
        }
        for(int i=0 ; i<cartItemShowList.size();i++)
        {
            if(cartItemShowList.get(i).getItem().getProduct().getCategoryId().equals("BIRDS"))
            {
                newCartItemShowList.add(cartItemShowList.get(i));
            }
        }
    //    System.out.println(cartItemShowList.size());
        cartItemShowList = newCartItemShowList;
    //    System.out.println(cartItemShowList.size());
    }
    public BigDecimal getSubTotal() {

        subTotal = new BigDecimal(0);
        for(int i=0;i<numberOfItems;i++)
        {
            CartItemShow cartItemShow= cartItemShowList.get(i);
            subTotal=subTotal.add(cartItemShow.getTotalCost());
        }
        return subTotal;
    }
    public List<CartItemShow> getCartItemShowList()
    {
        return cartItemShowList;
    }
    public int getNumberOfItems()
    {
        return  numberOfItems;
    }
    public void  setCartItemShowList(List<CartItemShow> cartItemShowList)
    {
        this.cartItemShowList = cartItemShowList;
    }
    public CartItemShow getCartItemShowByItemId(String itemId)
    {
        CartItemShow cartItemShow = null;
        for(int i= 0;i<cartItemShowList.size();i++)
        {
            cartItemShow = cartItemShowList.get(i);
            if(cartItemShow.getItem().getItemId().equals(itemId))
            {
                break;
            }
        }
        return cartItemShow;
    }
    public void clear(CartShow buyCartShow)
    {
        List<CartItemShow>cartItemShows = buyCartShow.getCartItemShowList();
        int j=0;
        for(int i=0;i<cartItemShows.size();i++)
        {
            if(cartItemShows.get(i).getItem().getItemId().equals(cartItemShowList.get(j).getItem().getItemId()))
            {
                cartItemShowList.remove(j);
            }
            else j++;
        }
    }
}
