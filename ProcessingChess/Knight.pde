class Knight extends Piece {
    
    Knight(float xp, float yp, PImage ipath, Boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Knight");
    }
    
    Knight(int xp, int yp, PImage ipath, Boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Knight");
    }
    
    @Override
    void addSpecialMove(String move) {
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        legalMoves.add(getChessSquare(this.xPos + SQUARE_SIZE, this.yPos + SQUARE_SIZE * 2));
        legalMoves.add(getChessSquare(this.xPos - SQUARE_SIZE, this.yPos + SQUARE_SIZE * 2));
        legalMoves.add(getChessSquare(this.xPos + SQUARE_SIZE, this.yPos - SQUARE_SIZE * 2));
        legalMoves.add(getChessSquare(this.xPos - SQUARE_SIZE, this.yPos - SQUARE_SIZE * 2));
        
        legalMoves.add(getChessSquare(this.xPos + SQUARE_SIZE * 2, this.yPos + SQUARE_SIZE));
        legalMoves.add(getChessSquare(this.xPos - SQUARE_SIZE * 2, this.yPos + SQUARE_SIZE));
        legalMoves.add(getChessSquare(this.xPos + SQUARE_SIZE * 2, this.yPos - SQUARE_SIZE));
        legalMoves.add(getChessSquare(this.xPos - SQUARE_SIZE * 2, this.yPos - SQUARE_SIZE));
        return legalMoves;
    }
}
