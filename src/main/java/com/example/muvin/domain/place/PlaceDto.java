package com.example.muvin.domain.place;


import com.fasterxml.jackson.annotation.JsonAutoDetect;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
public class PlaceDto {
    private int code;
    private double x;
    private double y;
    private String areaName;
    private String movie_code;
    private String place_name;
    private String place_URL;
    private int selmord;

}
