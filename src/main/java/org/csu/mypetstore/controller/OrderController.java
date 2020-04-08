package org.csu.mypetstore.controller;

import org.csu.mypetstore.domain.Account;
import org.csu.mypetstore.domain.CartItem;
import org.csu.mypetstore.domain.LineItem;
import org.csu.mypetstore.domain.Order;
import org.csu.mypetstore.service.CartService;
import org.csu.mypetstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
@SessionAttributes("order")
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    CartService cartService;

    @GetMapping("/viewNewOrderForm")
    public String viewNewOrderForm(Model model, HttpServletRequest httpServletRequest)
    {
       Account account = (Account) httpServletRequest.getSession().getAttribute("account");
       if(account != null)
       {
           model.addAttribute("account",account);
           return "/order/newOrderForm";
       }
      return "redirect:/account/viewSignIn?msg='please log in first'";
    }
    @PostMapping("/postToConfirmOrder")
    public String confirmOrder(Model model,HttpServletRequest httpServletRequest, Order order )
    {
        HttpSession session =httpServletRequest.getSession();
        Account account = (Account)session.getAttribute("account");
        if(account != null)
        {
            model.addAttribute("account",account);
            List<CartItem> cartItemList = (List<CartItem>) session.getAttribute("cartItemList");
            if(cartItemList.size() != 0)
            {
                order.initOrder(account.getUsername(),cartItemList);
                model.addAttribute("order",order);
                return "/order/confirmOrder";
            }
            else
            {
                return "redirect:/catalog/viewMain?msg='please add item first'";
            }
        }
        else return "redirect:/account/viewSignIn?msg='please log in first'";
    }
    @GetMapping("/viewOrder")
    public String viewOrder(Model model,HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        if (account != null) {
            model.addAttribute("account",account);
            Order order = (Order) httpServletRequest.getSession().getAttribute("order");
            if(order != null)
            {
                orderService.insertOrder(order);
                int orderId =orderService.getOrderId(order);
                order.setOrderId(orderId);
                orderService.insertOrderStatus(order);
                orderService.insetLineItems(order);

                model.addAttribute("order",order);
              //  System.out.println(order.getCourier());

                List<LineItem> lineItems = order.getLineItems();
                for(int i= 0;i<lineItems.size();i++)
                {
                    cartService.removeItem(cartService.getCart(account.getUsername()).getCartId(),lineItems.get(i).getItemId());
                }
                return "/order/viewOrder";
            }
            else return "redirect:/catalog/viewMain?msg='please add item first'";
        }
        else return "redirect:/account/viewSignIn?msg='please log in first'";
    }
}
