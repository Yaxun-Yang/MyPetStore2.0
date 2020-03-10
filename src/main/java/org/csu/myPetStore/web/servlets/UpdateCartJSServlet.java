package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Cart;
import org.csu.myPetStore.domain.CartItem;
import org.csu.myPetStore.domain.CartItemShow;
import org.csu.myPetStore.domain.CartShow;
import org.csu.myPetStore.service.CartService;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UpdateCartJSServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //从对话中，获取购物车
        HttpSession session = req.getSession();
        CartShow cartShow = (CartShow)session.getAttribute("cartShow");
        int quantity = Integer.parseInt( req.getParameter("quantity"));
        String workingItemId = req.getParameter("workingItemId");
      //  System.out.println(quantity+" "+workingItemId);
      //  System.out.println("fafd");
        List<CartItemShow> cartItemShowList= cartShow.getCartItemShowList();
        CartService cartService = new CartService();
        Cart cart=(Cart) session.getAttribute("cart");
        for (int i = 0;i < cartItemShowList.size();i++)
        {
            CartItemShow cartItemShow=  cartItemShowList.get(i);
            String itemId =cartItemShow.getItem().getItemId();

            if(itemId.equals(workingItemId)&&quantity !=cartItemShow.getQuantity() )
            {

                if(quantity == 0)
                {
                    cartService.removeItem(cart,itemId);
                }
                else
                    cartService.updateQuantity(cart,itemId,quantity);
            }
        }

        List<CartItem> cartItemList = cartService.getCartItemList(cart);

        cartShow=new CartShow(cartService.getCartItemShowsByCartItems(cartItemList));
        session.setAttribute("cartShow",cartShow);

        for (int i = 0;i < cartItemShowList.size();i++)
        {
            CartItemShow cartItemShow=  cartItemShowList.get(i);
            String itemId =cartItemShow.getItem().getItemId();

            if(itemId.equals(workingItemId)&&quantity !=cartItemShow.getQuantity() )
            {

                if(quantity == 0)
                {
                    cartService.removeItem(cart,itemId);
                }
                else
                    cartService.updateQuantity(cart,itemId,quantity);
            }
        }
         JSONObject jsonObject = new JSONObject();
        jsonObject.put("quantity",quantity);
        jsonObject.put("totalCost",cartShow.getCartItemShowByItemId(workingItemId).getTotalCost());
        jsonObject.put("subTotal",cartShow.getSubTotal());
   // quantityAll+="1,1,1";
        System.out.println(jsonObject);
       resp.getWriter().print(jsonObject);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
