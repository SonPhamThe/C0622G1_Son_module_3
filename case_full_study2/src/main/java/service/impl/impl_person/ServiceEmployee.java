package service.impl.impl_person;

import model.person.Employee;
import repository.IRepoEmployee;
import repository.impl.impl_person.RepoEmployee;
import service.IServiceEmployee;

import javax.servlet.RequestDispatcher;
import java.util.List;

public class ServiceEmployee implements IServiceEmployee {
    private static IRepoEmployee employeeRepo = new RepoEmployee();

    @Override
    public List<Employee> displayAll() {
        return employeeRepo.displayAll();
    }

    @Override
    public void add(Employee employee) {
        employeeRepo.add(employee);
    }

    @Override
    public boolean update(Employee employee) {
        return employeeRepo.update(employee);
    }

    @Override
    public boolean remove(int id) {
        return employeeRepo.remove(id);
    }

    @Override
    public Employee findEmployee(int id) {
        return employeeRepo.findEmployee(id);
    }

    @Override
    public List<Employee> findOneOptionEmployee(String searchName) {
        return employeeRepo.findOneOptionEmployee(searchName);
    }

    @Override
    public List<Employee> findTwoOptionEmployee(String searchName, int divisionId) {
        return employeeRepo.findTwoOptionEmployee(searchName, divisionId);
    }
}
