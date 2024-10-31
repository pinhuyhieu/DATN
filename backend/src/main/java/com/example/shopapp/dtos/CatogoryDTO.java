package com.example.shopapp.dtos;

import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CatogoryDTO {
    @NotEmpty(message = "Khong duoc de trong ten")
    private String name;
}
