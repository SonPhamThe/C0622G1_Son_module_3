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
    private IServiceVilla villaService = new ServiceVilla();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addVilla":
                addVilla(req, resp);
                break;
            case "editVilla":
                editVilla(req,resp);
                break;
        }
    }
//    String name, double area, double cost, int max_people, String rent_type, String standard_room,
//    String description_other_convenience, double pool_area, int number_of_floors
    private void editVilla(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Double area = Double.valueOf(req.getParameter("area"));
        Double cost = Double.valueOf(req.getParameter("cost"));
        int max_people = Integer.parseInt(req.getParameter("max_people"));
        String rent_type = req.getParameter("rent_type");
        String standard_room = req.getParameter("standard_room");
        String description_other_convenience = req.getParameter("description_other_convenience");
        Double pool_area = Double.valueOf(req.getParameter("pool_area"));
        int number_of_floors = Integer.parseInt(req.getParameter("number_of_floors"));

//        List<Villa> villaFound = this.villaService.findByName(name);
//        RequestDispatcher dispatcher;
//        if (villaFound == null) {
//            dispatcher = req.getRequestDispatcher("error-404.jsp");
//        } else {
//            villaFound.set();
//            product.setPrice(price);
//            product.setDescription(description);
//            product.setProducer(producer);
//
//            this.productService.update(id, product);
//            request.setAttribute("product", product);
//            request.setAttribute("message", "Thông tin sản phẩm được cập nhật thành công!");
//            dispatcher = request.getRequestDispatcher("view/product/edit.jsp");
//        }
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
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
        req.setAttribute("message", "Add success");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "addVilla":
                showFormAdd(req, resp);
                break;
            case "editVilla":
                showFormEdit(req, resp);
                break;
            case "listVilla":
                listVilla(req, resp);
                break;
        }
    }


    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Villa> villas;
        String name = req.getParameter("name");
        villas = this.villaService.findByName(name);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/villa/edit_villa.jsp");
        req.setAttribute("villas", villas);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }



    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/villa/add_villa.jsp");
        dispatcher.forward(req, resp);
    }

    private void listVilla(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Villa> listVilla = this.villaService.displayAll();
        req.setAttribute("listVilla", listVilla);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/villa/list_villa.jsp");
        dispatcher.forward(req, resp);
    }

    private void findVilla(HttpServletRequest req, HttpServletResponse resp) {
        List<Villa> villas;
        String name = req.getParameter("name");
        villas = this.villaService.findByName(name);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/view/facility/villa/edit_villa.jsp");
        req.setAttribute("villas", villas);
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
