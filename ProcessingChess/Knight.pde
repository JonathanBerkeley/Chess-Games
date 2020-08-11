class Knight extends Piece {
    
    Knight(int xp, int yp, PImage ipath) {
        super(xp, yp, ipath, "Knight");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        return legalMoves;
    }
}
