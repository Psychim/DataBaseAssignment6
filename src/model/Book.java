package model;

import java.util.Objects;

public class Book {


    private int bid=-1;
    private String isbn=null;
    private String title=null;
    private String author=null;
    private String brief=null;
    private String image=null;
    private int stock;
    private double price;
    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Book)) return false;
        Book book = (Book) o;
        return getBid() == book.getBid();
    }

    @Override
    public int hashCode() {

        return Objects.hash(getBid());
    }
}
