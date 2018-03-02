package util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConManager {
    public static Connection getConnection() throws NamingException, SQLException {
        Context ctx=new InitialContext();
        DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/bookstore_connect");
        return ds.getConnection();
    }
}
