package service;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import dao.UserDAO;
import model.FindpasswordResult;
import model.LoginResult;
import model.RegisterResult;
import model.User;
import util.ConManager;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;

public class UserService {
    public static LoginResult Login(String username,String password){
        Connection con=null;
        LoginResult ls=new LoginResult();
        try{
            con= ConManager.getConnection();
            ls= UserDAO.Login(con,username,password);
        }catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ls;
    }
    public static RegisterResult Register(User user){
        Connection con=null;
        RegisterResult rr=new RegisterResult();
        try{
            con=ConManager.getConnection();
            rr=UserDAO.Register(con,user);
        } catch (NamingException e) {
            e.printStackTrace();
        }catch(MySQLIntegrityConstraintViolationException e){
            if(e.getMessage().matches("^Duplicate entry.*"))
                rr.setRs(RegisterResult.RegisterStatus.UserExist);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return rr;
    }
    public static FindpasswordResult Findpassword(User user){
        Connection con=null;
        FindpasswordResult fpr=new FindpasswordResult();
        try{
            con=ConManager.getConnection();
            boolean res=UserDAO.CheckUser(con,user.getUsername(),user.getEmail());
            if(!res){
                fpr.setFps(FindpasswordResult.FindpasswordStatus.InfoMisMatch);
                return fpr;
            }
            res=UserDAO.UpdatePassword(con,user.getUsername(),user.getPassword());
            if(res)
                fpr.setFps(FindpasswordResult.FindpasswordStatus.Success);
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fpr;
    }
    public static boolean UpdatePassword(String username,String password){
        Connection con=null;
        boolean res=false;
        try{
            con=ConManager.getConnection();
            res=UserDAO.UpdatePassword(con,username,password);
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public static boolean UpdateFirstname(String username,String firstname){
        Connection con=null;
        boolean res=false;
        try{
            con=ConManager.getConnection();
            res=UserDAO.UpdateFirstname(con,username,firstname);
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public static boolean UpdateLastname(String username,String lastname){
        Connection con=null;
        boolean res=false;
        try{
            con=ConManager.getConnection();
            res=UserDAO.UpdateLastname(con,username,lastname);
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    public static boolean UpdateEmail(String username,String email){
        Connection con=null;
        boolean res=false;
        try{
            con=ConManager.getConnection();
            res=UserDAO.UpdateEmail(con,username,email);
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
}
