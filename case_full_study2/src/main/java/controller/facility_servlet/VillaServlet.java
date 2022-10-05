package controller.facility_servlet;

import model.facility.Villa;
import service.IServiceVilla;
import service.impl.impl_facility.ServiceVilla;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "VillaServlet", urlPatterns = "/villas")
public class VillaServlet extends HttpServlet {
    private static final IServiceVilla villaService = new ServiceVilla();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addVilla":
                addVilla(req, resp);
                break;
        }
    }

    private void addVilla(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        double area = Double.parseDouble(req.getParameter("area"));
        double cost = Double.parseDouble(req.getParameter("cost"));
        int max_people = Integer.parseInt(req.getParameter("max_people"));
        String rent_type = req.getParameter("rent_type");
        /**
         * hỏi anh Quang
         */
        String standard_room = req.getParameter("standard_room");
        String description_other_convenience = req.getParameter("description_other_convenience");
        double pool_area = Double.parseDouble(req.getParameter("pool_area"));
        int number_of_floors = Integer.parseInt(req.getParameter("number_of_floors"));

        villaService.add(new Villa(name, area, cost, max_people, rent_type, standard_room, description_other_convenience, pool_area, number_of_floors));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/villa/add_villa.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "listVilla":
                listVilla(req, resp);
                break;
            case "addVilla":
                showFormAdd(req, resp);
                break;
            case "editVilla":
                showFormEdit(req,resp);
                break;
        }
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/villa/add_villa.jsp");
        dispatcher.forward(req, resp);
    }

    private void listVilla(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Villa> listVilla = new ArrayList<>();
        req.setAttribute("listVilla", listVilla);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/villa/list_villa.jsp");
        dispatcher.forward(req, resp);
    }
}
