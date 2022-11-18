package com.example.muvin.service;

import com.example.muvin.domain.place.Place;
import com.example.muvin.domain.place.PlaceRepository;
import com.example.muvin.domain.user.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlaceService {

    //READ
    @Autowired
    private PlaceRepository repository;

    public void write(Place place){

        repository.save(place);
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



}
