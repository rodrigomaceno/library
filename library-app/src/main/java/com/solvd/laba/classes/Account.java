package com.solvd.laba.classes;

import java.util.Date;
import java.util.List;

public class Account {
    private int id;
    private Date dateCreated;
    private String userName;
    private String userPhoneNum;
    private String email;
    private PreferencesRecord preferences;
    private History history;
    private List<Loan> loans;
    private List<Reservation> reservations;
    private List<ItemRecommendation> recommendations;

    public Account() {}

    public Account(String userName, String userPhoneNum) {
        this.userName = userName;
        this.userPhoneNum = userPhoneNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhoneNum() {
        return userPhoneNum;
    }

    public void setUserPhoneNum(String userPhoneNum) {
        this.userPhoneNum = userPhoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public PreferencesRecord getPreferences() {
        return preferences;
    }

    public void setPreferences(PreferencesRecord preferences) {
        this.preferences = preferences;
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }

    public List<Loan> getLoans() {
        return loans;
    }

    public void setLoans(List<Loan> loans) {
        this.loans = loans;
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }

    public List<ItemRecommendation> getRecommendations() {
        return recommendations;
    }

    public void setRecommendations(List<ItemRecommendation> recommendations) {
        this.recommendations = recommendations;
    }
}
