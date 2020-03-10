package org.csu.myPetStore.web.servlets;

import org.csu.myPetStore.domain.Account;
import org.csu.myPetStore.domain.CartShow;
import org.csu.myPetStore.domain.Order;
import org.csu.myPetStore.service.LogService;
import org.csu.myPetStore.service.OrderService;
import org.csu.myPetStore.service.SequenceService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ShippingFormServlet extends HttpServlet {
    private static final String CONFIRM_ORDER = "/WEB-INF/jsp/order/ConfirmOrder.jsp";
    private Order order;
    private Account account;
    private CartShow buyCartShow;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        order = new Order();
        account = (Account) session.getAttribute("account");
        buyCartShow = (CartShow) session.getAttribute("buyCartShow");
        SequenceService sequenceService =new SequenceService();
        order.setOderId(sequenceService.getOderNum());
        order.initOrder(account,buyCartShow);
        order.setCardType(req.getParameter("cardType"));
       // order.setCardType("Visa");
        order.setCreditCard(req.getParameter("creditCard"));
        order.setExpiryDate(req.getParameter("expiryDate"));
        order.setBillToFirstName(req.getParameter("billToFirstName"));
        order.setBillToLastName(req.getParameter("billToLastName"));
        order.setBillAddress1(req.getParameter("billAddress1"));
        order.setBillAddress2(req.getParameter("billAddress2"));
        order.setBillCity(req.getParameter("billCity"));
        order.setBillZip(req.getParameter("billZip"));
        order.setBillState(req.getParameter("billState"));
        order.setBillCountry(req.getParameter("billCountry"));


        String shippingAddressRequired = req.getParameter("shippingAddressRequired");
      //  System.out.println(shippingAddressRequired);
        session.setAttribute("shippingAddressRequired",shippingAddressRequired);
        session.setAttribute("order",order);

        if(shippingAddressRequired != null)
        {
            order.setShipToLastName(req.getParameter("shipToLastName"));
            order.setShipToFirstName(req.getParameter("shipToFirstName"));
            order.setShipAddress1(req.getParameter("shipAddress1"));
            order.setShipAddress2(req.getParameter("shipAddress2"));
            order.setShipCity(req.getParameter("shipCity"));
            order.setShipState(req.getParameter("shipState"));
            order.setShipZip(req.getParameter("shipZip"));
            order.setShipCountry(req.getParameter("shipCountry"));

        }
        OrderService orderService = new OrderService();
        orderService.insertOrder(order);
        LogService logService = new LogService();
        logService.createOrder(order.getUsername(),String.valueOf(order.getOrderId()));
        req.getRequestDispatcher(CONFIRM_ORDER).forward(req,resp);
    }
}
