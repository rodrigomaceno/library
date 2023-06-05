package com.solvd.laba.classes;

public class Reservation {
    private Integer idReservations;
    private DVD dvd;
    private Book book;
    private CD cd;
    private Integer dvdResNum;
    private Integer cdResNum;
    private Integer isbnResNum;
    private Account acc;

    public Integer getIdReservations() {
        return idReservations;
    }

    public void setIdReservations(Integer idReservations) {
        this.idReservations = idReservations;
    }

    public DVD getDvd() {
        return dvd;
    }

    public void setDvd(DVD dvd) {
        this.dvd = dvd;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public CD getCd() {
        return cd;
    }

    public void setCd(CD cd) {
        this.cd = cd;
    }

    public Integer getDvdResNum() {
        return dvdResNum;
    }

    public void setDvdResNum(Integer dvdResNum) {
        this.dvdResNum = dvdResNum;
    }

    public Integer getCdResNum() {
        return cdResNum;
    }

    public void setCdResNum(Integer cdResNum) {
        this.cdResNum = cdResNum;
    }

    public Integer getIsbnResNum() {
        return isbnResNum;
    }

    public void setIsbnResNum(Integer isbnResNum) {
        this.isbnResNum = isbnResNum;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }
}
