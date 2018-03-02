package model;

public class RegisterResult {
    public enum RegisterStatus{
        Success,UserExist,Failure
    }
    private RegisterStatus rs;
    public RegisterResult(){
        rs=RegisterStatus.Failure;
    }
    public RegisterResult(RegisterStatus r){
        setRs(r);
    }
    public RegisterStatus getRs() {
        return rs;
    }

    public void setRs(RegisterStatus rs) {
        this.rs = rs;
    }



}
