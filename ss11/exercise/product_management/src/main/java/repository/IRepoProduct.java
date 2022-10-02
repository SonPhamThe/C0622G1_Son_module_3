package repository;

import model.Product;

import java.util.List;

public interface IRepoProduct {
    List<Product> displayAll();

    void add(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);

    List<Product> findByName(String name);

    List<Product> findByProducer(String producer);

    List<Product> findByPrice(double min, double max);
}
