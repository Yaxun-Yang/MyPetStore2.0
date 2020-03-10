package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Product;
import org.csu.myPetStore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class FindResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取搜索框输入的内容
        String keyword = request.getParameter("keyword");
        //向server层调用相应的业务
        CatalogService service = new CatalogService();
        List<Product> productList = service.searchProductList(keyword);

        response.setContentType("text/xml");
        PrintWriter out = response.getWriter();

        //返回结果
        String res = "";
        for(int i=0; i<productList.size(); i++){
            if(i>0){
                res += "," + productList.get(i);
            }else{
                res += productList.get(i);
            }
        }

        //System.out.println(productList);
        out.write(res);

        out.flush();
        out.close();
    }
}
