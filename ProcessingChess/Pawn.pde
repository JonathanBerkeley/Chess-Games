class Pawn extends Piece {

    Pawn(int xp, int yp, PImage ipath, boolean isWhite) {
        super(xp, yp, ipath, isWhite, "Pawn");
    }

    @Override
        ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        //If black pawn
        if (!this.isWhite) {
            legalMoves.add(getChessSquare(xPos, yPos + 100));
            if (yPos == 100) {
                legalMoves.add(getChessSquare(xPos, yPos + 200));
            }
        } 
        //If white pawn
        else {
            legalMoves.add(getChessSquare(xPos, yPos - 100));
            if (yPos == 600) {
                legalMoves.add(getChessSquare(xPos, yPos - 200));
            }
        }
        return legalMoves;
    }
}
