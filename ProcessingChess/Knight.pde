class Knight extends Piece {
    
    Knight(int xp, int yp, PImage ipath) {
        super(xp, yp, ipath, "Knight");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        legalMoves.add(getChessSquare(this.xPos + 100, this.yPos + 200));
        legalMoves.add(getChessSquare(this.xPos - 100, this.yPos + 200));
        legalMoves.add(getChessSquare(this.xPos + 100, this.yPos - 200));
        legalMoves.add(getChessSquare(this.xPos - 100, this.yPos - 200));
        
        legalMoves.add(getChessSquare(this.xPos + 200, this.yPos + 100));
        legalMoves.add(getChessSquare(this.xPos - 200, this.yPos + 100));
        legalMoves.add(getChessSquare(this.xPos + 200, this.yPos - 100));
        legalMoves.add(getChessSquare(this.xPos - 200, this.yPos - 100));
        return legalMoves;
    }
}
