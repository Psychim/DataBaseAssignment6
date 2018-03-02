package util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

public class StringUtil {
    public static String ToSearchString(String s){
        String res=s;
        res=res.replaceAll("\\s+","%");
        res=res.replaceAll("^","%");
        res=res.replaceAll("$","%");
        res=res.replaceAll("%+","%");
        return res;
    }
}
