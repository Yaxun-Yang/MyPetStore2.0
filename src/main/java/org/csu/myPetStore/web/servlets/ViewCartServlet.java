package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.service.CartService;
import org.csu.myPetStore.domain.Cart;
import org.csu.myPetStore.domain.CartItem;
import org.csu.myPetStore.domain.CartItemShow;
import org.csu.myPetStore.domain.CartShow;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ViewCartServlet extends HttpServlet {
    private static final String VIEW_CART = "/WEB-INF/jsp/cart/Cart.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        CartService cartService = new CartService();
        List<CartItem> cartItemList = cartService.getCartItemList(cart);
      //  System.out.println(cartItemList.size()+"******************");
        List<CartItemShow> cartItemShowList = cartService.getCartItemShowsByCartItems(cartItemList);
        CartShow cartShow =new CartShow(cartItemShowList);

        //System.out.println(cartShow.getCartItemShowList().get(1).getInStock());
      //  System.out.println(cartShow.getCartItemShowList().size()+"&&&&&&&&&&&&&&&&&&&&&&");
        session.setAttribute("cartShow",cartShow);
        req.getRequestDispatcher(VIEW_CART).forward(req, resp);
    }
}
