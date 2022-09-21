module dev.mainuser.chess {
    requires javafx.controls;
    requires javafx.fxml;

    requires com.almasb.fxgl.all;

    opens dev.mainuser.chess to javafx.fxml;
    exports dev.mainuser.chess;
}