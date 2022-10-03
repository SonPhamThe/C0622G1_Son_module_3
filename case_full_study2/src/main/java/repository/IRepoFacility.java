package repository;

import model.facility.Facility;

import java.util.List;

public interface IRepoFacility {
    List<Facility> displayAll();

    void add(Facility facility);

    void update(Facility facility);

    void remove(String name);
}
