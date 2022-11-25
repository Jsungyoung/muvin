package com.example.muvin.domain.movie;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MovieDto {

    private int code;
    private String userId;
    private String contentId;
    private String contentType;
    private String type;

    public MovieDto(String userId, String contentId, String contentType, String type){
        this.userId = userId;
        this.contentId = contentId;
        this.contentType = contentType;
        this.type = type;
    }

}
