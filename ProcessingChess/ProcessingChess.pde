//Globals
final boolean DEV_BOOL = false;
boolean unloaded = true;
boolean whitesTurn;
boolean chosePiece = false;

final int PIECE_SIZE = 100;
final int SQUARE_SIZE = 100;
final color W_TILE = color(245);
final color B_TILE = color(75);

King bk, wk;
Queen bq, wq;
Bishop bbishops[] = new Bishop[2];
Bishop wbishops[] = new Bishop[2];
Knight bknights[] = new Knight[2];
Knight wknights[] = new Knight[2];
Rook brooks[] = new Rook[2];
Rook wrooks[] = new Rook[2];
Pawn bpawns[] = new Pawn[8];
Pawn wpawns[] = new Pawn[8];

ArrayList<Piece> whitePieces = new ArrayList<Piece>();
ArrayList<Piece> blackPieces = new ArrayList<Piece>();

void setup() {
    boolean standardConfig = true;
    if (standardConfig) {
        whitesTurn = true;
    }
    PImage tmpload, tmpload2;

    if (standardConfig) {
        //Load pieces
        bk = new King(400, 0, loadImage("pieces/black/bk.png"));
        bq = new Queen(300, 0, loadImage("pieces/black/bq.png"));
        blackPieces.add(bk);
        blackPieces.add(bq);

        wk = new King(400, 700, loadImage("pieces/white/wk.png"));
        wq = new Queen(300, 700, loadImage("pieces/white/wq.png"));
        whitePieces.add(wk);
        whitePieces.add(wq);

        tmpload = loadImage("pieces/black/bp.png");
        tmpload2 = loadImage("pieces/white/wp.png");
        int positionalIncrease = 0;
        for (int i = 0; i < 8; ++i) {
            bpawns[i] = new Pawn(positionalIncrease, 100, tmpload, false);
            blackPieces.add(bpawns[i]);

            wpawns[i] = new Pawn(positionalIncrease, 600, tmpload2, true);
            whitePieces.add(wpawns[i]);
            positionalIncrease += 100;
        }

        tmpload = loadImage("pieces/black/bb.png");
        tmpload2 = loadImage("pieces/white/wb.png");
        positionalIncrease = 200;
        for (int i = 0; i < 2; ++i) {
            bbishops[i] = new Bishop(positionalIncrease, 0, tmpload);
            blackPieces.add(bbishops[i]);

            wbishops[i] = new Bishop(positionalIncrease, 700, tmpload2);
            whitePieces.add(wbishops[i]);
            positionalIncrease += 300;
        }

        tmpload = loadImage("pieces/black/bn.png");
        tmpload2 = loadImage("pieces/white/wn.png");
        positionalIncrease = 100;
        for (int i = 0; i < 2; ++i) {
            bknights[i] = new Knight(positionalIncrease, 0, tmpload);
            blackPieces.add(bknights[i]);

            wknights[i] = new Knight(positionalIncrease, 700, tmpload2);
            whitePieces.add(wknights[i]);
            positionalIncrease += 500;
        }

        tmpload = loadImage("pieces/black/br.png");
        tmpload2 = loadImage("pieces/white/wr.png");
        positionalIncrease = 0;
        for (int i = 0; i < 2; ++i) {
            brooks[i] = new Rook(positionalIncrease, 0, tmpload);
            blackPieces.add(brooks[i]);

            wrooks[i] = new Rook(positionalIncrease, 700, tmpload2);
            whitePieces.add(wrooks[i]);
            positionalIncrease += 700;
        }
    }


    //Draw board
    size(800, 800);
    noStroke();
    fill(W_TILE);

    //White squares
    boolean whiteNext = true;
    int spacingx, spacingy;
    spacingx = 0;
    spacingy = 0;

    for (int z = 0; z < 8; ++z) {
        for (int i = 0; i < 4; ++i) {
            rect(spacingx, spacingy, SQUARE_SIZE, SQUARE_SIZE);
            spacingx += SQUARE_SIZE * 2;
        }
        spacingy += SQUARE_SIZE;
        if (whiteNext) {
            spacingx = SQUARE_SIZE;
        } else {
            spacingx = 0;
        }
        whiteNext = !whiteNext;
    }

    //Black squares
    fill(B_TILE);
    spacingx = SQUARE_SIZE;
    spacingy = 0;
    for (int z = 0; z < 8; ++z) {
        for (int i = 0; i < 4; ++i) {
            rect(spacingx, spacingy, SQUARE_SIZE, SQUARE_SIZE);
            spacingx += SQUARE_SIZE * 2;
        }
        spacingy += SQUARE_SIZE;
        if (whiteNext) {
            spacingx = 0;
        } else {
            spacingx = SQUARE_SIZE;
        }
        whiteNext = !whiteNext;
    }

    //Puts the pieces into their beginning places
    if (unloaded && standardConfig) {
        //Standard config setup for chess

        //King & Queen
        image(bk.imgpath, bk.xPos, bk.yPos, PIECE_SIZE, PIECE_SIZE);
        image(bq.imgpath, bq.xPos, bq.yPos, PIECE_SIZE, PIECE_SIZE);

        image(wk.imgpath, wk.xPos, wk.yPos, PIECE_SIZE, PIECE_SIZE);
        image(wq.imgpath, wq.xPos, wq.yPos, PIECE_SIZE, PIECE_SIZE);

        //Pawns
        for (int i = 0; i < bpawns.length; ++i) {
            image(bpawns[i].imgpath, bpawns[i].xPos, bpawns[i].yPos, PIECE_SIZE, PIECE_SIZE);

            image(wpawns[i].imgpath, wpawns[i].xPos, wpawns[i].yPos, PIECE_SIZE, PIECE_SIZE);
        }

        //Bishops, rooks & knights
        for (int i = 0; i < 2; ++i) {
            image(bbishops[i].imgpath, bbishops[i].xPos, bbishops[i].yPos, PIECE_SIZE, PIECE_SIZE);
            image(bknights[i].imgpath, bknights[i].xPos, bknights[i].yPos, PIECE_SIZE, PIECE_SIZE);
            image(brooks[i].imgpath, brooks[i].xPos, brooks[i].yPos, PIECE_SIZE, PIECE_SIZE);

            image(wbishops[i].imgpath, bbishops[i].xPos, wbishops[i].yPos, PIECE_SIZE, PIECE_SIZE);
            image(wknights[i].imgpath, wknights[i].xPos, wknights[i].yPos, PIECE_SIZE, PIECE_SIZE);
            image(wrooks[i].imgpath, wrooks[i].xPos, wrooks[i].yPos, PIECE_SIZE, PIECE_SIZE);
        }
        unloaded = !unloaded;
    }
    println("Finished setting up");
}

boolean clickedPiece = false;
void mousePressed() {
    //Saves what piece is clicked on
    String tileClicked = getChessSquare((mouseX / 100) * 100, (mouseY / 100) * 100);


    if (whitesTurn) {
        for (Piece p : whitePieces) {
            if (getChessSquare(p.xPos, p.yPos).equals(tileClicked)) {
                println(p.name, tileClicked);
                println("Legal moves: ", p.getAllowedMoves());
                clickedPiece = true;
            } else if (clickedPiece && p.getAllowedMoves().contains(tileClicked)) {
                println("Move", p.name, getChessSquare(p.xPos, p.yPos), "to", tileClicked);

                //rerender piece to new square and redraw square on previous spot
                fill(get(p.xPos, p.yPos));
                rect(p.xPos, p.yPos, SQUARE_SIZE, SQUARE_SIZE);
                int[] tileClickedCoords = revertToCoords(tileClicked);
                image(p.imgpath, tileClickedCoords[0], tileClickedCoords[1], PIECE_SIZE, PIECE_SIZE);

                //cleanup
                clickedPiece = false;
                whitesTurn = false;
            }
        }
    } else {
        for (Piece p : blackPieces) {
            if (getChessSquare(p.xPos, p.yPos).equals(tileClicked)) {
                println(p.name, p.xPos, p.yPos, tileClicked);
                println("Legal moves: ", p.getAllowedMoves());
                clickedPiece = true;
            } else if (clickedPiece && p.getAllowedMoves().contains(tileClicked)) {
                println("Move", p.name, getChessSquare(p.xPos, p.yPos), "to", tileClicked);

                //rerender piece to new square and redraw square on previous spot
                fill(get(p.xPos, p.yPos));
                rect(p.xPos, p.yPos, SQUARE_SIZE, SQUARE_SIZE);
                int[] tileClickedCoords = revertToCoords(tileClicked);
                image(p.imgpath, tileClickedCoords[0], tileClickedCoords[1], PIECE_SIZE, PIECE_SIZE);

                //cleanup
                clickedPiece = false;
                whitesTurn = true;
            }
        }
    }
}

void draw() {
    if (DEV_BOOL) {
        fill(B_TILE);
        rect(100, 0, SQUARE_SIZE, SQUARE_SIZE);
    }
}
