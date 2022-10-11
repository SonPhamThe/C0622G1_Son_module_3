package repository;

import model.Home;

import java.util.List;

public interface IRepoHome {
    List<Home> displayAll();

    void add(Home home);
}
