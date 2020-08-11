class Queen extends Piece {
    
    Queen(int xp, int yp, PImage ipath) {
        super(xp, yp, ipath, "Queen");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        return legalMoves;
    }
}
