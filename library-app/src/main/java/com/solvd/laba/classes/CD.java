package com.solvd.laba.classes;

import java.util.Date;

public class CD {
    private String title;
    private String artist;
    private Date releaseDate;
    private String recordLabel;
    private String genre;
    private ItemRecommendation ir;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getRecordLabel() {
        return recordLabel;
    }

    public void setRecordLabel(String recordLabel) {
        this.recordLabel = recordLabel;
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
