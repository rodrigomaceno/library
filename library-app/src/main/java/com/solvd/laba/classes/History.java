package com.solvd.laba.classes;

import java.util.List;

public class History {
    private Integer id;
    private List<String> booksCheckedOut;
    private List<String> dvdsCheckedOut;
    private List<String> cdsCheckedOut;
    private Account acc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<String> getBooksCheckedOut() {
        return booksCheckedOut;
    }

    public void setBooksCheckedOut(List<String> booksCheckedOut) {
        this.booksCheckedOut = booksCheckedOut;
    }

    public List<String> getDvdsCheckedOut() {
        return dvdsCheckedOut;
    }

    public void setDvdsCheckedOut(List<String> dvdsCheckedOut) {
        this.dvdsCheckedOut = dvdsCheckedOut;
    }

    public List<String> getCdsCheckedOut() {
        return cdsCheckedOut;
    }

    public void setCdsCheckedOut(List<String> cdsCheckedOut) {
        this.cdsCheckedOut = cdsCheckedOut;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }
}
