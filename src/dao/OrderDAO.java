package dao;

import model.Book;
import model.Cart;
import model.OrderInfo;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class OrderDAO {
    public static void InsertOrder(Connection con, OrderInfo oi, User u, Date d) throws SQLException {
        PreparedStatement ps=con.prepareStatement("INSERT INTO orderinfo(oid,username,time_stamp,telephone,creditcard,company,postcode,address,city,state,country)" +
                "VALUES(?,?,?,?,?,?,?,?,?,?,?)");
        int i=1;
        ps.setString(i++,oi.getOid());
        ps.setString(i++,u.getUsername());
        ps.setLong(i++,d.getTime());
        ps.setString(i++,oi.getTelephone());
        ps.setString(i++,oi.getCreditcard());
        ps.setString(i++,oi.getCompany());
        ps.setString(i++,oi.getPostcode());
        ps.setString(i++,oi.getAddress());
        ps.setString(i++,oi.getCity());
        ps.setString(i++,oi.getState());
        ps.setString(i++,oi.getCountry());
        ps.executeUpdate();
    }
    public static void InsertBookOrder(Connection con,OrderInfo oi, Book b, int quantity) throws SQLException {
        PreparedStatement ps=con.prepareStatement("INSERT INTO bookorder(oid,bid,quantity)VALUES(?,?,?)");
        int i=1;
        ps.setString(i++,oi.getOid());
        ps.setInt(i++,b.getBid());
        ps.setInt(i++,quantity);
        ps.executeUpdate();
    }

}
