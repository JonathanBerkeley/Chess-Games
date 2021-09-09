class Rook extends Piece {
    
    Rook(float xp, float yp, PImage ipath, Boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Rook");
    }
    
    Rook(int xp, int yp, PImage ipath, Boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Rook");
    }
    
    @Override
    void addSpecialMove(String move) {
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        String line1, line2, line3, line4, piq;
        for (int i = (int)SQUARE_SIZE; i < (int)(SQUARE_SIZE * 8); i += (int)SQUARE_SIZE) {
                line1 = getChessSquare(this.xPos, this.yPos + i); //up
                line2 = getChessSquare(this.xPos + i, this.yPos); //right
                line3 = getChessSquare(this.xPos - i, this.yPos); //left
                line4 = getChessSquare(this.xPos, this.yPos - i); //down

                legalMoves.add(line1);
                legalMoves.add(line2);
                legalMoves.add(line3);
                legalMoves.add(line4);
        }
        return legalMoves;
    }
}
