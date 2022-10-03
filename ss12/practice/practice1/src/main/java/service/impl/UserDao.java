package service.impl;

import model.User;
import service.BaseRepository;
import service.IUserDao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements IUserDao {
    private static final String INSERT_USER_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SEARCH_USERS_SQL = "SELECT * FROM users WHERE country LIKE ?";
    private static final String SELECT_USERS_SQL_ORDER_BY = "SELECT * FROM users ORDER BY name";

    public UserDao() {
    }

    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USER_SQL);
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_SQL_ORDER_BY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            System.out.println(prepareStatement);
            result(users, prepareStatement);
        }
        return users;
    }

    private List<User> result(List<User> users, PreparedStatement prepareStatement) throws SQLException {
        ResultSet rs = prepareStatement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String country = rs.getString("country");
            users.add(new User(id, name, email, country));
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDelete;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement(DELETE_USERS_SQL);) {
            prepareStatement.setInt(1, id);
            rowDelete = prepareStatement.executeUpdate() > 0;
        }
        return rowDelete;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = BaseRepository.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public List<User> searchByName(String country) throws SQLException {
        List<User> users = new ArrayList<>();

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement prepareStatement = connection.prepareStatement(SEARCH_USERS_SQL)) {
            prepareStatement.setString(1, country);
            ResultSet rs = prepareStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        }
        return users;
    }
}
