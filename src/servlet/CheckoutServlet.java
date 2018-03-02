package servlet;

import model.Cart;
import model.OrderInfo;
import model.User;
import service.OrderService;
import util.CartUtil;
import util.Global;
import util.OrderUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Cart cart=CartUtil.ConstructCart(req.getCookies());
        if(!checkQuantity(cart)){
            resp.sendRedirect("invalid-quantity.html");
            return;
        }
        OrderInfo oi=new OrderInfo();
        oi.setTelephone(req.getParameter("telephone"));
        oi.setCreditcard(req.getParameter("creditcardnumber"));
        oi.setCompany(req.getParameter("company"));
        oi.setAddress(req.getParameter("address"));
        oi.setCity(req.getParameter("city"));
        oi.setPostcode(req.getParameter("post-code"));
        oi.setCountry(req.getParameter("country"));
        oi.setState(req.getParameter("region-state"));
        User u=(User)req.getSession().getAttribute("user");
        Date d=new Date();
        oi.setOid(OrderUtil.generateOID(u,d));
        boolean res= OrderService.SubmitOrder(oi,u,cart,d);
        if(!res){
            resp.sendRedirect("order-failure.html");
            return;
        }
        resp.sendRedirect("order-success.html");
    }
    private boolean checkQuantity(Cart cart){
        for(int i=0;i<cart.size();i++){
            if(cart.get(i).getValue()< Global.MIN_QUANTITY||cart.get(i).getValue()>Global.MAX_QUANTITY)
                return false;
        }
        return true;
    }
}
