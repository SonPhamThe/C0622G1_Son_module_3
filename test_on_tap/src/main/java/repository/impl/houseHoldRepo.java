package repository.impl;

import model.houseHold;
import model.member;
import repository.DataBaseRepository;
import repository.IRepoHouseHold;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class houseHoldRepo implements IRepoHouseHold {
    private static final String DISPLAY_ALL_HOUSE_HOLD = "select * from hienthihokhau";

    private static final String UPDATE_HOKHAU_SQL = "update ho_khau set ten_chu_ho = ?, ngay_lap_ho_khau = ?, dia_chi=?  where ma_ho_khau = ?;";

    private static final String SELECT_HOUSES_BY_ID = "select * from hienthihokhau where ma_ho_khau = ?;";

    private static final String SELECT_ALL_MEMBER = "SELECT * FROM thanh_vien WHERE ma_ho_khau = ?;";

    private static final String SELECT_SEARCH = "SELECT * FROM hienthihokhau WHERE is_delete=0 ten_chu_ho LIKE ? AND ngay_lap_ho_khau LIKE ? AND dia_chi LIKE ?;";

    private static final String SEARCH_NAME = "SELECT * FROM hienthihokhau where is_delete=0 and ten_chu_ho like ?;";

    private static final String SEARCH_TWO= "SELECT * FROM hienthihokhau where is_delete=0 and ten_chu_ho like ? AND ngay_lap_ho_khau LIKE ?;";

    private static final String SEARCH_EMPLOYEE = "SELECT employee.* FROM employee\n" +
            "JOIN division ON employee.division_id = division.id\n" +
            "WHERE status=1 AND employee.name like ? AND employee.email like ? AND division.name like ?;";
    private static final String SELECT_ALL_DIVISION = "SELECT  * FROM division;";


    @Override
    public List<houseHold> displayAll() {
        List<houseHold> houseHolds = new ArrayList<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement prepared = connection.prepareStatement(DISPLAY_ALL_HOUSE_HOLD)) {
            ResultSet result = prepared.executeQuery();
            while (result.next()) {
                int id = result.getInt("ma_ho_khau");
                String name = result.getString("ten_chu_ho");
                String startDate = result.getString("ngay_lap_ho_khau");
                String address = result.getString("dia_chi");
                int so_luong = result.getInt("so_luong_thanh_vien");

                houseHolds.add(new houseHold(id, name, startDate, address, so_luong));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return houseHolds;
    }

    @Override
    public boolean update(houseHold houseHold) {
        boolean rowUpdated = false;

        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_HOKHAU_SQL)) {
            preparedStatement.setString(1, houseHold.getName());
            preparedStatement.setString(2, houseHold.getStartDate());
            preparedStatement.setString(3, houseHold.getAddress());
            preparedStatement.setString(4, String.valueOf(houseHold.getId()));
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public houseHold findHouseHold(int id) {
        houseHold houseHoldEdit = null;
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HOUSES_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("ten_chu_ho");
                String startDate = rs.getString("ngay_lap_ho_khau");
                String address = rs.getString("dia_chi");
                int so_luong = rs.getInt("so_luong_thanh_vien");
                houseHoldEdit = new houseHold(id, name, startDate, address, so_luong);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return houseHoldEdit;
    }

    @Override
    public Map<Integer, List<member>> getListHouseHold() throws SQLException {
        Map<Integer, List<member>> listMap = new HashMap<>();
        List<Integer> list = new ArrayList<>();
        for (houseHold houseHolds : displayAll()) {
            list.add(houseHolds.getId());
        }
        Connection connection = DataBaseRepository.getConnection();
        for (int item : list) {
            List<member> memberList = new ArrayList<>();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MEMBER);
            preparedStatement.setInt(1, item);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("ten");
                String ngaysinh = rs.getString("ngay_sinh");
                int maHoKhau = rs.getInt("ma_ho_khau");
                memberList.add(new member(name, ngaysinh, maHoKhau));
            }
            listMap.put(item, memberList);
        }
       return listMap;
    }

    @Override
    public List<houseHold> searchHouseHold(String searchName, String searchDate, String searchAddress) {
        List<houseHold> houseHoldList = new ArrayList<>();
        Connection connection = DataBaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE);
            preparedStatement.setString(1, "%" + name + "%");
            preparedStatement.setString(2, "%" + email + "%");
            preparedStatement.setString(3, "%" + divisionType + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int employeeId = resultSet.getInt("id");
                String employeeName = resultSet.getString("name");
                String employeeBirthday = resultSet.getString("date_of_birth");
                String employeeIdCard = resultSet.getString("id_card");
                double employeeSalary = resultSet.getInt("salary");
                String employeePhone = resultSet.getString("phone_number");
                String employeeEmail = resultSet.getString("email");
                String employeeAddress = resultSet.getString("address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");

                employeeList.add(new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                        employeePhone, employeeEmail, employeeAddress, positionId, educationDegreeId, divisionId));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public List<houseHold> searchHouseHoldTwo(String searchName, String searchDate) {
        List<houseHold> houseHolds = new ArrayList<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_TWO);) {
            preparedStatement.setString(1, "%"+searchName+"%");
            preparedStatement.setString(2,"%"+searchDate+"%");

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ma_ho-khau");
                String name = rs.getString("ten_chu_ho");
                String startDate = rs.getString("ngay_lap_ho_khau");
                String address = rs.getString("dia_chi");
                int so_luong = rs.getInt("so_luong_thanh_vien");
                houseHolds.add(new houseHold(id, name, startDate, address, so_luong));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return houseHolds;
    }

    @Override
    public List<houseHold> searchHouseHoldOne(String searchName) {
        List<houseHold> houseHolds = new ArrayList<>();
        try (Connection connection = DataBaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_NAME);) {
            preparedStatement.setString(1, "%"+searchName+"%");

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ma_ho-khau");
                String name = rs.getString("ten_chu_ho");
                String startDate = rs.getString("ngay_lap_ho_khau");
                String address = rs.getString("dia_chi");
                int so_luong = rs.getInt("so_luong_thanh_vien");
                houseHolds.add(new houseHold(id, name, startDate, address, so_luong));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return houseHolds;
    }

    @Override
    public Map<Integer, String> selectAllPosition() {
//        Map<Integer, String> positionMap = new LinkedHashMap<>();
//        try {
//            Connection connection = BaseRepository.getConnectDB();
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSITION);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                positionMap.put(id, name);
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return positionMap;
        return null;
    }

    @Override
    public Map<Integer, String> selectAllEducationDegree() {
//        Map<Integer, String> educationDegreeMap = new LinkedHashMap<>();
//        try {
//            Connection connection = BaseRepository.getConnectDB();
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EDUCATIONDEGREE);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                educationDegreeMap.put(id, name);
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return educationDegreeMap;
        return null;
    }

    @Override
    public Map<Integer, String> selectAllDivision() {
//        Map<Integer, String> divisionMap = new LinkedHashMap<>();
//        try {
//            Connection connection = BaseRepository.getConnectDB();
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DIVISION);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                divisionMap.put(id, name);
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return divisionMap;
        return null;
    }
}
