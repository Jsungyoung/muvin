package com.example.muvin.domain.place_current;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlaceCurrentRepository extends JpaRepository<PlaceCurrent, Integer> {

    public List<PlaceCurrent> findByUserId(String userId);
}
