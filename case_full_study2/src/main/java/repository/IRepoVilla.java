package repository;

import model.facility.Facility;
import model.facility.Villa;

import java.util.List;

public interface IRepoVilla {
    List<Villa> displayAll();

    void add(Villa villa);

    void update(Villa villa);

    void remove(String name);

   List<Villa> findByName(String name);
}
