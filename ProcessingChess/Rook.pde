class Rook extends Piece {
    
    Rook(int xp, int yp, PImage ipath) {
        super(xp, yp, ipath, "Rook");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        String line1, line2, line3, line4, piq;
        for (int i = 100; i < 800; i += 100) {
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
