import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CurrencyConverterServlet", urlPatterns="/converter")
public class CurrencyConverterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rate = Integer.parseInt(request.getParameter("rate"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        double result = rate * amount;

        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rate = Integer.parseInt(request.getParameter("rate"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        double result = rate * amount;

        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
