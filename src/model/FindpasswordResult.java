package model;

public class FindpasswordResult {


    public enum FindpasswordStatus{
        Success,InfoMisMatch,Failure
    }
    private FindpasswordStatus fps;
    public FindpasswordStatus getFps() {
        return fps;
    }

    public void setFps(FindpasswordStatus fps) {
        this.fps = fps;
    }
}
