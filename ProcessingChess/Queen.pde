class Queen extends Piece {
    
    Queen(int xp, int yp, PImage ipath, Boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Queen");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        String line1, line2, line3, line4, piq;
        String diagonal1, diagonal2, diagonal3, diagonal4;
        for (int i = 100; i < 800; i += 100) {
                line1 = getChessSquare(this.xPos, this.yPos + i); //up
                line2 = getChessSquare(this.xPos + i, this.yPos); //right
                line3 = getChessSquare(this.xPos - i, this.yPos); //left
                line4 = getChessSquare(this.xPos, this.yPos - i); //down

                legalMoves.add(line1);
                legalMoves.add(line2);
                legalMoves.add(line3);
                legalMoves.add(line4);
                
                diagonal1 = getChessSquare(this.xPos + i, this.yPos + i);
                diagonal2 = getChessSquare(this.xPos - i, this.yPos + i);
                diagonal3 = getChessSquare(this.xPos - i, this.yPos - i);
                diagonal4 = getChessSquare(this.xPos + i, this.yPos - i);

                legalMoves.add(diagonal1);
                legalMoves.add(diagonal2);
                legalMoves.add(diagonal3);
                legalMoves.add(diagonal4);
        }
        return legalMoves;
    }
}
