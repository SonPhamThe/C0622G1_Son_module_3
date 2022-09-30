package reponsitory.impl;

import model.Product;
import reponsitory.IProducRepo;

import java.util.ArrayList;
import java.util.List;

public class ProductRepoService implements IProducRepo {
    private static final List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "ma túy", 1000, "phê", "CodeGym"));
        products.add(new Product(2, "kẹo", 2000, "phê", "CodeGym"));
        products.add(new Product(3, "đá", 3000, "phê", "CodeGym"));
        products.add(new Product(4, "cần sa", 4000, "phê", "CodeGym"));
        products.add(new Product(5, "smile", 5000, "phê", "CodeGym"));
    }

    @Override
    public List<Product> getAll() {
        return products;
    }

    @Override
    public void add(Product product) {
        products.add(product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void edit(Product product) {
        int index = products.indexOf(product);
        products.set(index, product);
    }

    @Override
    public void delete(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                products.remove(product);
                break;
            }
        }
    }

    @Override
    public List<Product> search(String name) {
        List<Product> productSearch = new ArrayList<>();
        for (Product product : products) {
            if (product.getNameProduct().contains(name)) {
                productSearch.add(product);
            }
        }
        return productSearch;
    }
}
