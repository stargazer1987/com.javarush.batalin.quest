package com.javarush.batalin.quest.controller;

import com.javarush.batalin.quest.model.Situation;
import com.javarush.batalin.quest.service.SituationService;


import org.jetbrains.annotations.NotNull;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author Nikolay
 */
@WebServlet(name = "mainServlet", value = "/play-the-game")
public class MainServlet extends HttpServlet {

    private SituationService situationService;

    @Override
    public void init() throws ServletException {
        try {
            String roadmapFilePath = "roadmap.json";
            situationService = new SituationService(roadmapFilePath);
        } catch (IOException e) {
            throw new ServletException("Can't load a roadmap", e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String name = request.getParameter("name");

        if (name != null && !name.isEmpty()) {
            session.setAttribute("playerName", name);
            if (session.getAttribute("gameCount") == null) {
                session.setAttribute("gameCount", 0);
            }
        } else {
            name = (String) session.getAttribute("playerName");
            if (name == null || name.isEmpty()) {
                response.sendRedirect("startpage.jsp");
                return;
            }
        }

        String answer = request.getParameter("answer");
        String situationIdParameter = request.getParameter("situationId");

        if (situationIdParameter == null || situationIdParameter.isEmpty()) {
            throw new ServletException("SituationId parameter is empty or missing");
        }

        int situationId;
        try {
            situationId = Integer.parseInt(situationIdParameter);
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid situationId parameter", e);
        }

        Situation situation = situationService.getSituationById(situationId);
        if (situation == null) {
            throw new ServletException("There is no questionText for situationId: " + situationId);
        }

        if (answer == null) {
            request.setAttribute("errorMessage", "Select an answer, please");
            forwardToQuestion(request, response, name, situation);
            return;
        }

        Situation.Answer chosenAnswer = situation.getAnswers().get(answer);
        if (chosenAnswer == null) {
            request.setAttribute("error message", "Invalid option was chosen");
            forwardToQuestion(request, response, name, situation);
            return;
        }

        request.setAttribute("action", chosenAnswer.getAction());
        request.setAttribute("name", name);
        request.setAttribute("nextSituation", String.valueOf(chosenAnswer.getNextSituation()));

        if (chosenAnswer.getNextSituation() == null || chosenAnswer.getNextSituation() == 0) {
            request.getRequestDispatcher("/died.jsp").forward(request,response);
        } else if (chosenAnswer.getNextSituation() == 100) {
            request.getRequestDispatcher("/survive.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/action.jsp").forward(request, response);
        }
    }

    private void forwardToQuestion(@NotNull HttpServletRequest request, @NotNull HttpServletResponse response,
            String name, Situation situation) throws ServletException, IOException {
        request.setAttribute("name", name);
        request.setAttribute("situation", situation);
        request.setAttribute("situationId", situation.getId());
        request.getRequestDispatcher("/situations.jsp").forward(request, response);
    }

}
