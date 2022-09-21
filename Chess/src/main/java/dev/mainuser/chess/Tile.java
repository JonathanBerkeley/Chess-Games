package dev.mainuser.chess;

import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;

public class Tile extends Rectangle {
    Tile() {
        super();
    }

    Tile(double size, double positionX, double positionY) {
        super(size, size);
        this.setXY(positionX, positionY);
    }

    Tile(double size, double positionX, double positionY, Color color) {
        super(size, size, color);
        this.setXY(positionX, positionY);
    }

    public void setXY(double x, double y) {
        this.setX(x);
        this.setY(y);
    }
}
