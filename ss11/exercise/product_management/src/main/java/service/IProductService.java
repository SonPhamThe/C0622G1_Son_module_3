package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();
    void add(Product product);
    Product findById(int id);
    void edit(Product product);
    void delete(int id);
    List<Product> search(String name);
}
