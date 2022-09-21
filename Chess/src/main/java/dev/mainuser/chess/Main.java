package dev.mainuser.chess;

import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Main extends Application {

    public void setupStage(Stage stage, Scene scene) {
        stage.setResizable(false);
        stage.initStyle(StageStyle.DECORATED);
        stage.setScene(scene);
        stage.show();
    }

    @Override
    public void start(Stage stage) throws IOException {
        stage.setTitle("Chess");

        double BOARD_SIZE = 800.0;
        double INCREMENT = BOARD_SIZE / 8;
        List<Node> tiles = new ArrayList<>();

        boolean isWhite = true;
        for (double y = 0; y < BOARD_SIZE; y += INCREMENT, isWhite = !isWhite) {
            for (double x = 0; x < BOARD_SIZE; x += INCREMENT, isWhite = !isWhite) {
                Color tileColor = (isWhite) ?
                        Color.WHITE : Color.GRAY;

                tiles.add(new Tile(INCREMENT, x, y, tileColor));
            }
        }

        Group rootGroup = new Group(tiles);
        setupStage(stage, new Scene(rootGroup, BOARD_SIZE, BOARD_SIZE));
    }

    public static void main(String[] args) {
        launch();
    }
}