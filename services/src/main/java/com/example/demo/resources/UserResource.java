package com.example.demo.resources;

import com.example.demo.data.UserRepository;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Locale;

@RestController
@RequestMapping("/user")
public class UserResource {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable String id) {
        return ResponseEntity.ok(userRepository.findUserByIdentification(id));
    }

    @PostMapping()
    public void save(@RequestBody User user) {
        System.out.println(user.toString());
        userRepository.save(user);
    }

}
