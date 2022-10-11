package repository.impl.impl_person;

import model.person.Employee;
import repository.DataBaseRepository;
import repository.IRepoEmployee;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RepoEmployee implements IRepoEmployee {
    private static final String DISPLAY_ALL_EMPLOYEE = "SELECT * FROM employee where is_delete=0";

    private static final String ADD_EMPLOYEE = "INSERT INTO employee( `name`, `date_of_birth`, `id_card`, `salary`, `phone_number`, `email`, `address`, `position_id`, `education_degree_id`, `division_id`,`username`) VALUES(?,?,?,?,?,?,?,?,?,?,?);";

    private static final String UPDATE_EMPLOYEE = "update employee set name = ?,date_of_birth=?,id_card =?,salary=?,phone_number=?, email= ?, address =?,education_degree_id=?,position_id=?,division_id =? where id = ?;";

    private static final String SELECT_EMPLOYEES_BY_ID = "select * from employee where id =?";

    private static final String DELETE_EMPLOYEES_SQL = "update employee set is_delete=1 where id = ?;";

    private static final String SEARCH_NAME = "SELECT * FROM employee where is_delete = 0 and name like ?;";

    private static final String SEARCH_NAME_DIVISION = "SELECT * FROM employee where is_delete=0 and name like ? and division_id = ?; ";

    private static final String SELECT_POSITION = "SELECT * FROM position where is_delete = 0;";

    private static final String SELECT_EDUCATION = "SELECT * FROM education_degree where is_delete=0;";

    private static final String SELECT_DIVISION = "SELECT * FROM division where is_delete=0;";

    @Override
    public List<Employee> displayAll() {
        List<Employee> employees = new ArrayList<>();

        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement prepared = connection.prepareStatement(DISPLAY_ALL_EMPLOYEE)) {
            ResultSet result = prepared.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                String name = result.getString("name");
                String dateOfBirth = result.getString("date_of_birth");
                String idCard = result.getString("id_card");
                double salary = Double.parseDouble(result.getString("salary"));
                String phoneNumber = result.getString("phone_number");
                String email = result.getString("email");
                String address = result.getString("address");
                int educationDegreeId = Integer.parseInt(result.getString("education_degree_id"));
                int positionId = Integer.parseInt(result.getString("position_id"));
                int divisionId = Integer.parseInt(result.getString("division_id"));
                String username = result.getString("username");

                employees.add(new Employee(id,name,dateOfBirth,idCard,salary,phoneNumber,email,address,educationDegreeId,positionId,divisionId,username));
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
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setString(4, String.valueOf(employee.getSalary()));
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setString(8, String.valueOf(employee.getEducationDegreeId()));
            preparedStatement.setString(9, String.valueOf(employee.getPositionId()));
            preparedStatement.setString(10, String.valueOf(employee.getDivisionId()));
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
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11, employee.getId());

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
            preparedStatement.setInt(1, id);
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
                String dateOfBirth = rs.getString("dateOfBirth");
                String idCard = rs.getString("idCard");
                double salary = rs.getDouble("salary");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("positionId");
                int educationDegreeId = rs.getInt("educationDegreeId");
                int divisionId   = rs.getInt("divisionId");
                String username = rs.getString("username");
                employee = new Employee(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, username);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> findOneOptionEmployee(String searchName) {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_NAME);) {
            preparedStatement.setString(1, searchName);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Employee employee = getEmployee(rs);
                employees.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employees;
    }

    @Override
    public List<Employee> findTwoOptionEmployee(String searchName, int divisionId) {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_NAME_DIVISION);) {
            preparedStatement.setString(1, searchName);
            preparedStatement.setInt(2, divisionId);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Employee employee = getEmployee(rs);
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    private Employee getEmployee(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String birthday = rs.getString("date_of_birth");
        String idCard = rs.getString("id_card");
        double salary = rs.getDouble("salary");
        String phoneNumber = rs.getString("phone_number");
        String email = rs.getString("email");
        String address = rs.getString("address");
        int educationDegreeId = rs.getInt("education_degree_id");
        int positionId = rs.getInt("position_id");
        int divisionId = rs.getInt("division_id");

        return new Employee(id,name,birthday,idCard,salary,phoneNumber,email,address,educationDegreeId,positionId,divisionId);
    }

    public static Map<Integer, String> findPosition() {
        Map<Integer, String> rentType = new HashMap<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSITION);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                rentType.put(id, name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentType;
    }

    public static Map<Integer, String> findEducation() {
        Map<Integer, String> rentType = new HashMap<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EDUCATION);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                rentType.put(id, name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentType;
    }

    public static Map<Integer, String> findDivision() {
        Map<Integer, String> rentType = new HashMap<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DIVISION);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                rentType.put(id, name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentType;
    }

}
