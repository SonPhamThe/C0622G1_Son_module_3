package service.impl.impl_facility;

import model.facility.House;
import repository.IRepoHouse;
import repository.impl.impl_facility.RepoHouse;
import service.IServiceHouse;

import java.util.List;

public class ServiceHouse implements IServiceHouse {
    private static IRepoHouse houseRepo = new RepoHouse();

    @Override
    public List<House> displayAll() {
        return houseRepo.displayAll();
    }

    @Override
    public void add(House house) {
        houseRepo.add(house);
    }

    @Override
    public void update(House house) {
        houseRepo.update(house);
    }

    @Override
    public void remove(String name) {
        houseRepo.remove(name);
    }
}
