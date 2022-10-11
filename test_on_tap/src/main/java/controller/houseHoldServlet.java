package controller;

import model.houseHold;
import model.member;
import service.IServiceHouseHold;
import service.impl.houseHoldService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "houseHoldServlet", value = "/houses")
public class houseHoldServlet extends HttpServlet {
    private static final IServiceHouseHold houseHoldService = new houseHoldService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "editHouseHold":
                editEmployee(req, resp);
                break;
            case "searchHouseHold":
                searchHouseHold(req, resp);
                break;
            case "search":
                searchEmployee(req,resp);
                break;
        }
    }

    private void searchHouseHold(HttpServletRequest req, HttpServletResponse resp) {
//        List<houseHold> houseHolds = null;
//
//        String name = req.getParameter("name");
//        String startDate = req.getParameter("startDate");
//        String address = req.getParameter("address");
////        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
//        if (address.equals("")) {
//            houseHolds = houseHoldService.searchHouseHoldTwo(name,startDate);
//        } else {
//            customers = this.customerService.searchCustomer(name, customerTypeId);
//        }
//
//        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/house_hold/list.jsp");
//        req.setAttribute("houseHolds", houseHolds);
//        req.setAttribute("customerType", this.customerRepository.getCustomerType());
//        request.setAttribute("gender", this.customerRepository.getGender());
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException | IOException e) {
//            e.printStackTrace();
//        }

//        Map<Integer, String> positionMap = employeeService.selectAllPosition();
//        Map<Integer, String> educationDegreeMap = employeeService.selectAllEducationDegree();
//        Map<Integer, String> divisionMap = employeeService.selectAllDivision();

//        request.setAttribute("positionMap", positionMap);
//        request.setAttribute("educationDegreeMap", educationDegreeMap);
//        request.setAttribute("divisionMap", divisionMap);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "editHouseHold":
                showEdit(req, resp);
                break;
            case "page":
                movePage(req, resp);
                break;
            default:
                try {
                    listHouseHold(req, resp);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }
// cách của anh QUang tìm kiếm 3 trường
    private void searchEmployee(HttpServletRequest req, HttpServletResponse resp) {
        String tentIdSearch = (req.getParameter("searchName"));
        String tenantNameSearch = req.getParameter("searchDate");
        String phoneNumberSearch = req.getParameter("searchAddress");


        List<houseHold> foundHouseHold = houseHoldService.searchHouseHold(tentIdSearch,tenantNameSearch,phoneNumberSearch);
        req.setAttribute("listHouseHold", foundHouseHold);

        try {
            req.getRequestDispatcher("view/house_hold/list.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
//        String name = request.getParameter("searchName");
//        String email= request.getParameter("searchEmail");
//        String divisionType = request.getParameter("divisionType");
//        List<Employee> employeeList = iEmployeeService.searchEmployee(name,email,divisionType);
//        Map<Integer,String> mapDivision = iEmployeeService.findDivision();
//        request.setAttribute("employeeList",employeeList);
//        request.setAttribute("mapDivision",mapDivision);
//        try {
//            request.getRequestDispatcher("view/employee/list.jsp").forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        houseHold editHouseHold = houseHoldService.findHouseHold(id);
        try {
            req.setAttribute("editHouseHold", editHouseHold);
            req.getRequestDispatcher("/view/house_hold/edit.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void movePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/page_house.jsp");
        dispatcher.forward(req, resp);
    }

    private void listHouseHold(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        List<houseHold> listHouseHold = houseHoldService.displayAll();
        Map<Integer,List<member>> map = houseHoldService.getListHouseHold();
        req.setAttribute("listHouseHold", listHouseHold);
        req.setAttribute("map",map);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/house_hold/list.jsp");
        dispatcher.forward(req, resp);
    }


    private void editEmployee(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String startDate = req.getParameter("startDate");
        String address = req.getParameter("address");
        int so_luong_thanh_vien = Integer.parseInt(req.getParameter("so_luong_thanh_vien"));

        houseHold newHouseHold = new houseHold(id, name, startDate, address, so_luong_thanh_vien);

        Map<String, String> map = houseHoldService.updateHouseHold(newHouseHold);
        if (map.size() != 0) {
            req.setAttribute("mess", "Edit Failure");
            req.setAttribute("map", map);
            req.setAttribute("newHouseHold", newHouseHold);
        } else {
            req.setAttribute("mess", "Successfully Edit");
        }

        try {
            req.getRequestDispatcher("/view/house_hold/edit.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
