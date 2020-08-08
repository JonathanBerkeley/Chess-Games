class Rook extends Piece {
    
    Rook(int xp, int yp, PImage ipath) {
        super(xp, yp, ipath, "Rook");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        return legalMoves;
    }
}
