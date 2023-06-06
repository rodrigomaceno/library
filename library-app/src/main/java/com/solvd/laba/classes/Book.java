package com.solvd.laba.classes;

import java.time.Year;
import java.util.Date;

public class Book {
    private String isbn;
    private String title;
    private Year publishingYear;
    private String author;
    private ItemRecommendation ir;

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

    public Date getYear() {
        return year;
    }

    public void setYear(Date year) {
        this.year = year;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public ItemRecommendation getIr() {
        return ir;
    }

    public void setIr(ItemRecommendation ir) {
        this.ir = ir;
    }
}
