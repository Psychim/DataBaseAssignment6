package servlet;

import model.User;
import service.UserService;
import util.Verifier;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    public void forward(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        req.removeAttribute("password");
        req.getRequestDispatcher(req.getContextPath()+"/dbp-user.jsp").forward(req,resp);
        return;
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        User olduser=(User)session.getAttribute("user");
        if(olduser==null){
            resp.sendRedirect("/logout-warning.html");
            return;
        }
        User newuser=new User();
        newuser.setUsername(olduser.getUsername());
        newuser.setFirstname((String)req.getParameter("firstname"));
        newuser.setLastname((String)req.getParameter("lastname"));
        newuser.setEmail((String)req.getParameter("email"));
        newuser.setPassword((String)req.getParameter("password"));
        if(newuser.getFirstname()!=olduser.getFirstname()){
            if(!Verifier.VerifyName(newuser.getFirstname(),req,resp,"/dbp-user.jsp"))
                return;
            boolean res= UserService.UpdateFirstname(newuser.getUsername(),newuser.getFirstname());
            if(!res){
                req.setAttribute("message","Firstname update failed.");
                forward(req,resp);
                return;
            }
            olduser.setFirstname(newuser.getFirstname());
            session.setAttribute("user",olduser);
        }
        if(newuser.getLastname()!=olduser.getLastname()){
            if(!Verifier.VerifyName(newuser.getLastname(),req,resp,"/dbp-user.jsp"))
                return;
            boolean res=UserService.UpdateLastname(newuser.getUsername(),newuser.getLastname());
            if(!res){
                req.setAttribute("message","Lastname update failed.");
                forward(req,resp);
                return;
            }
            olduser.setLastname(newuser.getLastname());
            session.setAttribute("user",olduser);
        }
        if(newuser.getEmail()!=olduser.getEmail()){
            if(!Verifier.VerifyEmail(newuser.getEmail(),req,resp,"/dbp-user.jsp"))
                return;
            boolean res=UserService.UpdateEmail(newuser.getUsername(),newuser.getEmail());
            if(!res){
                req.setAttribute("message","Email update failed.");
                forward(req,resp);
                return;
            }
            olduser.setEmail(newuser.getEmail());
            session.setAttribute("user",olduser);
        }
        if(newuser.getPassword()!=""&&newuser.getPassword()!=null){
            if(!Verifier.VerifyPassword(newuser.getPassword(),req,resp,"/dbp-user.jsp"))
                return;
            boolean res=UserService.UpdatePassword(newuser.getUsername(),newuser.getPassword());
            if(!res){
                req.setAttribute("message","Password update failed.");
                forward(req,resp);
                return;
            }
        }
        resp.sendRedirect("/update-success.html");
    }
}
