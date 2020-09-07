class King extends Piece {
    
    King(int xp, int yp, PImage ipath, Boolean isWhite) {
        super(xp, yp, ipath, isWhite, "King");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        legalMoves.add(getChessSquare(this.xPos, this.yPos + SQUARE_SIZE)); //up
        legalMoves.add(getChessSquare(this.xPos, this.yPos - SQUARE_SIZE)); //down
        legalMoves.add(getChessSquare(this.xPos - SQUARE_SIZE, this.yPos)); //left
        legalMoves.add(getChessSquare(this.xPos + SQUARE_SIZE, this.yPos)); //right
        
        legalMoves.add(getChessSquare(this.xPos + SQUARE_SIZE, this.yPos + SQUARE_SIZE)); //top-right
        legalMoves.add(getChessSquare(this.xPos - SQUARE_SIZE, this.yPos + SQUARE_SIZE)); //top-left
        legalMoves.add(getChessSquare(this.xPos + SQUARE_SIZE, this.yPos - SQUARE_SIZE)); //bottom-right
        legalMoves.add(getChessSquare(this.xPos - SQUARE_SIZE, this.yPos - SQUARE_SIZE)); //bottom-left
        return legalMoves;
    }
}
