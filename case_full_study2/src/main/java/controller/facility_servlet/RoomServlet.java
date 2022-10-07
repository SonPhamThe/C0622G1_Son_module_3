package controller.facility_servlet;

import model.facility.Room;
import model.facility.Villa;
import service.IServiceRoom;
import service.impl.impl_facility.ServiceRoom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RoomServlet", urlPatterns = "/rooms")
public class RoomServlet extends HttpServlet {
    private IServiceRoom roomService = new ServiceRoom();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addRoom":
                addRoom(req, resp);
                break;
        }
    }

    private void addRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        double area = Double.parseDouble(req.getParameter("area"));
        double cost = Double.parseDouble(req.getParameter("cost"));
        int maxPeople = Integer.parseInt(req.getParameter("max_people"));
        String rentType = req.getParameter("rent_type");
        /**
         * hỏi anh Quang
         */
        String facilityFree = req.getParameter("facility_free;");

        roomService.add(new Room(name, area, cost, maxPeople, rentType, facilityFree));

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/room/add_room.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addRoom":
                showFormAdd(req, resp);
                break;
            case "editRoom":
                showFormEdit(req, resp);
                break;
            case "listRoom":
                listRoom(req, resp);
                break;
        }
    }

    private void listRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Room> listRoom = this.roomService.displayAll();
        req.setAttribute("listRoom", listRoom);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/room/list_room.jsp");
        dispatcher.forward(req, resp);
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/room/add_room.jsp");
        dispatcher.forward(req, resp);
    }
}
