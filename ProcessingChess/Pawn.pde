class Pawn extends Piece {

    Pawn(int xp, int yp, PImage ipath, boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Pawn");
    }
    
    boolean reachedEnd() {
        //TESTING
        if (this.yPos > SQUARE_SIZE * 6) {
            return true;
        }
        return false;
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        String takeSquareL, takeSquareR, tmp;
        
        //If black pawn
        if (!this.isWhite) {
            tmp = getChessSquare(xPos, yPos + 100);
            //Check if the square is empty
            if (checkFreeAtSquare(tmp, false)) {
                legalMoves.add(tmp);
            }
            if (yPos == 100) {
                legalMoves.add(getChessSquare(xPos, yPos + 200));
            }
            takeSquareL = getChessSquare(xPos - 100, yPos + 100);
            takeSquareR = getChessSquare(xPos + 100, yPos + 100);
            for (Piece p : whitePieces) {
                if (getChessSquare(p.xPos, p.yPos).equals(takeSquareL)) {
                    legalMoves.add(takeSquareL);
                } else if (getChessSquare(p.xPos, p.yPos).equals(takeSquareR)) {
                    legalMoves.add(takeSquareR);
                }
            }
        }
        //If white pawn
        else {
            tmp = getChessSquare(xPos, yPos - 100);
            if (checkFreeAtSquare(tmp, true)) {
                legalMoves.add(tmp);
            }
            
            if (yPos == 600) {
                legalMoves.add(getChessSquare(xPos, yPos - 200));
            }
            takeSquareL = getChessSquare(xPos - 100, yPos - 100);
            takeSquareR = getChessSquare(xPos + 100, yPos - 100);
            for (Piece p : blackPieces) {
                if (getChessSquare(p.xPos, p.yPos).equals(takeSquareL)) {
                    legalMoves.add(takeSquareL);
                } else if (getChessSquare(p.xPos, p.yPos).equals(takeSquareR)) {
                    legalMoves.add(takeSquareR);
                }
            }
        }
        return legalMoves;
    }
}
