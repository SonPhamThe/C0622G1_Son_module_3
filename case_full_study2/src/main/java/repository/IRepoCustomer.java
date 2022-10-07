package repository;

import model.person.Customer;
import model.person.Employee;

import java.util.List;

public interface IRepoCustomer {
    List<Customer> displayAll();

    void add(Customer customer);

    boolean update(Customer customer);

    boolean remove(int id);

    Customer findCustomer(int id);
}
