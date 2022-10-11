package service.impl;

import model.Home;
import repository.IRepoHome;
import repository.impl.RepoHome;
import service.IServiceHome;

import java.util.List;

public class ServiceHome implements IServiceHome {
    private static final IRepoHome repoHome = new RepoHome();

    @Override
    public List<Home> displayAll() {
        return repoHome.displayAll();
    }

    @Override
    public void add(Home home) {
        repoHome.add(home);
    }
}
