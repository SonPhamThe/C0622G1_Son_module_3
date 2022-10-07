package repository;

import model.person.Employee;

import java.util.List;

public interface IRepoEmployee {
    List<Employee> displayAll();

    void add(Employee employee);

    boolean update(Employee employee);

    boolean remove(int id);

    Employee findEmployee(int id);

    List<Employee> findOptionEmployee();
}
