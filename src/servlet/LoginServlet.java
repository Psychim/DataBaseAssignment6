package servlet;

import model.LoginResult;
import service.UserService;
import util.Verifier;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session=req.getSession();
        String username=(String)req.getParameter("username");
        if(!Verifier.VerifyUsername(username,req,resp,"/dbp-login.jsp"))
            return;
        String password=(String)req.getParameter("password");
        if(!Verifier.VerifyPassword(password,req,resp,"/dbp-login.jsp"))
            return;
        LoginResult lr= UserService.Login(username,password);
        switch(lr.getLs()){
            case Success:
                session.setAttribute("user",lr.getUser());
                resp.sendRedirect(req.getContextPath()+"/dbp-checkout.jsp");
                break;
            case Incorrectness:
                req.setAttribute("message","Incorrect username or password.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+"/dbp-login.jsp").forward(req,resp);
                break;
            case Failure:
                req.setAttribute("message","Unknowned error.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+"/dbp-login.jsp").forward(req,resp);
                break;
        }
    }
}
