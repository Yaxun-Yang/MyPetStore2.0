package org.csu.mypetstore.controller;

import net.sf.json.JSONObject;
import org.csu.mypetstore.domain.Account;
import org.csu.mypetstore.domain.Cart;
import org.csu.mypetstore.domain.CartItem;
import org.csu.mypetstore.domain.Item;
import org.csu.mypetstore.service.AccountService;
import org.csu.mypetstore.service.CartService;
import org.csu.mypetstore.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private CatalogService catalogService;
    //验证是否登录，是则跳转cart.html，否则跳转登录页面
    @GetMapping("/viewCart")
    public  String viewCart(Model model , HttpServletRequest httpServletRequest)
    {
        Account account=(Account) httpServletRequest.getSession().getAttribute("account");
        if(account != null)
        {
            model.addAttribute("msg",null);
            model.addAttribute("account",account);
            Cart cart = cartService.getCart(account.getUsername());
            model.addAttribute("cart",cart);
            List<CartItem> cartItemList = cartService.getCartItemList(cart.getCartId());
            model.addAttribute("cartItemList",cartItemList);
            model.addAttribute("cartItemNumber",cartItemList.size());
            model.addAttribute("subTotal",cartService.getCartTotalCost(cart.getCartId()));
            return "/cart/cart";
        }
       return "redirect:/account/viewSignIn";
    }

    //添加商品到购物车，已登录则跳出登录成功提醒，否则跳转登录页面
    @GetMapping("/addItem")
    public  String  addItemCart(String itemId,Model model,HttpServletRequest httpServletRequest)
    {
        Account account=(Account) httpServletRequest.getSession().getAttribute("account");
        if(account != null)
        {
            model.addAttribute("account",account);
            //弹出小弹窗内的信息
            String msg = " ";
            msg+=itemId;
            msg+="已添加到您的购物车";
           // System.out.println("aaa"+msg);
            model.addAttribute("msg",msg);
           // System.out.println(model.getAttribute("msg"));
            Cart cart = cartService.getCart(account.getUsername());
            cartService.addItem(cart.getCartId(),itemId);
            List<CartItem> cartItemList= cartService.getCartItemList(cart.getCartId());
            model.addAttribute("cartItemNumber",cartItemList.size());
          //  System.out.println(cartItemList.size());
            model.addAttribute("cart",cart);
            model.addAttribute("cartItemList",cartItemList);
            model.addAttribute("subTotal",cartService.getCartTotalCost(cart.getCartId()));
           // return "redirect:/catalog/viewItem?itemId="+itemId;
            return "/cart/cart";
        }
        return "redirect:/account/viewSignIn";
    }

    @GetMapping("/removeItem")
    public String  removeItem(String itemId,HttpServletRequest httpServletRequest)
    {
       Account account =(Account) httpServletRequest.getSession().getAttribute("account");
        cartService.removeItem(cartService.getCart(account.getUsername()).getCartId(),itemId);

        return "redirect:/cart/viewCart";
    }

    //修改商品数量
    //交互json数据
    @PostMapping("/updateItemQuantity")
    @ResponseBody
    public JSONObject updateItemQuantity(@RequestParam String cartId,@RequestParam String itemId,@RequestParam int quantity, Model model)
    {


    //    System.out.println(itemId+","+quantity+","+cartId);
        cartService.updateCartItemQuantity(cartId,itemId,quantity);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("quantity",quantity);
        jsonObject.put("totalCost",cartService.getCartItemTotalCost(cartId,itemId));
        jsonObject.put("subTotal", cartService.getCartTotalCost(cartId));

        return jsonObject;
    }

    @PostMapping("/viewCheckOut")
    public String viewCheckOut(Model model,HttpServletRequest httpServletRequest)
    {
        Account account= (Account)httpServletRequest.getSession().getAttribute("account");
        model.addAttribute("account",account);
        return "/cart/checkOut";
    }



}

