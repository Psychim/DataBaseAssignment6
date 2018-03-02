package util;

import model.Book;
import model.Cart;
import service.BookService;

import javax.servlet.http.Cookie;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CartUtil {
    private static final Pattern CARTPAT=Pattern.compile("^CART(\\d+)$");
    public static boolean CheckBook(Cookie[]carr, Book b) throws UnsupportedEncodingException {
        String bname="CART"+b.getBid();
        for(Cookie c:carr){
            if(c.getName().equals(bname)){
               return false;
            }
        }
        return true;
    }
    public static Cookie ConstructBookCookie(Book b,int quantity) throws UnsupportedEncodingException {
        String name="CART"+b.getBid();
        String value=Integer.toString(quantity);
        Cookie c=new Cookie(name,value);
        c.setPath("/");
        c.setMaxAge(60*60);
        return c;
    }
    public static Cart ConstructCart(Cookie[]carr){
        Cart cart=new Cart();
        for(Cookie c:carr){
            Matcher m=CARTPAT.matcher(c.getName());
            if(m.matches()){
                int bid=Integer.parseInt(m.group(1));
                Book b= BookService.SelectBook(bid);
                if(b.getBid()!=-1){
                    cart.add(b,Integer.parseInt(c.getValue()));
                }
            }
        }
        return cart;
    }
}
