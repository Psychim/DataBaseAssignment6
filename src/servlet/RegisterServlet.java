package servlet;

import model.RegisterResult;
import model.User;
import service.UserService;
import util.Verifier;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user=new User();
        user.setUsername((String)req.getParameter("username"));
        if(!Verifier.VerifyUsername(user.getUsername(),req,resp,"/dbp-reg-page.jsp"))
            return;
        user.setPassword((String)req.getParameter("password"));
        if(!Verifier.VerifyPassword(user.getPassword(),req,resp,"/dbp-reg-page.jsp"))
            return;
        user.setFirstname((String)req.getParameter("firstname"));
        if(!Verifier.VerifyName(user.getFirstname(),req,resp,"/dbp-reg-page.jsp"))
            return;
        user.setLastname((String)req.getParameter("lastname"));
        if(!Verifier.VerifyName(user.getLastname(),req,resp,"/dbp-reg-page.jsp"))
            return;
        user.setEmail((String)req.getParameter("email"));
        if(!Verifier.VerifyEmail(user.getEmail(),req,resp,"/dbp-reg-page.jsp"))
            return;
        RegisterResult rr= UserService.Register(user);
        switch(rr.getRs()){
            case Success:
                resp.sendRedirect(req.getContextPath()+"/dbp-login.jsp");
                return;
            case UserExist:
                req.setAttribute("message","Username has existed. Please try another one.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+"/dbp-reg-page.jsp").forward(req,resp);
                return;
            case Failure:
                req.setAttribute("message","Unknown Error.");
                req.removeAttribute("password");
                req.getRequestDispatcher(req.getContextPath()+"/dbp-reg-page.jsp").forward(req,resp);
                return;
        }
    }
}
