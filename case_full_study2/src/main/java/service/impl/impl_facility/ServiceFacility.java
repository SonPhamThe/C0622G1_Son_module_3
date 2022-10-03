package service.impl.impl_facility;

import model.facility.Facility;
import repository.IRepoFacility;
import repository.impl.impl_facility.RepoFacility;
import service.IServiceFacility;

import java.util.List;

public class ServiceFacility implements IServiceFacility {
    private static IRepoFacility facilityRepo = new RepoFacility();

    @Override
    public List<Facility> displayAll() {
        return facilityRepo.displayAll();
    }

    @Override
    public void add(Facility facility) {
        facilityRepo.add(facility);
    }

    @Override
    public void update(Facility facility) {
        facilityRepo.update(facility);
    }

    @Override
    public void remove(String name) {
        facilityRepo.remove(name);
    }
}
