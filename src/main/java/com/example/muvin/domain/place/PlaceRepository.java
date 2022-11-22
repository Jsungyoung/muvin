package com.example.muvin.domain.place;

import com.example.muvin.util.Timestamp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, String> {

    @Query(value = "SELECT * FROM place WHERE movie_code = ?", nativeQuery = true)
    List<Place> findPlaceByMovie_code(String movie_code);

    @Query(value = "SELECT * from `place`", nativeQuery = true)
    List<Place> findAllPlace();

    @Query(value = "SELECT * FROM place where `code` = ? ", nativeQuery = true)
    List<Place> findByPlaceCode();

    @Query(value = "SELECT * FROM place WHERE movie_code=? and area_name=?", nativeQuery = true)
    Place findPlace(String movie_code, String area_name);

}