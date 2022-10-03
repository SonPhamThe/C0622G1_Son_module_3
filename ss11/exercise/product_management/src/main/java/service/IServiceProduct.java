package service;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IServiceProduct {
    List<Product> displayAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);

    List<Product> findByName(String name);

    List<Product> findByProducer(String producer);

    List<Product> findByPrice(double min, double max);
}
