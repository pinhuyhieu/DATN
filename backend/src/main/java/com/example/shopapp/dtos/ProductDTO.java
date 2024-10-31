package com.example.shopapp.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDTO {
    @NotBlank(message = "Ko dc bo trong")
    @Size(min = 3, max = 200, message = "Tieu de phai lon hon 3 va be hon 200 ki tu")
    private String name;
    @Min(value = 0, message = "Gia phai lon hon 0")
    @Max(value = 999999999,message = "gia ko dc lon hon 999999999")
    private Float price;

    private String thumbnail;
    private String description;
    @NotNull(message = "ko dc bo trong id")
    @JsonProperty("category_id")
    private String categoryId;

}
