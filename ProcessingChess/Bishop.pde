class Bishop extends Piece {

    Bishop(float xp, float yp, PImage ipath, Boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Bishop");
    }
    
    Bishop(int xp, int yp, PImage ipath, Boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Bishop");
    }
    
    @Override
    void addSpecialMove(String move) {
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        boolean flag = false;
        String diagonal1, diagonal2, diagonal3, diagonal4, piq;
        //for (Piece pw : whitePieces) {
            //piq = getChessSquare(pw.xPos, pw.yPos);
            for (int i = (int)SQUARE_SIZE; i < (int)(SQUARE_SIZE * 8); i += (int)SQUARE_SIZE) {
                diagonal1 = getChessSquare(this.xPos + i, this.yPos + i);
                diagonal2 = getChessSquare(this.xPos - i, this.yPos + i);
                diagonal3 = getChessSquare(this.xPos - i, this.yPos - i);
                diagonal4 = getChessSquare(this.xPos + i, this.yPos - i);

                legalMoves.add(diagonal1);
                legalMoves.add(diagonal2);
                legalMoves.add(diagonal3);
                legalMoves.add(diagonal4);
                //If nothing blocking
                //if (piq.equals(diagonal1)) {
                    
                //}
            }
        //}

        return legalMoves;
    }
}
