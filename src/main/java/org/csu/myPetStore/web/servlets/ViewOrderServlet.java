package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Cart;
import org.csu.myPetStore.domain.CartShow;
import org.csu.myPetStore.domain.Order;
import org.csu.myPetStore.service.CartService;
import org.csu.myPetStore.service.LogService;
import org.csu.myPetStore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ViewOrderServlet extends HttpServlet {
    private OrderService orderService;
    private static final String VIEW_ORDER = "/WEB-INF/jsp/order/ViewOrder.jsp";
 //   private static final String NEW_ORDER_FORM = "/WEB-INF/jsp/order/NewOrderForm.jsp";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Order order = (Order) session.getAttribute("order");
        CartShow cartShow = (CartShow) session.getAttribute("cartShow");
        CartShow buyCartShow =  (CartShow)session.getAttribute("buyCartShow");
        cartShow.clear(buyCartShow);
        session.setAttribute("cartShow",cartShow);
       CartService cartService= new CartService();
      Cart cart = (Cart) session.getAttribute("cart");
       cartService.clear(cart,buyCartShow.getCartItemShowList());
       session.setAttribute("buyCartShow",null);

//        CartShow cartShow = (CartShow) session.getAttribute("cartShow");
//        System.out.println(cartShow.getCartItemShowList().size());
//        List<LineItem> lineItemList = new ArrayList<>();
//        for(int i = 0; i < cartShow.getCartItemShowList().size() - 1;i ++) {
//            LineItem lineItem = new LineItem();
//            lineItem.setItem(cartShow.getCartItemShowList().get(i).getItem());
//            lineItem.setQuantity(cartShow.getCartItemShowList().get(i).getQuantity());
//            lineItem.setUnitPrice(cartShow.getCartItemShowList().get(i).getTotalCost());
//            lineItemList.add(lineItem);
//        }
//        order.setLineItems((lineItemList));

  //      session.setAttribute("order",order);



        orderService = new OrderService();
        orderService.payForOrder(order);
        session.setAttribute("order",order);
        LogService logService = new LogService();
        logService.payForOrder(order.getUsername(),String.valueOf(order.getOrderId()));

        req.getRequestDispatcher(VIEW_ORDER).forward(req,resp);
    }
}
