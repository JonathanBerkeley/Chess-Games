abstract class Piece {
    //Instance variables
    String name;
    int xPos, yPos;
    boolean isWhite;
    boolean specialHasMoved;
    PImage imgpath;
    
    Piece(float xPos, float yPos, PImage imgpath, String name) {
        this.xPos = (int)xPos;
        this.yPos = (int)yPos;
        this.imgpath = imgpath;
        this.name = name;
        this.specialHasMoved = false;
    }
    
    Piece(float xPos, float yPos, PImage imgpath, boolean isWhite, String name) {
        this.xPos = (int)xPos;
        this.yPos = (int)yPos;
        this.imgpath = imgpath;
        this.name = name;
        this.isWhite = isWhite;
        this.specialHasMoved = false;
    }

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
    abstract void addSpecialMove(String x);
}
