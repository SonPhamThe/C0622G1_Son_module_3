package repository.impl.impl_facility;

import model.facility.Villa;
import repository.IRepoVilla;

import java.util.ArrayList;
import java.util.List;

public class RepoVilla implements IRepoVilla {
    private static List<Villa> villas = new ArrayList<>();

    private static final String SELECT_VILLA = "SELECT * FROM dich_vu dv WHERE dv.ma_loai_dich_vu = 1;";

//    String name, double area, double cost, int max_people, String rent_type, String standard_room, String description_other_convenience, double pool_area, int number_of_floors

    static {
        villas.add(new Villa("Villa Beach Front", 25000, 1000000, 10, "vip", "Có hồ bơi", "500", 4, 3));
        villas.add(new Villa("Villa 3 star", 35000, 2000000, 20, "vipPro", "Có sân vườn", "600", 5, 4));
        villas.add(new Villa("Villa 4 star", 45000, 3000000, 30, "vipSuper", "Có bếp nướng", "700", 6, 5));
        villas.add(new Villa("Villa 5 star", 55000, 4000000, 40, "vipVip", "Có sân banh", "800", 7, 6));
        villas.add(new Villa("Villa Vip tonight", 65000, 5000000, 50, "vip", "Có rạp xem phim", "900", 8, 7));
    }

    @Override
    public List<Villa> displayAll() {
        return villas;
    }

    @Override
    public void add(Villa villa) {
        villas.add(villa);
    }

    @Override
    public void update(Villa villa) {
        int index = villas.indexOf(villa);
        villas.set(index, villa);
    }

    @Override
    public void remove(String name) {
        for (Villa villa : villas) {
            if (villa.getName().equals(name)) {
                villas.remove(villa);
                break;
            }
        }
    }

    @Override
    public List<Villa> findByName(String name) {
        List<Villa> villaFoundName = new ArrayList<>();
        for (Villa villa : villas) {
            if (villa.getName().contains(name)) {
                villaFoundName.add(villa);
            }
        }
        return villaFoundName;
    }
}
