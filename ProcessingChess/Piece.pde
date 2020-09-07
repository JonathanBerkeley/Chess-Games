abstract class Piece {
    //Instance variables
    String name;
    int xPos, yPos;
    boolean isWhite;
    boolean specialHasMoved;
    PImage imgpath;
    

    Piece(int xPos, int yPos, PImage imgpath, String name) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.imgpath = imgpath;
        this.name = name;
        this.specialHasMoved = false;
    }

    Piece(int xPos, int yPos, PImage imgpath, boolean isWhite, String name) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.imgpath = imgpath;
        this.name = name;
        this.isWhite = isWhite;
        this.specialHasMoved = false;
    }

    abstract ArrayList<String> getAllowedMoves();
}
