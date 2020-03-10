package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.domain.Item;
import org.csu.myPetStore.service.CatalogService;
import org.csu.myPetStore.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class ViewItemServlet extends HttpServlet {
    private static final String VIEW_ITEM = "/WEB-INF/jsp/catalog/Item.jsp";
    private String itemId;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        itemId = req.getParameter("itemId");
        CatalogService service = new CatalogService();
        Item item = service.getItem(itemId);

        HttpSession session = req.getSession();
        session.setAttribute("item",item);

        Account account=(Account)session.getAttribute("account");
        if(account != null)
        {
            LogService logService =new LogService();
            logService.viewItem(account.getUsername(),itemId);
        }
//        if(item != null)
//        System.out.println(item.getItemId());
//        else
//            System.out.println("null");
        req.getRequestDispatcher(VIEW_ITEM).forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req,resp);
    }
}
