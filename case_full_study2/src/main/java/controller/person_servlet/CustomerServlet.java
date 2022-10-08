package controller.person_servlet;

import model.person.Customer;
import model.person.Employee;
import service.IServiceCustomer;
import service.impl.impl_person.ServiceCustomer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    private static final IServiceCustomer customerService = new ServiceCustomer();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addCustomer":
                addCustomer(req, resp);
                break;
            case "editCustomer":
                editCustomer(req, resp);
                break;
        }
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        int customerTypeId = Integer.parseInt(req.getParameter("customerTypeId"));
        String name = req.getParameter("name");
        String dateOfBirth = req.getParameter("dateOfBirth");
        String gender = req.getParameter("gender");
        String idCard = req.getParameter("idCard");
        String phoneNumber = req.getParameter("phoneNumber");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        Customer newCustomer = new Customer(id, customerTypeId, name, dateOfBirth, gender, idCard, phoneNumber, email, address);
        customerService.update(newCustomer);
        try {
            req.getRequestDispatcher("/view/customer/edit_customer.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void addCustomer(HttpServletRequest req, HttpServletResponse resp) {
        int customerTypeId = Integer.parseInt(req.getParameter("customerTypeId"));
        String name = req.getParameter("name");
        String dateOfBirth = req.getParameter("dateOfBirth");
        String gender = req.getParameter("gender");
        String idCard = req.getParameter("idCard");
        String phoneNumber = req.getParameter("phoneNumber");
        String email = req.getParameter("email");
        String address = req.getParameter("address");

        customerService.add(new Customer(customerTypeId, name, dateOfBirth, gender, idCard, phoneNumber, email, address));

        try {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/customer/add_customer.jsp");
            req.setAttribute("message", "Add success");
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "page":
                movePageCustomer(req, resp);
                break;
            case "listCustomer":
                listCustomer(req, resp);
                break;
            case "addCustomer":
                showAddCustomer(req, resp);
                break;
            case "editCustomer":
                showEditCustomer(req, resp);
                break;
            case "deleteCustomer":
                deleteCustomer(req,resp);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        customerService.remove(id);
        List<Customer> listCustomer = customerService.displayAll();
        req.setAttribute("listCustomer",listCustomer);
        try {
            req.getRequestDispatcher("/view/customer/list_customer.jsp").forward(req,resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCustomer(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer editCustomer = customerService.findCustomer(id);
        try {
            req.setAttribute("editCustomer", editCustomer);
            req.getRequestDispatcher("/view/customer/edit_customer.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddCustomer(HttpServletRequest req, HttpServletResponse resp) {
        try {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/customer/add_customer.jsp");
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private static void listCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> listCustomer = customerService.displayAll();
        req.setAttribute("listCustomer", listCustomer);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/customer/list_customer.jsp");
        dispatcher.forward(req, resp);
    }

    private void movePageCustomer(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/page_customer.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
