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

public class SignOnFormServlet extends HttpServlet {
    private static final String SIGN_ON = "/WEB-INF/jsp/account/SignOnForm.jsp";
    private static final String MAIN = "/WEB-INF/jsp/catalog/Main.jsp";
    private AccountService accountService;
    private Account account;
    private String username;
    private String password;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        username = req.getParameter("username");
        password = req.getParameter("password");

        accountService = new AccountService();
        account = accountService.getAccount(username,password);

        HttpSession session = req.getSession();

        String clientCheckcode = req.getParameter("validateCode");//接收客户端浏览器提交上来的验证码
        String serverCheckcode = (String) req.getSession().getAttribute("checkCode");//从服务器端的session中取出验证码

        if (!clientCheckcode.equals(serverCheckcode))
        {
                String value = "Invalid verification code .Sign in failed.";
                session.setAttribute("value",value);
                req.getRequestDispatcher(SIGN_ON).forward(req,resp);
        }
          if (account == null)
        {
            String value = "Invalid username or password.  Sign in failed.";
            session.setAttribute("value",value);
            req.getRequestDispatcher(SIGN_ON).forward(req,resp);
        }
        else
            {
                session.setAttribute("value",null);
                session.setAttribute("account", account);
                session.setAttribute("username",username);


                CartService cartService = new CartService();
                Cart cart =  cartService.getCart(username);
                session.setAttribute("cart",cart);
                req.getRequestDispatcher(MAIN).forward(req,resp);
            }


    }
}
