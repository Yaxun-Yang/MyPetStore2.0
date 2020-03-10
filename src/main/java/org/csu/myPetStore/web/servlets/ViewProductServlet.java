package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.domain.Item;
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

public class ViewProductServlet extends HttpServlet
{
    private static final String VIEW_PRODUCT = "/WEB-INF/jsp/catalog/Product.jsp";
    private String productId;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        productId = request.getParameter("productId");


        HttpSession session = request.getSession();
        Account account =(Account)session.getAttribute("account");

        if(account != null)
        {
            LogService logService =new LogService();
            logService.viewProduct(account.getUsername(),productId);
           // System.out.println("1"+account.getUsername());
        }


        CatalogService service = new CatalogService();
        Product product = service.getProduct(productId);

        List<Item> itemList = service.getItemListByProduct(productId);

        session.setAttribute("product",product);
        session.setAttribute("itemList",itemList);
       // System.out.println(product.getName());
        request.getRequestDispatcher(VIEW_PRODUCT).forward(request,response);
    }
}
