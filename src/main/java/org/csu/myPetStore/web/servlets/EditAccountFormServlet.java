package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditAccountFormServlet extends HttpServlet {
    private static final String EDIT_ACCOUNT_FORM = "/WEB-INF/jsp/account/EditAccountForm.jsp";
    private static final String MAIN = "/WEB-INF/jsp/catalog/Main.jsp";
    private AccountService accountService;
    private Account account;
    private String username;
    private String password;
    private String repeatedPassword;
    private String email;
    private String firstName;
    private String lastName;
    private String status;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String phone;
    private String languagePreference;
    private String favouriteCategoryId;
    private boolean listOption;
    private boolean bannerOption;
    private String bannerName;

    private String message;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        username = req.getParameter("username");
        password = req.getParameter("password");
        repeatedPassword = req.getParameter("repeatedPassword");
        email = req.getParameter("email");
        firstName = req.getParameter("firstName");
        lastName = req.getParameter("lastName");
        status = req.getParameter(status);
        address1 = req.getParameter("address1");
        address2 = req.getParameter("address2");
        city = req.getParameter("city");
        state = req.getParameter("state");
        zip = req.getParameter("zip");
        country = req.getParameter("country");
        phone = req.getParameter("phone");
        languagePreference = req.getParameter("languagePreference");
        favouriteCategoryId = req.getParameter("favouriteCategoryId");
        bannerName = req.getParameter("bannerName");

        HttpSession session = req.getSession();
        accountService = new AccountService();
        account = (Account)session.getAttribute("account");

        if (password  != null)
             account.setPassword(password);


        account.setEmail(email);
        account.setFirstName(firstName);
        account.setLastName(lastName);
        account.setStatus(status);
        account.setAddress1(address1);
        account.setAddress2(address2);
        account.setCity(city);
        account.setState(state);
        account.setZip(zip);
        account.setCountry(country);
        account.setPhone(phone);
        account.setLanguagePreference(languagePreference);
        account.setFavouriteCategoryId(favouriteCategoryId);
        account.setBannerName(bannerName);

        if(password!=null&&!password.equals(repeatedPassword)) {
            String message = "The two passwords do not match";
            session.setAttribute("message",message);
            req.getRequestDispatcher(EDIT_ACCOUNT_FORM).forward(req,resp);
        }
        else
        {
            session.setAttribute("message",null);
            accountService = new AccountService();
            accountService.updateAccount(account);
            session.setAttribute("account",account);
            req.getRequestDispatcher(MAIN).forward(req,resp);
        }



    }
}
