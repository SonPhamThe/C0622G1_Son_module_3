package controller.person_servlet;

import model.facility.Villa;
import model.person.Employee;
import service.IServiceEmployee;
import service.impl.impl_person.ServiceEmployee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employees")
public class EmployeeServlet extends HttpServlet {
    private static final IServiceEmployee employeeService = new ServiceEmployee();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addEmployee":
                addEmployee(req, resp);
                break;
            case "editEmployee":
                editEmployee(req, resp);
                break;
        }
    }

    private void editEmployee(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String date_of_birth = req.getParameter("date_of_birth");
        String id_card = req.getParameter("id_card");
        double salary = Double.parseDouble(req.getParameter("salary"));
        String phone_number = req.getParameter("phone_number");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        int education_degree_id = Integer.parseInt(req.getParameter("education_degree_id"));
        int position_id = Integer.parseInt(req.getParameter("position_id"));
        int division_id = Integer.parseInt(req.getParameter("division_id"));
        Employee newEmployee = new Employee(id, name, date_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id);
        employeeService.update(newEmployee);
        try {
            req.getRequestDispatcher("/view/employee/edit_employee.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void addEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
        String name = req.getParameter("name");
        String date_of_birth = req.getParameter("date_of_birth");
        String id_card = req.getParameter("id_card");
        double salary = Double.parseDouble(req.getParameter("salary"));
        String phone_number = req.getParameter("phone_number");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        int education_degree_id = Integer.parseInt(req.getParameter("education_degree_id"));
        int position_id = Integer.parseInt(req.getParameter("position_id"));
        int division_id = Integer.parseInt(req.getParameter("division_id"));
        String username = req.getParameter("username");

        employeeService.add(new Employee(name, date_of_birth, id_card, salary, phone_number, email, address, education_degree_id, position_id, division_id, username));
        req.setAttribute("mess", "ADD SUCCESS");
        try {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/employee/add_employee.jsp");
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
            case "addEmployee":
                showAddEmployee(req, resp);
                break;
            case "page":
                movePageEmployee(req, resp);
                break;
            case "listEmployee":
                listEmployee(req, resp);
                break;
            case "editEmployee":
                showEditEmployee(req, resp);
                break;
            case "deleteEmployee":
                deleteEmployee(req, resp);
                break;
        }
    }

    private void deleteEmployee(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        employeeService.remove(id);
        List<Employee> listEmployee = employeeService.displayAll();
        req.setAttribute("listEmployee", listEmployee);
        try {
            req.getRequestDispatcher("/view/employee/list_employee.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditEmployee(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Employee editEmployee = employeeService.findEmployee(id);
        try {
            req.setAttribute("editEmployee", editEmployee);
            req.getRequestDispatcher("/view/employee/edit_employee.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/employee/add_employee.jsp");
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listEmployee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Employee> listEmployee = employeeService.displayAll();
        req.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/employee/list_employee.jsp");
        dispatcher.forward(req, resp);
    }

    private void movePageEmployee(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("view/page_employee.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
