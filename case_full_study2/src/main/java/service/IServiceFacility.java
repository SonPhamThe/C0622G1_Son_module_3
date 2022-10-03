package service;

import model.facility.Facility;

import java.util.List;

public interface IServiceFacility {
    List<Facility> displayAll();

    void add(Facility facility);

    void update(Facility facility);

    void remove(String name);
}
