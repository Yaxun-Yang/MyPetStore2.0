package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.service.CartService;
import org.csu.myPetStore.service.CatalogService;
import org.csu.myPetStore.service.LogService;
import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.domain.Cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RemoveItemCartServlet extends HttpServlet {
    private static final String VIEW_CART = "/viewCart";
    private static final String ERROR = "/WEB-INF/jsp/common/Error.jsp";
    private String workingItemId;
    private CatalogService categoryService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        workingItemId = req.getParameter("workingItemId");

        HttpSession session = req.getSession();
        CartService cartService = new CartService();
        Account account = (Account) session.getAttribute("account");
        Cart cart = (Cart)session.getAttribute("cart");

        cartService.removeItem(cart,workingItemId);

        LogService logService =new LogService();
        logService.removeItem(account.getUsername(),workingItemId);

        req.getRequestDispatcher(VIEW_CART).forward(req,resp);
        }
}
