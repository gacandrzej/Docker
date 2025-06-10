import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestJDBC {

    public List<String> getTowary() throws SQLException {
        final String DB_URL = "jdbc:mysql://localhost:3306/sklep";
        final String USER = "sprzedawca";
        final String PASS = "S1sqbIdPH2i*qX_]";

        String sql = "SELECT * FROM towary";

        List<String> result = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                String row = rs.getInt("id_towaru") + " "
                        + rs.getString("nazwa") + " "
                        + rs.getString("opis") + " "
                        + rs.getDouble("cena_jednostkowa") + " "
                        + rs.getInt("ilosc_dostepna") + " "
                        + rs.getDate("data_dodania");
                result.add(row);
            }
        }
        return result;
    }

    public static void main(String[] args) {

        TestJDBC test = new TestJDBC();

        try {
            List<String> towary = test.getTowary();
            towary.forEach(System.out::println);
        } catch (SQLException e) {
            e.getMessage();
        }
    }
}

