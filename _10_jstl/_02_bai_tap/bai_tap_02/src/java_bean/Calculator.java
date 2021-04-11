package java_bean;

public class Calculator {
    public static double calculate(double firstOperand, double secondOperand, String operator)
            throws ArithmeticException
    {
        if (operator.equals("plus")) {
            return (firstOperand + secondOperand);
        }
        if (operator.equals("subtract")) {
            return (firstOperand - secondOperand);
        }
        if (operator.equals("divide")) {
            if (secondOperand == 0) {
                throw new ArithmeticException("Divide by zero");
            }
            return (firstOperand / secondOperand);
        }
        return (firstOperand * secondOperand);
    }
}
