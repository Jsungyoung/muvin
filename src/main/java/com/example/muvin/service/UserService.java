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
    private final UserRepository repository;

    public String save(UserDto userDto){
        User user = User.toSaveEntity(userDto);
        return repository.save(user).getId();
    }


    public UserDto login(UserDto userDto) {
        Optional<User> optionalUser = repository.findByUserId(userDto.getId());
        if(optionalUser.isPresent()){
            User login = optionalUser.get();
            if(login.getPassword().equals(userDto.getPassword())){
                return UserDto.toUserDto(login);
            }else{
                return null;
            }
        }else{
            return null;
        }
    }
}
