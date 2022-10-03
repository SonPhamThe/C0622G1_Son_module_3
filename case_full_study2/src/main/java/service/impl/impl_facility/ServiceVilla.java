package service.impl.impl_facility;

import model.facility.Villa;
import repository.IRepoVilla;
import repository.impl.impl_facility.RepoVilla;
import service.IServiceVilla;

import java.util.List;

public class ServiceVilla implements IServiceVilla {
    private static IRepoVilla villasRepo = new RepoVilla();

    @Override
    public List<Villa> displayAll() {
        return villasRepo.displayAll();
    }

    @Override
    public void add(Villa villa) {
        villasRepo.add(villa);
    }

    @Override
    public void update(Villa villa) {
        villasRepo.update(villa);
    }

    @Override
    public void remove(String name) {
        villasRepo.remove(name);
    }
}
