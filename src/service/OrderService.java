package service;

import dao.BookDAO;
import dao.OrderDAO;
import model.Cart;
import model.OrderInfo;
import model.User;
import util.ConManager;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

public class OrderService {
    public static boolean SubmitOrder(OrderInfo oi, User u, Cart cart, Date d){
        Connection con=null;
        try{
            con= ConManager.getConnection();
            con.setAutoCommit(false);
            OrderDAO.InsertOrder(con,oi,u,d);
            for(int i=0;i<cart.size();i++){
                OrderDAO.InsertBookOrder(con,oi,cart.get(i).getKey(),cart.get(i).getValue());
                BookDAO.UpdateBookStock(con,cart.get(i).getKey(),-cart.get(i).getValue());
            }
            con.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if(con!=null) {
                try {
                    con.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
            return false;
        }
    }
}
