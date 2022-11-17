package com.example.muvin.domain.map;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class MapDto {

    private double x;
    private double y;
    private String movie_name;
    private String posterURL;
    private String areaURL;
    private String area_name;


}
