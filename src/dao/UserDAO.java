package dao;

import model.FindpasswordResult;
import model.LoginResult;
import model.RegisterResult;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public static LoginResult Login(Connection con, String username, String password) throws SQLException {
        PreparedStatement ps=con.prepareStatement("SELECT * FROM user WHERE username=? AND password=PASSWORD(?)");
        ps.setString(1,username);
        ps.setString(2,password);
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
            User user=new User();
            String firstname=rs.getString("firstname");
            String lastname=rs.getString("lastname");
            String email=rs.getString("email");
            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setUsername(username);
            user.setEmail(email);
            return new LoginResult(user);
        }
        else return new LoginResult(LoginResult.LoginStatus.Incorrectness);
    }
    public static RegisterResult Register(Connection con,User user) throws SQLException {
        PreparedStatement ps=con.prepareStatement("INSERT INTO user(username,password,firstname,lastname,email)VALUES(?,PASSWORD(?),?,?,?)");
        ps.setString(1,user.getUsername());
        ps.setString(2,user.getPassword());
        ps.setString(3,user.getFirstname());
        ps.setString(4,user.getLastname());
        ps.setString(5,user.getEmail());
        if(ps.executeUpdate()>0)
            return new RegisterResult(RegisterResult.RegisterStatus.Success);
        else return new RegisterResult(RegisterResult.RegisterStatus.Failure);
    }
    public static boolean CheckUser(Connection con,String username,String email) throws SQLException {
        PreparedStatement ps=con.prepareStatement("SELECT * FROM user WHERE username=? AND email=?");
        ps.setString(1,username);
        ps.setString(2,email);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
            return true;
        else return false;
    }
    public static boolean UpdatePassword(Connection con,String username,String password) throws SQLException {
        PreparedStatement ps=con.prepareStatement("UPDATE user SET password=PASSWORD(?) WHERE username=?");
        ps.setString(1,password);
        ps.setString(2,username);
        if(ps.executeUpdate()>0)
            return true;
        else return false;
    }
    public static boolean UpdateFirstname(Connection con,String username,String firstname) throws SQLException{
        PreparedStatement ps=con.prepareStatement("UPDATE user SET firstname=? WHERE username=?");
        ps.setString(1,firstname);
        ps.setString(2,username);
        if(ps.executeUpdate()>0)
            return true;
        else return false;
    }
    public static boolean UpdateLastname(Connection con,String username,String lastname) throws SQLException{
        PreparedStatement ps=con.prepareStatement("UPDATE user SET lastname=? WHERE username=?");
        ps.setString(1,lastname);
        ps.setString(2,username);
        if(ps.executeUpdate()>0)
            return true;
        else return false;
    }
    public static boolean UpdateEmail(Connection con,String username,String email) throws SQLException{
        PreparedStatement ps=con.prepareStatement("UPDATE user SET email=? WHERE username=?");
        ps.setString(1,email);
        ps.setString(2,username);
        if(ps.executeUpdate()>0)
            return true;
        else return false;
    }
}
