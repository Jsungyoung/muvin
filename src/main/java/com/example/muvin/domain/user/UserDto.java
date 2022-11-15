package com.example.muvin.domain.user;

import com.example.muvin.entity.User;
import lombok.*;
import org.springframework.beans.factory.annotation.Autowired;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {

    private String id; // PK
    private String password;
    private String name;
    private String nickname;
    private String phone;
    private String birth;
    private String email;

}