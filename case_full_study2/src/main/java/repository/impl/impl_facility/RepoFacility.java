package repository.impl.impl_facility;

import model.facility.Facility;
import repository.IRepoFacility;

import java.util.ArrayList;
import java.util.List;

public class RepoFacility implements IRepoFacility {
    private static List<Facility> facilities = new ArrayList<>();

    @Override
    public List<Facility> displayAll() {
        return facilities;
    }

    @Override
    public void add(Facility facility) {
        facilities.add(facility);
    }

    @Override
    public void update(Facility facility) {
        int index = facilities.indexOf(facility);
        facilities.set(index, facility);
    }

    @Override
    public void remove(String name) {
        for (Facility facility : facilities) {
            if (facility.getName().equals(name)) {
                facilities.remove(facility);
                break;
            }
        }
    }
}
