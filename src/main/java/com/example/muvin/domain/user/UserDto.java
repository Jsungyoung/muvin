package com.example.muvin.domain.user;

import java.time.LocalDateTime;
import java.util.Optional;

import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


@Getter
@Setter
@NoArgsConstructor
public class UserDto {

    private String id; // PK

    private String password;

    private String name;

    private String nickname;

    private String phone;
    private String birth;

    private String email;


    public  UserDto(User user){
        id = user.getId();
        password = user.getPassword();
        name = user.getName();
        nickname = user.getNickname();
        phone = user.getPhone();
        birth = user.getBirth();
        email = user.getEmail();
    }

    @Builder
    public UserDto(String id, String password, String name, String nickname, String phone, String birth, String email){
        this.id = id;
        this.password = password;
        this.name = name;
        this.nickname = nickname;
        this.phone = phone;
        this.birth = birth;
        this.email = email;
    }

    public User toEntity(){
        User user = User.builder()
                .id(id)
                .password(password)
                .name(name)
                .nickname(nickname)
                .phone(phone)
                .birth(birth)
                .email(email)
                .build();
        return user;
    }

}