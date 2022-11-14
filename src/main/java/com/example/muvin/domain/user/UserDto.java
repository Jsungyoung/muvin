package com.example.muvin.domain.user;

import com.example.muvin.entity.User;
import lombok.Data;

@Data
public class UserDto {

    private String id; // PK
    private String password;
    private String name;
    private String nickname;
    private String phone;
    private String birth;
    private String email;

    public static UserDto toUserDto(User user){
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setPassword(user.getPassword());
        userDto.setName(user.getName());
        userDto.setNickname(user.getNickname());
        userDto.setPhone(user.getPhone());
        userDto.setBirth(user.getBirth());
        userDto.setEmail(user.getEmail());
        return userDto;
    }
}