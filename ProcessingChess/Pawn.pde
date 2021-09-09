class Pawn extends Piece {

    Pawn(float xp, float yp, PImage ipath, boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Pawn");
    }
    
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
    void addSpecialMove(String move) {
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        String takeSquareL, takeSquareR, tmp;
        
        //If black pawn
        if (!this.isWhite) {
            tmp = getChessSquare(xPos, yPos + SQUARE_SIZE);
            //Check if the square is empty
            if (checkFreeAtSquare(tmp, false)) {
                legalMoves.add(tmp);
            }
            if (yPos == SQUARE_SIZE) {
                legalMoves.add(getChessSquare(xPos, yPos + SQUARE_SIZE * 2));
            }
            takeSquareL = getChessSquare(xPos - SQUARE_SIZE, yPos + SQUARE_SIZE);
            takeSquareR = getChessSquare(xPos + SQUARE_SIZE, yPos + SQUARE_SIZE);
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
            tmp = getChessSquare(xPos, yPos - SQUARE_SIZE);
            if (checkFreeAtSquare(tmp, true)) {
                legalMoves.add(tmp);
            }
            
            if (yPos == 600) {
                legalMoves.add(getChessSquare(xPos, yPos - SQUARE_SIZE * 2));
            }
            takeSquareL = getChessSquare(xPos - SQUARE_SIZE, yPos - SQUARE_SIZE);
            takeSquareR = getChessSquare(xPos + SQUARE_SIZE, yPos - SQUARE_SIZE);
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
