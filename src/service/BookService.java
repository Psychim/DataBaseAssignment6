package service;

import dao.BookDAO;
import model.Book;
import model.BookList;
import util.ConManager;
import util.StringUtil;

import javax.naming.NamingException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

public class BookService {
    public static BookList  Search(String isbn,String title,String author,int offset,int size){
        Connection con=null;
        BookList bl=new BookList();
        try{
            con= ConManager.getConnection();
            bl= BookDAO.Search(con, StringUtil.ToSearchString(isbn),StringUtil.ToSearchString(title),StringUtil.ToSearchString(author),offset,size);
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bl;
    }
    public static int ItemNumber(String isbn,String title,String author){
        Connection con=null;
        int num=0;
        try{
            con= ConManager.getConnection();
            num= BookDAO.ItemNumber(con, StringUtil.ToSearchString(isbn),StringUtil.ToSearchString(title),StringUtil.ToSearchString(author));
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return num;
    }
    public static Book SelectBook(int bid){
        Connection con=null;
        Book b=new Book();
        try{
            con=ConManager.getConnection();
            b=BookDAO.SelectBook(con,bid);
        } catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }
}
