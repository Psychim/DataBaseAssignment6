package dao;

import model.Book;
import model.BookList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDAO {
    public static BookList Search(Connection con,String isbn,String title,String author,int offset,int size) throws SQLException {
        PreparedStatement ps=con.prepareStatement("SELECT * FROM book WHERE isbn LIKE ? AND title LIKE ? AND author LIKE ? LIMIT ?,?");

        ps.setString(1,isbn);
        ps.setString(2,title);
        ps.setString(3,author);
        ps.setInt(4,offset);
        ps.setInt(5,size);
        ResultSet rs=ps.executeQuery();
        System.out.println(rs.getStatement());
        BookList bl=new BookList();
        while(rs.next()){
            Book b=new Book();
            b.setBid(rs.getInt("bid"));
            b.setAuthor(rs.getString("author"));
            b.setIsbn(rs.getString("isbn"));
            b.setTitle(rs.getString("title"));
            b.setPrice(rs.getDouble("price"));
            b.setImage(rs.getString("image"));
            bl.add(b);
        }
        return bl;
    }
    public static int ItemNumber(Connection con,String isbn,String title,String author) throws SQLException {
        PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) FROM book WHERE isbn LIKE ? AND title LIKE ? AND author LIKE ?");
        ps.setString(1,isbn);
        ps.setString(2,title);
        ps.setString(3,author);
        ResultSet rs=ps.executeQuery();
        int num=0;
        if(rs.next()){
            num=rs.getInt(1);
        }
        return num;
    }
    public static Book SelectBook(Connection con,int bid) throws SQLException {
        PreparedStatement ps=con.prepareStatement("SELECT * FROM book WHERE bid=?");
        ps.setInt(1,bid);
        ResultSet rs=ps.executeQuery();
        Book b=new Book();
        if(rs.next()){
            b.setBid(bid);
            b.setStock(rs.getInt("stock"));
            b.setPrice(rs.getDouble("price"));
            b.setTitle(rs.getString("title"));
            b.setIsbn(rs.getString("isbn"));
            b.setAuthor(rs.getString("author"));
            b.setBrief(rs.getString("brief"));
            b.setImage(rs.getString("image"));
        }
        return b;
    }
    public static void UpdateBookStock(Connection con,Book b,int delta) throws SQLException {
        PreparedStatement ps=con.prepareStatement("UPDATE book SET stock=stock+? WHERE bid=?");
        int i=1;
        ps.setInt(i++,delta);
        ps.setInt(i++,b.getBid());
        ps.executeUpdate();
    }
}
