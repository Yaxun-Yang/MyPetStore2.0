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
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
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
    public  String viewCart(Model model , HttpServletRequest httpServletRequest,String msg)
    {
        HttpSession httpSession = httpServletRequest.getSession();
        Account account=(Account) httpSession.getAttribute("account");
        if(account != null)
        {
            model.addAttribute("msg",msg);
            model.addAttribute("account",account);
            Cart cart = cartService.getCart(account.getUsername());
            model.addAttribute("cart",cart);
            List<CartItem> cartItemList = cartService.getCartItemList(cart.getCartId());
            model.addAttribute("cartItemList",cartItemList);

            model.addAttribute("cartItemNumber",cartItemList.size());
            model.addAttribute("subTotal",cartService.getCartTotalCost(cartItemList));
            return "/cart/cart";
        }
       return "redirect:/account/viewSignIn";
    }
    //检查购物清单
    @PostMapping("/postToCheckOut")
    public String viewCheckOut(Model model, HttpServletRequest httpServletRequest)
    {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        model.addAttribute("account",account);
        if(account != null)
        {
            Cart cart = cartService.getCart(account.getUsername());
            List<CartItem> cartItems = cartService.getCartItemList(cart.getCartId());


            List<CartItem> cartItemList =new ArrayList<>();
            for(int i=0;i<cartItems.size();i++)
            {
                String checkName = cartItems.get(i).getItemId()+"_check";
                String checkBox = httpServletRequest.getParameter(checkName);
                if(checkBox != null)
                {
                    cartItemList.add(cartItems.get(i));
                }
            }
            if(cartItemList.size() == 0)
            {
                String msg ="please choose the goods in your cart to check out";
                return "redirect:/cart/viewCart?msg="+msg;
            }
            BigDecimal subTol = cartService.getCartTotalCost(cartItemList);
            model.addAttribute("cartItemList",cartItemList);
            httpServletRequest.getSession().setAttribute("cartItemList",cartItemList);
            model.addAttribute("subTotal",subTol);
            return "/cart/checkOut";
        }
        else return "/common/error";
    }

    //添加商品到购物车，已登录则跳出登录成功提醒，否则跳转登录页面
    @GetMapping("/addItem")
    public  String  addItemCart(String itemId,Model model,HttpServletRequest httpServletRequest)
    {
        Account account =(Account)httpServletRequest.getSession().getAttribute("account");
        if(account != null)
        {

            //弹出小弹窗内的信息
            String msg = " ";
            msg+=itemId;
            msg+=" have been added into your cart!";

            cartService.addItem(cartService.getCart(account.getUsername()).getCartId(),itemId);
            return "redirect:/cart/viewCart?msg="+msg;
        }
        return "redirect:/account/viewSignIn";
    }

    @GetMapping("/removeItem")
    public String  removeItem(String itemId,HttpServletRequest httpServletRequest)
    {
       Account account =(Account) httpServletRequest.getSession().getAttribute("account");
        cartService.removeItem(cartService.getCart(account.getUsername()).getCartId(),itemId);
        String msg =" ";
        msg+=itemId;
        msg+="  have been removed from your cart!";


        return "redirect:/cart/viewCart?msg="+msg;
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
        jsonObject.put("subTotal", cartService.getCartTotalCost(cartService.getCartItemList(cartId)));

        return jsonObject;
    }





}

