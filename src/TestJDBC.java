import java.sql.*;

public class TestJDBC {
    public static void main(String[] args) {
        final String DB_URL = "jdbc:mysql://mysql:3306/sklep";
        final String USER = "sprzedawca";
        final String PASS = "S1sqbIdPH2i*qX_]";

        String sql = "SELECT * FROM TOWARY";

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                System.out.print(rs.getInt("id_towaru") + " ");
                System.out.print(rs.getString("nazwa") + " ");
                System.out.print(rs.getString("opis") + " ");
                System.out.print(rs.getDouble("cena_jednostkowa") + " ");
                System.out.print(rs.getInt("ilosc_dostepna") + " ");
                System.out.println(rs.getDate("data_dodania"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
