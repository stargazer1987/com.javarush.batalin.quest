package com.javarush.batalin.quest.repository;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javarush.batalin.quest.model.Situation;
import lombok.Getter;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @author Nikolay
 */
@Getter
public class SituationRepository {
    private final List<Situation> situations;

    public SituationRepository(String filePath) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream(filePath)) {
            if (inputStream == null) {
                throw new IOException("File can't be found: " + filePath);
            }
            situations = objectMapper.readValue(inputStream, new TypeReference<List<Situation>>() {
            });
        }
    }


    public Situation getSituationById(int id){
        return situations.stream().filter(s -> s.getId() == id).findFirst().orElse(null);
    }
}
