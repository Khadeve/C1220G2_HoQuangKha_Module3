package servlet;

import java_bean.Calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "servlet.SimpleCalculatorServlet", urlPatterns = {"", "/calculate"})
public class SimpleCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
        double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));
        String operator = request.getParameter("operator");

        /*request.setAttribute("firstOperandServlet", firstOperand);
        request.setAttribute("secondOperandServlet", secondOperand);
        request.setAttribute("operatorServlet", operator);*/

        try {
            double result = Calculator.calculate(firstOperand, secondOperand, operator);
            request.setAttribute("calculatorResult", result);
            RequestDispatcher view = request.getRequestDispatcher("result.jsp");
            view.forward(request, response);
        } catch(ArithmeticException e) {
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         response.sendRedirect("index.jsp");
    }
}
