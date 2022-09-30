package service;

import model.Customers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private static Map<Integer, Customers> customers;

    static {
        customers = new HashMap<>();
        customers.put(1, new Customers(1, "John", "john@codegym.vn", "Hanoi"));
        customers.put(2, new Customers(2, "Bill", "bill@codegym.vn", "Danang"));
        customers.put(3, new Customers(3, "Alex", "alex@codegym.vn", "Saigon"));
        customers.put(4, new Customers(4, "Adam", "adam@codegym.vn", "Beijin"));
        customers.put(5, new Customers(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customers.put(6, new Customers(6, "Rose", "rose@codegym.vn", "Newyork"));
    }

    @Override
    public List<Customers> findAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customers customer) {
        customers.put(customer.getId(), customer);
    }

    @Override
    public Customers findById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customers customer) {
        customers.put(id, customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
