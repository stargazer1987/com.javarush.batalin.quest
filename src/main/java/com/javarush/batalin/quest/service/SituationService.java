package com.javarush.batalin.quest.service;

import com.javarush.batalin.quest.model.Situation;
import com.javarush.batalin.quest.repository.SituationRepository;

import java.io.IOException;

/**
 * @author Nikolay
 */
public class SituationService {
    private final SituationRepository situationRepository;

    public SituationService(String filePath) throws IOException {
        this.situationRepository = new SituationRepository(filePath);
    }

    public Situation getSituationById(int id) {
        return situationRepository.getSituationById(id);
    }

}
