package com.example.demo.model;

import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class Phone {
    private String number;
    private String type;
}
