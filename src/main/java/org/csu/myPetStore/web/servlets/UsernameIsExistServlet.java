package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UsernameIsExistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        Account account = new Account();
        account.setUsername(username);
        AccountService accountService = new AccountService();

        response.setContentType("text/xml");
        PrintWriter out = response.getWriter();


        if(accountService.getAccount(account.getUsername()) != null){

            out.println("<msg>Exist</msg>");
        }
        else {
            out.println("<msg>NotExist</msg>");
        }
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
