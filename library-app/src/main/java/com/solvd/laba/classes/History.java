package com.solvd.laba.classes;

import java.util.List;

public class History {
    private int id;
    private List<Book> booksCheckedOut;
    private List<DVD> dvdsCheckedOut;
    private List<CD> cdsCheckedOut;
    private List<Loan> loans;
    private Account acc;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Book> getBooksCheckedOut() {
        return booksCheckedOut;
    }

    public void setBooksCheckedOut(List<Book> booksCheckedOut) {
        this.booksCheckedOut = booksCheckedOut;
    }

    public List<DVD> getDvdsCheckedOut() {
        return dvdsCheckedOut;
    }

    public void setDvdsCheckedOut(List<DVD> dvdsCheckedOut) {
        this.dvdsCheckedOut = dvdsCheckedOut;
    }

    public List<CD> getCdsCheckedOut() {
        return cdsCheckedOut;
    }

    public void setCdsCheckedOut(List<CD> cdsCheckedOut) {
        this.cdsCheckedOut = cdsCheckedOut;
    }

    public List<Loan> getLoans() {
        return loans;
    }

    public void setLoans(List<Loan> loans) {
        this.loans = loans;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }
}
