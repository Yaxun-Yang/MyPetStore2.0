package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Product;
import org.csu.myPetStore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SearchProductsServlet extends HttpServlet {
    private String keyword;
    private static final String SEARCH_PRODUCTS = "/WEB-INF/jsp/catalog/SearchProducts.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        keyword = req.getParameter("keyword");
        CatalogService categoryService = new CatalogService();
        List<Product> productList = categoryService.searchProductList(keyword);

        HttpSession session = req.getSession();
        session.setAttribute("productList",productList);

        req.getRequestDispatcher(SEARCH_PRODUCTS).forward(req,resp);
    }
}
