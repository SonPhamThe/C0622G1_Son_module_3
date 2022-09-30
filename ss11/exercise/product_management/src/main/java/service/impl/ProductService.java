package service.impl;

import model.Product;
import reponsitory.IProducRepo;
import reponsitory.impl.ProductRepoService;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProducRepo productRepo = new ProductRepoService();

    @Override
    public List<Product> getAll() {
        return productRepo.getAll();
    }

    @Override
    public void add(Product product) {
        productRepo.add(product);
    }

    @Override
    public Product findById(int id) {
        return productRepo.findById(id);
    }

    @Override
    public void edit(Product product) {
        productRepo.edit(product);
    }

    @Override
    public void delete(int id) {
        productRepo.delete(id);
    }

    @Override
    public List<Product> search(String name) {
        return productRepo.search(name);
    }
}
