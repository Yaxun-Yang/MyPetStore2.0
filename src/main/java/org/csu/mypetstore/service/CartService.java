package org.csu.mypetstore.service;

import org.csu.mypetstore.domain.Cart;
import org.csu.mypetstore.domain.CartItem;
import org.csu.mypetstore.persistence.CartItemMapper;
import org.csu.mypetstore.persistence.CartMapper;
import org.csu.mypetstore.persistence.ItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class CartService {
    @Autowired
    private CartMapper cartMapper;

    @Autowired
    private CartItemMapper cartItemMapper;

    @Autowired
    private ItemMapper itemMapper;

    //新建购物车
    public void creatCart(String username)
    {
        cartMapper.addCart(username);
    }

    //删除购物车并删除其中的所有商品
    public void destroyCart(String username)
    {
        cartItemMapper.deleteCartItemByCart(cartMapper.getCartByUsername(username).getCartId());
        cartMapper.deleteCart(username);
    }

    //通过用户名获取购物车
    public Cart getCart(String username)
    {
        return cartMapper.getCartByUsername(username);
    }

    //获取购物车中的所有的商品
    public List<CartItem> getCartItemList(String cartId)
    {
        return cartItemMapper.getCartItemList(cartId);
    }

    //获取购物车中特定的商品
    public CartItem getCartItem(String cartId, String itemId)
    {
        return cartItemMapper.getCartItem(cartId, itemId);
    }

   //修改商品数量并更新购物车商品状态
    public void updateCartItemQuantity(String cartId, String itemId, int quantity)
    {
        CartItem cartItem=cartItemMapper.getCartItem(cartId, itemId);
        if(quantity > 0)
        {
            if( cartItem== null)
            {
                cartItemMapper.insertCartItem(cartId,itemId,quantity);
            }
            else
            {
                cartItemMapper.updateQuantity(cartId,itemId,quantity);
            }

        }
        else if(cartItem != null)
        {
            cartItemMapper.deleteCartItem(cartId, itemId);
        }
    }
    //向购物车中添加商品
    public void addItem(String cartId, String itemId)
    {
        CartItem cartItem = cartItemMapper.getCartItem(cartId, itemId);
        if(cartItem == null)
        {
            cartItemMapper.insertCartItem(cartId,itemId,1);
        }
        else
        {
            cartItemMapper.updateQuantity(cartId,itemId,cartItem.getQuantity()+1);
        }
    }
    //获取某种商品总价钱
    public BigDecimal getCartItemTotalCost(String cartId,String cartItemId)
    {
       int quantity= cartItemMapper.getCartItem(cartId,cartItemId).getQuantity();
       return itemMapper.getItem(cartItemId).getUnitCost().multiply(new BigDecimal(String.valueOf(quantity)));
    }
    public BigDecimal getCartTotalCost(String cartId)
    {
        BigDecimal subTotal = new BigDecimal(0);
        List<CartItem> cartItemList = cartItemMapper.getCartItemList(cartId);
        for (int i = 0;i<cartItemList.size();i++)
        {
            subTotal.add(getCartItemTotalCost(cartId,cartItemList.get(i).getItemId()));
        }
        return subTotal;
    }


}
