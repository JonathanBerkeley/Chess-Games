class Bishop extends Piece {
    
    Bishop(int xp, int yp, PImage ipath) {
        super(xp, yp, ipath, "Bishop");
    }
    
    @Override
    ArrayList<String> getAllowedMoves() {
        ArrayList<String> legalMoves = new ArrayList<String>();
        return legalMoves;
    }

}
