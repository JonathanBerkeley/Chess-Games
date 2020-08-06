class Piece {
    //Instance variables
    String name;
    int xPos, yPos;
    int team;
    PImage imgpath;
    
    Piece(int xPos, int yPos, PImage imgpath, String name) {
        this.xPos = xPos;
        this.yPos = yPos;
        this.imgpath = imgpath;
        this.name = name;
    }
}
