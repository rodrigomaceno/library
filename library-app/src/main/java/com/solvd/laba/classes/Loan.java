package com.solvd.laba.classes;

import java.util.Date;
import java.util.List;

public class Loan {
    private int id;
    private Account acc;
    private int numItems;
    private Date date;
    private List<DVDLoan> dvdLoans;
    private List<CDLoan> cdLoans;
    private List<BookLoan> bookLoans;
    private History history;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }

    public int getNumItems() {
        return numItems;
    }

    public void setNumItems(int numItems) {
        this.numItems = numItems;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<DVDLoan> getDvdLoans() {
        return dvdLoans;
    }

    public void setDvdLoans(List<DVDLoan> dvdLoans) {
        this.dvdLoans = dvdLoans;
    }

    public List<CDLoan> getCdLoans() {
        return cdLoans;
    }

    public void setCdLoans(List<CDLoan> cdLoans) {
        this.cdLoans = cdLoans;
    }

    public List<BookLoan> getBookLoans() {
        return bookLoans;
    }

    public void setBookLoans(List<BookLoan> bookLoans) {
        this.bookLoans = bookLoans;
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }
}
