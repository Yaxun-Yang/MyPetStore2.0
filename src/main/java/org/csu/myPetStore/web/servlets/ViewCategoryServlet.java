package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.domain.Category;
import org.csu.myPetStore.domain.Product;
import org.csu.myPetStore.service.CatalogService;
import org.csu.myPetStore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ViewCategoryServlet extends HttpServlet {

    private static final String VIEW_CATEGORY = "/WEB-INF/jsp/catalog/Category.jsp";
    private  String categoryId;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        categoryId = request.getParameter("categoryId");
      //  System.out.println(categoryId);
        CatalogService catalogService = new CatalogService();
        Category category = catalogService.getCategory(categoryId);
        List<Product> productList= catalogService.getProductListByCategory(categoryId);

        HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");
        if(account != null)
        {
            LogService logService = new LogService();
            logService.viewCategory(account.getUsername(),categoryId);
        }
        session.setAttribute("category",category);
        session.setAttribute("productList",productList);

        request.getRequestDispatcher(VIEW_CATEGORY).forward(request,response);
    }
}
