package com.example.muvin.domain.place;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, String> {

    @Query(value = "SELECT * FROM place WHERE movie_code = ?", nativeQuery = true)
    public List<Place> findPlaceByMovie_code(String movie_code);

    @Query(value = "SELECT * from `place`", nativeQuery = true)
    List<Place> findAllPlace();


}
