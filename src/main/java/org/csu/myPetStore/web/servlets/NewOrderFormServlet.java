package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.CartItemShow;
import org.csu.myPetStore.domain.CartShow;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class NewOrderFormServlet extends HttpServlet {
    private static final String NEW_ORDER_FORM = "/WEB-INF/jsp/order/NewOrderForm.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session =req.getSession();
        CartShow cartShow =(CartShow)session.getAttribute("cartShow");
        List<CartItemShow> cartItemShowList1 = cartShow.getCartItemShowList();
        List<CartItemShow> cartItemShowList2 = new ArrayList<>();
        for(int i=0;i<cartItemShowList1.size();i++)
        {
            String checkName = cartItemShowList1.get(i).getItem().getItemId()+"_check";
            String checkBox = req.getParameter(checkName);
            if(checkBox != null)
            {
                cartItemShowList2.add(cartItemShowList1.get(i));
            }
        }
            session.setAttribute("buyCartShow",new CartShow(cartItemShowList2));
        req.getRequestDispatcher(NEW_ORDER_FORM).forward(req,resp);
    }
}
