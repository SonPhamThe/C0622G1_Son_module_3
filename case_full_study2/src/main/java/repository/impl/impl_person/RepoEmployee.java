package repository.impl.impl_person;

import model.person.Employee;
import repository.DataBaseRepository;
import repository.IRepoEmployee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RepoEmployee implements IRepoEmployee {
    private static final String DISPLAY_ALL_EMPLOYEE = "SELECT * FROM employee where is_delete=0";

    private static final String ADD_EMPLOYEE = "INSERT INTO employee( `name`, `date_of_birth`, `id_card`, `salary`, `phone_number`, `email`, `address`, `position_id`, `education_degree_id`, `division_id`,`username`) VALUES(?,?,?,?,?,?,?,?,?,?,?);";

    private static final String UPDATE_EMPLOYEE = "update employee set name = ?,date_of_birth=?,id_card =?,salary=?,phone_number=?, email= ?, address =?,education_degree_id=?,position_id=?,division_id =? where id = ?;";

    private static final String SELECT_EMPLOYEES_BY_ID = "select * from employee where id =?";

    private static final String DELETE_EMPLOYEES_SQL = "update employee set is_delete=1 where id = ?;";

    @Override
    public List<Employee> displayAll() {
        List<Employee> employees = new ArrayList<>();

        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement prepared = connection.prepareStatement(DISPLAY_ALL_EMPLOYEE)) {
            ResultSet result = prepared.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                String name = result.getString("name");
                String date_of_birth = result.getString("date_of_birth");
                String id_card = result.getString("id_card");
                Double salary = Double.valueOf(result.getString("salary"));
                String phone_number = result.getString("phone_number");
                String email = result.getString("email");
                String address = result.getString("address");
                int education_degree_id = Integer.parseInt(result.getString("education_degree_id"));
                int position_id = Integer.parseInt(result.getString("position_id"));
                int division_id = Integer.parseInt(result.getString("division_id"));
                String username = result.getString("username");

                employees.add(new Employee(id, name, date_of_birth, id_card, salary, phone_number, email, address, education_degree_id, position_id, division_id, username));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employees;
    }

    @Override
    public void add(Employee employee) {
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDate_of_birth());
            preparedStatement.setString(3, employee.getId_card());
            preparedStatement.setString(4, String.valueOf(employee.getSalary()));
            preparedStatement.setString(5, employee.getPhone_number());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setString(8, String.valueOf(employee.getEducation_degree_id()));
            preparedStatement.setString(9, String.valueOf(employee.getPosition_id()));
            preparedStatement.setString(10, String.valueOf(employee.getDivision_id()));
            preparedStatement.setString(11, employee.getUsername());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean update(Employee employee) {
        boolean rowUpdated = false;

        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE)) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDate_of_birth());
            preparedStatement.setString(3, employee.getId_card());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone_number());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPosition_id());
            preparedStatement.setInt(9, employee.getEducation_degree_id());
            preparedStatement.setInt(10, employee.getDivision_id());
            preparedStatement.setInt(12, employee.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public boolean remove(int id) {
        boolean rowDelete = false;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEES_SQL);
            preparedStatement.setInt(1,id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public Employee findEmployee(int id) {
        Employee employee = null;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEES_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String date_of_birth = rs.getString("date_of_birth");
                String id_card = rs.getString("id_card");
                double salary = rs.getDouble("salary");
                String phone_number = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int position_id = rs.getInt("position_id");
                int education_degree_id = rs.getInt("education_degree_id");
                int division_id = rs.getInt("division_id");
                String username = rs.getString("username");
                employee = new Employee(id, name, date_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id, username);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> findOptionEmployee() {
        return null;
    }
}
