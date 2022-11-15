package com.example.muvin.service;


import com.example.muvin.entity.User;
import com.example.muvin.domain.user.UserDto;
import com.example.muvin.domain.user.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
@RequiredArgsConstructor
public class UserService {

    @Autowired
    private UserRepository repository;

    public User createUser (UserDto userDto){
        User user = new User();
        user.setId(userDto.getId());
        user.setPassword(userDto.getPassword());
        user.setName(userDto.getName());
        user.setNickname(userDto.getNickname());
        user.setPhone(userDto.getPhone());
        user.setBirth(userDto.getBirth());
        user.setEmail(userDto.getEmail());
        return repository.save(user);
    }

    public User login(String id){
        return repository.findMyid(id);
    }
}
