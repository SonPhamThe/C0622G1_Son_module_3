import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "Calculator", urlPatterns = "/cal")
public class Calculator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        double firstOperand = Double.parseDouble(request.getParameter("first__operand"));

        double secondOperand = Double.parseDouble(request.getParameter("second__operand"));

        String operator = request.getParameter("operator");

        double result = 0;

        if (operator.equals("add")) {
            result = firstOperand * secondOperand;
        } else if (operator.equals("div")) {
            result = firstOperand / secondOperand;
        } else if (operator.equals("sum")) {
            result = firstOperand + secondOperand;
        } else if (operator.equals("sub")) {
            result = firstOperand - secondOperand;
        }
        request.setAttribute("result",result);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
