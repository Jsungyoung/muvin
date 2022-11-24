package com.example.muvin.service;

import com.example.muvin.domain.place.Place;
import com.example.muvin.domain.place.PlaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PlaceService {

    //READ
    @Autowired
    private PlaceRepository repository;

    public Map<String, Object> write(Place place) {
        Map<String, Object> data = new HashMap<>();
        repository.save(place);
        Place result = repository.findPlace(place.getMovieCode(), place.getAreaName());

        if (result == null) {
            data.put("status", "failed");
        }
        data.put("status", "success");
        data.put("id", result.getCode());
        return data;
    }

    public List<Place> placeList() {

        return repository.findAll();
    }

    public List<Place> placeListByMovie_code(String movie_code) {
        List<Place> result = repository.findPlaceByMovie_code(movie_code);
        return result;
    }

    public List<Place> getAllPlace() {
        return repository.findAll();
    }

    public List<Place> getAllPlaceByAreaName(String areaName){
        return repository.findByareaNameContaining(areaName);
    }


    public List<Place> getPlaceByPlaceCode(int place_code) {
        return repository.findByPlaceCode();
    }
}

