package controller.facility_servlet;

import model.facility.Facility;
import service.IServiceFacility;
import service.impl.impl_facility.ServiceFacility;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facilities")
public class FacilityServlet extends HttpServlet {
    private static IServiceFacility facilityService = new ServiceFacility();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "add":
                break;
            default:
                pageHome(req, resp);
                break;
        }
    }

    private void pageHome(HttpServletRequest req, HttpServletResponse resp) {
        List<Facility> facilities = this.facilityService.displayAll();
        req.setAttribute("facilities", facilities);

        RequestDispatcher dispatcher = req.getRequestDispatcher("view/facility/page.jsp");
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
