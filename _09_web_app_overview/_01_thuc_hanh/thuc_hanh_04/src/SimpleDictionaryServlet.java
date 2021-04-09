import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SimpleDictionaryServlet", urlPatterns = "/dictionary")
public class SimpleDictionaryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("World", "Thế giới");
        dictionary.put("Concurrency", "Sự đồng bộ");
        dictionary.put("Conflict", "Va chạm");
        dictionary.put("rapid", "Nhanh chóng");

        String englishWord = request.getParameter("englishWord");
        String result = "not found";

        for(Map.Entry<String, String> word : dictionary.entrySet()) {
            if (word.getKey().equals(englishWord)) {
                result = word.getValue();
            }
        }

        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
