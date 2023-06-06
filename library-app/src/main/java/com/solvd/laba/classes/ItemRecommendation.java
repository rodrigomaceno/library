package com.solvd.laba.classes;

import java.util.List;

public class ItemRecommendation {
    private Integer id;

    // change relationship
    private String[] recommendedBooks;
    private String[] recommendedCDs;
    private String[] recommendedDVDs;
    private List<Book> books;
    private List<CD> cds;
    private List<DVD> dvds;
    private Account acc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }
}
