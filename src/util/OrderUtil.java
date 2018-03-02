package util;

import model.User;

import java.util.Date;

public class OrderUtil {
    public static String generateOID(User u,Date d){
        return u.getUsername()+"-"+d.getTime();
    }
}
