package model;

import java.util.Vector;

public class BookList {
    private Vector<Book> bl=new Vector<Book>();
    public void add(Book b){
        bl.add(b);
    }
    public Book get(int i){
        return bl.get(i);
    }
    public int size(){
        return bl.size();
    }
}
