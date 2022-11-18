package com.example.muvin.domain.place;


import com.example.muvin.util.Timestamp;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
public class PlaceDto {
    private String code;
    private double x;
    private double y;
    private String area_code;
    private String area_name;
    private String movie_code;
    private String place_name;
    private String place_URL;


}
