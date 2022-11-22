package com.example.muvin.service;

import com.example.muvin.domain.place.Place;
import com.example.muvin.domain.place.PlaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlaceService {

    //READ
    @Autowired
    private PlaceRepository repository;

    public Boolean write(Place place){
        repository.save(place);

        Place result = repository.findPlace(place.getMovie_code(),place.getArea_name());
        if(result == null){
            return false;
        }
        return true;
    }

    public List<Place> placeList(){

        return repository.findAll();
    }

    public List<Place> placeListByMovie_code(String movie_code){
        List<Place> result = repository.findPlaceByMovie_code(movie_code);
        return result;
    }

    public List<Place> getAllPlace(){
        return repository.findAllPlace();
    }


    public List<Place> getPlaceByPlaceCode(String place_code){return repository.findByPlaceCode();}
}