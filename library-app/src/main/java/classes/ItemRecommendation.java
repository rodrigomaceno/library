package classes;

import java.util.List;

public class ItemRecommendation {
    private Integer id;
    private List<String> recommendedBooks;
    private List<String> recommendedCDs;
    private List<String> recommendedDVDs;
    private Account acc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<String> getRecommendedBooks() {
        return recommendedBooks;
    }

    public void setRecommendedBooks(List<String> recommendedBooks) {
        this.recommendedBooks = recommendedBooks;
    }

    public List<String> getRecommendedCDs() {
        return recommendedCDs;
    }

    public void setRecommendedCDs(List<String> recommendedCDs) {
        this.recommendedCDs = recommendedCDs;
    }

    public List<String> getRecommendedDVDs() {
        return recommendedDVDs;
    }

    public void setRecommendedDVDs(List<String> recommendedDVDs) {
        this.recommendedDVDs = recommendedDVDs;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }
}
