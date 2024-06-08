package com.javarush.batalin.quest.model;

import lombok.Data;

import java.util.Map;

/**
 * @author Nikolay
 */
@Data
public class Situation {
    private int id;
    private String situation;
    private String questionText;
    private Map<String, Answer> answers;

    @Data
    public static class Answer {
        private String answerText;
        private String action;
        private Integer nextSituation;
    }
}
