class King extends Piece {
    
    King(int xp, int yp, PImage ipath) {
        super(xp, yp, ipath, "King");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        return legalMoves;
    }
}
