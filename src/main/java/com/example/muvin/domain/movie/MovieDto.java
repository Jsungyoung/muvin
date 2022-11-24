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
    private int content_id;
    private String content_type;
    private String type;
}
