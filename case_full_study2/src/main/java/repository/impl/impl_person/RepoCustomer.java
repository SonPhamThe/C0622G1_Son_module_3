package repository.impl.impl_person;

import model.person.Customer;
import model.person.Employee;
import repository.DataBaseRepository;
import repository.IRepoCustomer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RepoCustomer implements IRepoCustomer {
    private static final String DISPLAY_ALL_CUSTOMER = "SELECT * FROM customer";

    private static final String ADD_CUSTOMER = "INSERT INTO customer(`customer_type_id`,`name`,`date_of_birth`,`gender`,`id_card`,`phone_number`, `email`, `address`) VALUES(?,?,?,?,?,?,?,?)";

    private static final String SELECT_CUSTOMERS_BY_ID = "select * from customer where id =?";

    private static final String UPDATE_CUSTOMER = "update customer set name = ?,customer_type_id = ?,date_of_birth=?,gender = ?,id_card =?,phone_number=?, email= ?, address =? where id = ?;";

    private static final String DELETE_CUSTOMER_SQL = "delete from customer where id = ?;";

    @Override
    public List<Customer> displayAll() {
        List<Customer> customers = new ArrayList<>();

        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement prepared = connection.prepareStatement(DISPLAY_ALL_CUSTOMER)) {
            ResultSet result = prepared.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                int customer_type_id = result.getInt("customer_type_id");
                String name = result.getString("name");
                String date_of_birth = result.getString("date_of_birth");
                String gender = result.getString("gender");
                String id_card = result.getString("id_card");
                String phone_number = result.getString("phone_number");
                String email = result.getString("email");
                String address = result.getString("address");

                customers.add(new Customer(id, customer_type_id, name, date_of_birth, gender, id_card, phone_number, email, address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customers;
    }

    @Override
    public void add(Customer customer) {
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, String.valueOf(customer.getCustomer_type_id()));
            preparedStatement.setString(3, customer.getDate_of_birth());
            preparedStatement.setString(4, customer.getId_card());
            preparedStatement.setString(5, customer.getGender());
            preparedStatement.setString(6, customer.getPhone_number());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean update(Customer customer) {
        boolean rowUpdate = false;

        try (Connection connection = DataBaseRepository.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER)) {
            preparedStatement.setString(1, String.valueOf(customer.getCustomer_type_id()));
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDate_of_birth());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setString(5, customer.getId_card());
            preparedStatement.setString(6, customer.getPhone_number());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getId());

            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdate;
    }

    @Override
    public boolean remove(int id) {
        boolean rowDelete = false;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL);
            preparedStatement.setInt(1, id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public Customer findCustomer(int id) {
        Customer customer = null;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMERS_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int customer_type_id = rs.getInt("customer_type_id");
                String name = rs.getString("name");
                String date_of_birth = rs.getString("date_of_birth");
                String gender = rs.getString("gender");
                String id_card = rs.getString("id_card");
                String phone_number = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");

                customer = new Customer(id, customer_type_id, name, date_of_birth, gender, id_card, phone_number, email, address);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }
}
