package org.example.servlets;

import org.example.model.Point;
import org.example.model.PointCollection;


import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;


@WebServlet("/area-check-servlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter printWriter = response.getWriter();
        HttpSession session = request.getSession();

        long timer = System.nanoTime();

        float x = Float.parseFloat(request.getParameter("x-value"));
        float y = Float.parseFloat(request.getParameter("y-value"));
        float r = Float.parseFloat(request.getParameter("r-value"));

        String status = hit(x, y, r);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        String currentTime = formatter.format(LocalDateTime.now(ZoneId.of("Europe/Moscow")));
        long runtime = (long) ((System.nanoTime() - timer) * 0.00001);

        Object collection = session.getAttribute("dots");

        if (collection == null) {
            collection = new PointCollection();
        }

        PointCollection pointsCollection = (PointCollection) collection;

        Point newPoint = new Point(x, y, r, currentTime, runtime, status);
        pointsCollection.add(newPoint);

        session.setAttribute("dots", pointsCollection);

        String res = newPoint.toJSON();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        printWriter.write(res);
        printWriter.flush();
    }

    private String hit(double x, double y, double r) {
        if (isCircle(x, y, r) || isTriangle(x, y, r) || isSquare(x, y, r)) {
            return "True";
        }
        return "False";
    }

    private boolean isSquare(double x, double y, double r) {
        return x >= -r / 2 && x <= 0 && y <= 0 && y >= -r;
    }

    private boolean isCircle(double x, double y, double r) {
        return ((x * x + y * y) <= r * r / 4 && x <= 0 && y >= 0);
    }

    private boolean isTriangle(double x, double y, double r) {
        return (y >= (x - r / 2) && y <= 0 && x >= 0);
    }
}
