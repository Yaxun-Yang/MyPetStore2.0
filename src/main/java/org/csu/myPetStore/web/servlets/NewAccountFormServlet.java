package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.domain.Cart;
import org.csu.myPetStore.service.AccountService;
import org.csu.myPetStore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class NewAccountFormServlet extends HttpServlet {
    private static final String MAIN = "/WEB-INF/jsp/catalog/Main.jsp";
    private static final String NEW_ACCOUNT_FORM = "/WEB-INF/jsp/account/NewAccountForm.jsp";
    private String username;
    private String password;
    private String repeatedPassword;
    private Account account;
    private AccountService accountService;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        username = req.getParameter("username");
        password = req.getParameter("password");
        repeatedPassword = req.getParameter("repeatedPassword");

        if(! password.equals(repeatedPassword)){
            String message = "The two passwords do not match";
            HttpSession session = req.getSession();
            session.setAttribute("message",message);
            req.getRequestDispatcher(NEW_ACCOUNT_FORM).forward(req,resp);
        }
        else {
            accountService = new AccountService();
            account = new Account();
            account.setUsername(username);
            account.setPassword(password);
            accountService.insertAccount(account);
            HttpSession session = req.getSession();
            session.setAttribute("account",account);
            CartService cartService = new CartService();
            Cart cart = new Cart();
            cart.setUsername(username);
            cartService.insertNewCart(cart);
            req.getRequestDispatcher(MAIN).forward(req,resp);
        }

    }
}
