package model;

import javafx.util.Pair;

import java.util.HashMap;
import java.util.Vector;

public class Cart {
    private Vector<Pair<Book,Integer>> cart=new Vector<Pair<Book,Integer>>();
    public void add(Book b,int quantity){
        cart.add(new Pair<Book, Integer>(b,quantity));
    }
    public Pair<Book,Integer> get(int i){
        return cart.get(i);
    }
    public int size(){
        return cart.size();
    }
}
