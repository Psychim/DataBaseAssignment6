package model;

public class LoginResult {
    private User user;
    private LoginStatus ls;
    public enum LoginStatus {
        Success,Incorrectness,Failure
    }
    public LoginResult() {
        user = null;
        ls = LoginStatus.Failure;
    }
    public LoginResult(LoginStatus l){
        setLs(l);
        user=null;
    }
    public LoginResult(User u){
        setUser(u);
        setLs(LoginStatus.Success);
    }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LoginStatus getLs() {
        return ls;
    }

    public void setLs(LoginStatus ls) {
        this.ls = ls;
    }


}
