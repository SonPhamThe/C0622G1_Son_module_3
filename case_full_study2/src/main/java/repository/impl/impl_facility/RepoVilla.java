package repository.impl.impl_facility;

import model.facility.Villa;
import repository.IRepoVilla;

import java.util.ArrayList;
import java.util.List;

public class RepoVilla implements IRepoVilla {
    private static List<Villa> villas = new ArrayList<>();

    private static final String SELECT_VILLA = "SELECT * FROM dich_vu dv WHERE dv.ma_loai_dich_vu = 1;";

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
}
