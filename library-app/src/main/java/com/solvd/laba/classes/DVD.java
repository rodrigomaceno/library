package com.solvd.laba.classes;

import java.util.Date;
import java.util.List;

public class DVD {
    private String title;
    private String author;
    private Date releaseDate;
    private String genre;
    private ItemRecommendation ir;
    private List<DVDLoan> loanList;
    private List<Reservation> reservationList;

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

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public ItemRecommendation getIr() {
        return ir;
    }

    public void setIr(ItemRecommendation ir) {
        this.ir = ir;
    }
}
