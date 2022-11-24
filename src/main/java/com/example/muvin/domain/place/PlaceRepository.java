package com.example.muvin.domain.place;

import com.example.muvin.util.Timestamp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.temporal.ValueRange;
import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, Integer> {

    @Query(value = "SELECT * FROM place WHERE movie_code = ?", nativeQuery = true)
    List<Place> findPlaceByMovie_code(String movie_code);


    List<Place> findAll();

    List<Place> findByareaNameContaining(String areaName);

    @Query(value = "SELECT * FROM place where `code` = ? ", nativeQuery = true)
    List<Place> findByPlaceCode();

    @Query(value = "SELECT * FROM place WHERE movie_code=? and area_name=?", nativeQuery = true)
    Place findPlace(String movie_code, String area_name);



    @Query(value = "SELECT movie_code FROM place where selmord = 1", nativeQuery = true)
    List<String> findMovieCodeByMovie();

    @Query(value = "SELECT movie_code FROM place where selmord = 2", nativeQuery = true)
    List<String> findMovieCodeByDrama();
}