package repository.impl;

import model.Home;
import org.omg.CORBA.PRIVATE_MEMBER;
import repository.DataBaseRepository;
import repository.IRepoHome;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RepoHome implements IRepoHome {
    private static final String DISPLAY_ALL_HOME = "select * from view_phong_tro";

    private static final String ADD_ID_HOME = "INSERT INTO nguoi_thue(`name`) VALUES (?);";

    private static final String ADD_NUMBERPHONE = "INSERT INTO chi_tiet_so_dien_thoai(ma_dien_thoai,so_dien_thoai) VALUES (?,?);";

    private static final String ADD_START_DAY = "INSERT INTO phong_tro_thue(ngay_bat_dau_thue) VALUES (?);";


    private static final String ADD_PAYPAL = "INSERT INTO hinh_thuc_thanh_toan(`name`) VALUES (?);";

    private static final String ADD_NOTE = "INSERT INTO phong_tro_thue(ghi_chu) VALUES (?);";

    @Override
    public List<Home> displayAll() {
        List<Home> homes = new ArrayList<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement prepared = connection.prepareStatement(DISPLAY_ALL_HOME)) {
            ResultSet result = prepared.executeQuery();
            while (result.next()) {
//                int id, String numberPhone, String startDate, String namePaypal, String namePerson, String note
                int id = result.getInt("id");
                String namePerson= result.getString("ten_nguoi_thue");
                String numberPhone = result.getString("so_dien_thoai");
                String startDate = result.getString("ngay_bat_dau_thue");
                String namePaypal = result.getString("ten_hinh_thuc_thanh_toan");
                String note = result.getString("ghi_chu");

                homes.add(new Home(id, namePerson, numberPhone,startDate, namePaypal, note));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return homes;
    }

    @Override
    public void add(Home home) {
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_ID_HOME);
            preparedStatement.setString(1, home.getNamePerson());
            preparedStatement.executeUpdate();
            PreparedStatement preparedStatementNumberPhone = connection.prepareStatement(ADD_NUMBERPHONE);
            preparedStatementNumberPhone.setString(1, home.getNumberPhone());
            preparedStatementNumberPhone.executeUpdate();
            PreparedStatement preparedStatementStartDay = connection.prepareStatement(ADD_START_DAY);
            preparedStatementStartDay.setString(1, home.getStartDate());
            preparedStatementStartDay.executeUpdate();
            PreparedStatement preparedStatementPaypal = connection.prepareStatement(ADD_PAYPAL);
            preparedStatementPaypal.setString(1, home.getNamePaypal());
            preparedStatementPaypal.executeUpdate();
            PreparedStatement preparedStatementNote = connection.prepareStatement(ADD_NOTE);
            preparedStatementNote.setString(1, home.getNote());
            preparedStatementNote.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
