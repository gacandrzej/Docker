import org.junit.Test;
import java.sql.SQLException;
import java.util.List;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class TestMyApp {

    @Test
    public void testGetTowary() throws SQLException {
        TestJDBC test = new TestJDBC();
        List<String> towary = test.getTowary();

        assertNotNull("Lista nie powinna być null", towary);
        assertTrue("Lista nie powinna być pusta", towary.size() > 0);

        // Dodatkowo możesz sprawdzić format pojedynczego elementu
        String pierwszy = towary.get(0);
        assertTrue("Wiersz powinien zawierać id_towaru", pierwszy.matches("^\\d+ .*"));

    }

}
