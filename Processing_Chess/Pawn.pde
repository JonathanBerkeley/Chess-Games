class Pawn extends Piece {
    
    Pawn(int xp, int yp, PImage ipath) {
        super(xp, yp, ipath, "Pawn");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        legalMoves.add("w");
        return legalMoves;
    }
}
