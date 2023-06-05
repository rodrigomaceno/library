package classes;

public class Account {
    private Integer id;
    private String dateCreated;

    private String userName;

    private String userPhoneNum;
    private String email;
    private PreferencesRecord pref;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
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

    public PreferencesRecord getPref() {
        return pref;
    }

    public void setPref(PreferencesRecord pref) {
        this.pref = pref;
    }
}
