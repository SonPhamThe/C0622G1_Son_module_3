package repository.impl.impl_facility;

import model.facility.Villa;
import repository.IRepoVilla;

import java.util.ArrayList;
import java.util.List;

public class RepoVilla implements IRepoVilla {
    private static List<Villa> villas = new ArrayList<>();

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
