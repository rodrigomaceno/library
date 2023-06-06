package com.solvd.laba.classes;

import java.util.List;

public class PreferencesRecord {
    private int idPreferences;
    private List<String> favoriteBooks;
    private List<String> favoriteDVDs;
    private List<String> favoriteCDs;

    public Integer getIdPreferences() {
        return idPreferences;
    }

    public void setIdPreferences(Integer idPreferences) {
        this.idPreferences = idPreferences;
    }

    public List<String> getFavoriteBooks() {
        return favoriteBooks;
    }

    public void setFavoriteBooks(List<String> favoriteBooks) {
        this.favoriteBooks = favoriteBooks;
    }

    public List<String> getFavoriteDVDs() {
        return favoriteDVDs;
    }

    public void setFavoriteDVDs(List<String> favoriteDVDs) {
        this.favoriteDVDs = favoriteDVDs;
    }

    public List<String> getFavoriteCDs() {
        return favoriteCDs;
    }

    public void setFavoriteCDs(List<String> favoriteCDs) {
        this.favoriteCDs = favoriteCDs;
    }
}
