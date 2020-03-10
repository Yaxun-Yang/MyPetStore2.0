package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.domain.Cart;
import org.csu.myPetStore.domain.CartItem;
import org.csu.myPetStore.service.CartService;
import org.csu.myPetStore.service.CatalogService;
import org.csu.myPetStore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddItemCartServlet extends HttpServlet
{

    private static final String VIEW_CART = "/viewCart";
    private static final String SIGN_ON = "/WEB-INF/jsp/account/SignOnForm.jsp";
    private String workingItemId;
    private CartItem cartItem;
    private Cart cart;
    private Account account;
    private CatalogService categoryService;
    private CartService cartService;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        workingItemId = req.getParameter("workingItemId");

        HttpSession session = req.getSession();
        account = (Account) session.getAttribute("account");
//      判断是否登录
        if(account == null)
        {
            req.getRequestDispatcher(SIGN_ON).forward(req,resp);
        }
        else
        {
            cartService =new CartService();
            categoryService = new CatalogService();
            Cart cart = (Cart)session.getAttribute("cart");

            int cartNeedQuantity = cartService.getQuantity(cart,workingItemId);
            int itemQuantity = categoryService.getItemQuantity(workingItemId);
            if (cartNeedQuantity<itemQuantity){
                if(cartService.containItem(cart,workingItemId)){
                    cartService.incrementQuantityByItemId(cart,workingItemId);
                }
                else {
                    cartService.addItem(cart,workingItemId);
                }
                LogService logService =new LogService();
                logService.addItem(account.getUsername(),workingItemId);
            }
            req.getRequestDispatcher(VIEW_CART).forward(req, resp);
        }

    }
}
