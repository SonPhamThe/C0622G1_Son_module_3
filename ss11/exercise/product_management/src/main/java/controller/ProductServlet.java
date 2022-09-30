package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddForm(req, resp);
                break;
            case "delete":
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            default:
                showListStudent(req, resp);
        }
        req.setAttribute("actionProduct", productService.getAll());
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            req.setAttribute("product", product);
            dispatcher = req.getRequestDispatcher("view/product/view.jsp");
        }
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListStudent(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.setAttribute("productService", productService.getAll());
            req.getRequestDispatcher("view/product/list.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("view/product/add.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(req, resp);
                break;
            case "edit":
                editProduct(req, resp);
                break;
        }
    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("nameProduct");
        double price = Double.parseDouble(req.getParameter("price"));
        String descriptionProduct = req.getParameter("descriptionProduct");
        String producer = req.getParameter("producer");
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        } else {
            product.setNameProduct(name);
            product.setPrice(price);
            product.setDescriptionProduct(descriptionProduct);
            product.setProducer(producer);
            this.productService.edit(product);
            req.setAttribute("product", product);
            req.setAttribute("message", "Product information was updated");
            dispatcher = req.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String nameProduct = req.getParameter("nameProduct");
        double price = Double.parseDouble(req.getParameter("price"));
        String descriptionProduct = req.getParameter("descriptionProduct");
        String producer = req.getParameter("producer");
        Product product = new Product(id, nameProduct, price, descriptionProduct, producer);
        productService.add(product);
        req.setAttribute("mess", "Success add");
        showAddForm(req, resp);
    }
}
