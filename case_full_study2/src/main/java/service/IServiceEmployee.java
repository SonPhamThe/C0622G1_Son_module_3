package service;

import model.person.Employee;

import java.util.List;

public interface IServiceEmployee {
    List<Employee> displayAll();

    void add(Employee employee);

    boolean update(Employee employee);

    boolean remove(int id);

    Employee findEmployee(int id);

    List<Employee> findOneOptionEmployee(String searchName);

    List<Employee> findTwoOptionEmployee(String searchName, int divisionId);
}
