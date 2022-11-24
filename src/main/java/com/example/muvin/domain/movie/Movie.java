package com.example.muvin.domain.movie;

import com.example.muvin.util.Timestamp;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.Date;

@Table(name = "movie")
@Entity
@NoArgsConstructor
@Setter
public class Movie  extends Timestamp {

    @Id
    private int code;
    private String userId;
    private int content_id;
    private String content_type;
    private String type;

    public Movie(MovieDto movieDto){
        this.code = movieDto.getCode();
        this.userId = movieDto.getUserId();
        this.content_id = movieDto.getContent_id();
        this.content_type = movieDto.getContent_type();
        this.type = movieDto.getType();
    }
}
