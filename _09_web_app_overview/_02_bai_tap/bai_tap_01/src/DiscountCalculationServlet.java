import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountCalculationServlet", urlPatterns = "/calculate")
public class DiscountCalculationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        String description = request.getParameter("productDescription");

        double discountAmount = listPrice * discountPercent * 0.01;
        double finalPrice = listPrice - discountAmount;

        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("finalPrice", finalPrice);
        request.setAttribute("listPrice", listPrice);
        request.setAttribute("discountPercent", discountPercent);
        request.setAttribute("description", description);

        request.getRequestDispatcher("discount_display.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
