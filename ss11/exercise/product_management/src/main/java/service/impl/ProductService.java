package service.impl;

import model.Product;
import repository.IRepoProduct;
import repository.impl.ProductRepo;
import service.IServiceProduct;

import java.util.*;

public class ProductService implements IServiceProduct {
    private static IRepoProduct productRepo = new ProductRepo();

    @Override
    public List<Product> displayAll() {
        return productRepo.displayAll();
    }

    @Override
    public void save(Product product) {
        productRepo.add(product);
    }

    @Override
    public Product findById(int id) {
        return productRepo.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        productRepo.update(id,product);
    }

    @Override
    public void remove(int id) {
        productRepo.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productsFound = new ArrayList<>();

        for (Product product : productRepo.displayAll()) {
            if (product.getName().contains(name)) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }

    @Override
    public List<Product> findByProducer(String producer) {
        List<Product> productsFound = new ArrayList<>();

        for (Product product : productRepo.displayAll()) {
            if (product.getProducer().contains(producer)) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }

    @Override
    public List<Product> findByPrice(double min, double max) {
        List<Product> productsFound = new ArrayList<>();

        for (Product product : productRepo.displayAll()) {
            if (product.getPrice() > min && product.getPrice() < max) {
                productsFound.add(product);
            }
        }
        return productsFound;
    }
}
