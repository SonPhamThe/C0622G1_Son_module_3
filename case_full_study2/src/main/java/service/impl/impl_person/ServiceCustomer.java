package service.impl.impl_person;

import model.person.Customer;
import model.person.Employee;
import repository.IRepoCustomer;
import repository.impl.impl_person.RepoCustomer;
import service.IServiceCustomer;

import java.util.List;

public class ServiceCustomer implements IServiceCustomer {
    private static IRepoCustomer repoCustomer = new RepoCustomer();

    @Override
    public List<Customer> displayAll() {
        return repoCustomer.displayAll();
    }

    @Override
    public void add(Customer customer) {
        repoCustomer.add(customer);
    }

    @Override
    public boolean update(Customer customer) {
        return repoCustomer.update(customer);
    }

    @Override
    public boolean remove(int id) {
        return repoCustomer.remove(id);
    }

    @Override
    public Customer findCustomer(int id) {
        return repoCustomer.findCustomer(id);
    }
}
