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
    private String movieCode;
    private String placeName;
    private String placeURL;
    private int selmord;

}
