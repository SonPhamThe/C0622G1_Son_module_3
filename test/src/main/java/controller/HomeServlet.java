package controller;

import model.Home;
import model.Person;
import service.IServiceHome;
import service.impl.ServiceHome;

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

@WebServlet(name = "HomeServlet", urlPatterns = "/homes")
public class HomeServlet extends HttpServlet {
    private static final IServiceHome homeService = new ServiceHome();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case " addHome":
                addHome(req, resp);
                break;
        }
    }

    private void addHome(HttpServletRequest req, HttpServletResponse resp) {
        String namePerson = req.getParameter("namePerson");
        String phoneNumber = req.getParameter("numberPhone");
        String startDate = req.getParameter("startDate");
        String namePaypal = req.getParameter("namePaypal");
        String note = req.getParameter("note");
//        int id, String numberPhone, String startDate, String namePaypal, String namePerson, String note
        homeService.add(new Home (namePerson, phoneNumber, startDate, namePaypal, note));
        req.setAttribute("mess", "ADD SUCCESS");
        try {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/home_lol/add.jsp");
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
                movePage(req, resp);
                break;
            case "addHome":
                showAddHome(req, resp);
                break;
            default:
                listHome(req, resp);
                break;
        }

    }

    private void showAddHome(HttpServletRequest req, HttpServletResponse resp) {
        try {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/view/home_lol/add.jsp");
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Home> listHome = homeService.displayAll();
        req.setAttribute("listHome", listHome);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/home_lol/list.jsp");
        dispatcher.forward(req, resp);
    }

    private void movePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/page_home.jsp");
        dispatcher.forward(req, resp);
    }


}


