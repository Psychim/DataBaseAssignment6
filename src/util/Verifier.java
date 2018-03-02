package util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Verifier {
    private static Pattern firstcharpat=Pattern.compile("^[a-zA-Z]");
    private static Pattern contentpat=Pattern.compile("^[a-zA-Z_0-9]*$");
    private static Pattern emailpat=Pattern.compile("^\\w+@\\w+(\\.\\w+)+$");
    public static int VerifyUsername(String username){
        if(username==null||username.length()<=0||username.length()>32)
            return 1;
        Matcher m=firstcharpat.matcher(username);
        if(!m.find())
            return 2;
        m=contentpat.matcher(username);
        if(!m.matches())
            return 3;
        return 0;
    }
    public static int VerifyPassword(String password){
        if(password==null||password.length()<6||password.length()>64)
            return 1;
        Matcher m=contentpat.matcher(password);
        if(!m.matches())
            return 2;
        return 0;
    }
    public static int VerifyEmail(String email){
        if(email==null||email.length()<1||email.length()>255)
            return 1;
        Matcher m=emailpat.matcher(email);
        if(!m.matches())
            return 2;
        return 0;
    }
    public static int VerifyName(String name){
        if(name==null||name.length()<1||name.length()>255)
            return 1;
        return 0;
    }
    public static boolean VerifyUsername(String username, HttpServletRequest req, HttpServletResponse resp,String forw) throws ServletException, IOException {
        int res= Verifier.VerifyUsername(username);
        switch(res){
            case 1:
                req.setAttribute("message","Username must be of 1~32 characters.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+forw).forward(req,resp);
                return false;
            case 2:
                req.setAttribute("message","The first character must be a letter.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+forw).forward(req,resp);
                return false;
            case 3:
                req.setAttribute("message","Username must only contains letters, underscores or numbers.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+forw).forward(req,resp);
                return false;
        }
        return true;
    }
    public static boolean VerifyPassword(String password,HttpServletRequest req,HttpServletResponse resp,String forw) throws ServletException, IOException {
        int res= Verifier.VerifyPassword(password);
        switch(res){
            case 1:
                req.setAttribute("message","Password must be of 6~64 characters.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+forw).forward(req,resp);
                return false;
            case 2:
                req.setAttribute("message","Password must only contains letters, underscores or numbers.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+forw).forward(req,resp);
                return false;
        }
        return true;
    }
    public static boolean VerifyEmail(String email,HttpServletRequest req,HttpServletResponse resp,String forw) throws ServletException, IOException {
        int res=Verifier.VerifyEmail(email);
        switch(res){
            case 1:
                req.setAttribute("message","E-mail must be of 1~255 characters.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+forw).forward(req,resp);
                return false;
            case 2:
                req.setAttribute("message","Incorrect fomat of E-mail. ");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+forw).forward(req,resp);
                return false;
        }
        return true;
    }
    public static boolean VerifyName(String name,HttpServletRequest req,HttpServletResponse resp,String forw) throws ServletException, IOException {
        int res=Verifier.VerifyName(name);
        switch(res){
            case 1:
                req.setAttribute("message","Firstname must be of 1~255 characters.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+forw).forward(req,resp);
                return false;
        }
        return true;
    }
}
