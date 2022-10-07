package controller.facility_servlet;

import model.facility.House;
import model.facility.Room;
import model.facility.Villa;
import service.IServiceHouse;
import service.impl.impl_facility.ServiceHouse;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HouseServlet", urlPatterns = "/houses")
public class HouseServlet extends HttpServlet {
    private IServiceHouse houseService = new ServiceHouse();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addHouse":
                addHouse(req, resp);
                break;
        }
    }

    private void addHouse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nameHouse = req.getParameter("name");
        double areaHouse = Double.parseDouble(req.getParameter("area"));
        double costHouse = Double.parseDouble(req.getParameter("cost"));
        int max_people_House = Integer.parseInt(req.getParameter("max_people"));
        String rent_type_House = req.getParameter("rent_type");
        /**
         * hỏi anh Quang
         */
        String standard_room_House = req.getParameter("standard_room");
        String description_other_convenience_House = req.getParameter("description_other_convenience");
        int number_of_floors_House = Integer.parseInt(req.getParameter("number_of_floors"));

        houseService.add(new House(nameHouse, areaHouse, costHouse, max_people_House, rent_type_House, standard_room_House, description_other_convenience_House, number_of_floors_House));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/house/add_house.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addHouse":
                showFormAdd(req, resp);
                break;
            case "editHouse":
                showFormEdit(req, resp);
                break;
            case "listHouse":
                listHouse(req, resp);
                break;
        }
    }

    private void listHouse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<House> listHouse = this.houseService.displayAll();
        req.setAttribute("listHouse", listHouse);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/house/list_house.jsp");
        dispatcher.forward(req, resp);
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/house/add_house.jsp");
        dispatcher.forward(req, resp);
    }
}
