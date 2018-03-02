package servlet;

import model.FindpasswordResult;
import model.User;
import service.UserService;
import util.Verifier;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FindpasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    public void forward(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        req.removeAttribute("password");
        req.getRequestDispatcher(req.getContextPath()+"/dbp-forgotton-password.jsp").forward(req,resp);
        return;
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user=new User();
        user.setUsername((String)req.getParameter("username"));
        if(!Verifier.VerifyUsername(user.getUsername(),req,resp,"/dbp-forgotton-password.jsp"))
            return;
        user.setEmail((String)req.getParameter("email"));
        if(!Verifier.VerifyEmail(user.getEmail(),req,resp,"/dbp-forgotton-password.jsp"))
            return;
        user.setPassword((String)req.getParameter("password"));
        if(!Verifier.VerifyPassword(user.getPassword(),req,resp,"/dbp-forgotton-password.jsp"))
            return;
        FindpasswordResult fpr= UserService.Findpassword(user);
        switch(fpr.getFps()){
            case Success:
                resp.sendRedirect("/findpassword-success.html");
                return;
            case InfoMisMatch:
                req.setAttribute("message","Username and E-mail mismatched each other.");
                forward(req,resp);
                return;
            case Failure:
                req.setAttribute("message","Unknown Error.");
                forward(req,resp);
                return;
        }
    }
}
