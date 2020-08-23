//Globals
boolean unloaded = true;
boolean whitesTurn;
boolean chosePiece = false;

final boolean goFullscreen = false;
final int GAME_SIZE = 1;
final int PIECE_SIZE = 100 / GAME_SIZE;
final int SQUARE_SIZE = 100 / GAME_SIZE;
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

public ArrayList<Piece> whitePieces = new ArrayList<Piece>();
public ArrayList<Piece> blackPieces = new ArrayList<Piece>();

void settings() {
    if (goFullscreen) {
        fullScreen();
    } else {
        size(800 / GAME_SIZE, 800 / GAME_SIZE);
    }
}

void setup() {
    boolean standardConfig = true;
    if (standardConfig) {
        whitesTurn = true;
    }
    PImage tmpload, tmpload2;

    if (standardConfig) {
        //Load pieces
        bk = new King(400 / GAME_SIZE, 0, loadImage("pieces/black/bk.png"));
        bq = new Queen(300 / GAME_SIZE, 0, loadImage("pieces/black/bq.png"));
        blackPieces.add(bk);
        blackPieces.add(bq);

        wk = new King(400 / GAME_SIZE, 700 / GAME_SIZE, loadImage("pieces/white/wk.png"));
        wq = new Queen(300 / GAME_SIZE, 700 / GAME_SIZE, loadImage("pieces/white/wq.png"));
        whitePieces.add(wk);
        whitePieces.add(wq);

        tmpload = loadImage("pieces/black/bp.png");
        tmpload2 = loadImage("pieces/white/wp.png");
        int positionalIncrease = 0;
        for (int i = 0; i < 8; ++i) {
            bpawns[i] = new Pawn(positionalIncrease / GAME_SIZE, 100 / GAME_SIZE, tmpload, false);
            blackPieces.add(bpawns[i]);

            wpawns[i] = new Pawn(positionalIncrease / GAME_SIZE, 600 / GAME_SIZE, tmpload2, true);
            whitePieces.add(wpawns[i]);
            positionalIncrease += 100;
        }

        tmpload = loadImage("pieces/black/bb.png");
        tmpload2 = loadImage("pieces/white/wb.png");
        positionalIncrease = 200;
        for (int i = 0; i < 2; ++i) {
            bbishops[i] = new Bishop(positionalIncrease / GAME_SIZE, 0, tmpload);
            blackPieces.add(bbishops[i]);

            wbishops[i] = new Bishop(positionalIncrease / GAME_SIZE, 700 / GAME_SIZE, tmpload2);
            whitePieces.add(wbishops[i]);
            positionalIncrease += 300;
        }

        tmpload = loadImage("pieces/black/bn.png");
        tmpload2 = loadImage("pieces/white/wn.png");
        positionalIncrease = 100;
        for (int i = 0; i < 2; ++i) {
            bknights[i] = new Knight(positionalIncrease / GAME_SIZE, 0, tmpload);
            blackPieces.add(bknights[i]);

            wknights[i] = new Knight(positionalIncrease / GAME_SIZE, 700 / GAME_SIZE, tmpload2);
            whitePieces.add(wknights[i]);
            positionalIncrease += 500;
        }

        tmpload = loadImage("pieces/black/br.png");
        tmpload2 = loadImage("pieces/white/wr.png");
        positionalIncrease = 0;
        for (int i = 0; i < 2; ++i) {
            brooks[i] = new Rook(positionalIncrease / GAME_SIZE, 0, tmpload);
            blackPieces.add(brooks[i]);

            wrooks[i] = new Rook(positionalIncrease / GAME_SIZE, 700 / GAME_SIZE, tmpload2);
            whitePieces.add(wrooks[i]);
            positionalIncrease += 700;
        }
    }


    //Draw board
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

Piece clickedPiece;
void mousePressed() {
    //Saves what piece is clicked on
    String tileClicked = getChessSquare((mouseX / 100) * 100, (mouseY / 100) * 100);
    //println(mouseX, mouseY, tileClicked);
    
    if (whitesTurn) {
        for (Piece p : whitePieces) {
            if (getChessSquare(p.xPos, p.yPos).equals(tileClicked)) {
                println(p.name, tileClicked, p);
                println("Legal moves: ", p.getAllowedMoves());
                clickedPiece = p;
            }
        }
    } else {
        for (Piece p : blackPieces) {
            if (getChessSquare(p.xPos, p.yPos).equals(tileClicked)) {
                println(p.name, p.xPos, p.yPos, tileClicked);
                println("Legal moves: ", p.getAllowedMoves());
                clickedPiece = p;
            }
        }
    }
    if (clickedPiece != null && clickedPiece.getAllowedMoves().contains(tileClicked)) {
        println("Move", clickedPiece.name, getChessSquare(clickedPiece.xPos, clickedPiece.yPos), "to", tileClicked);

        //rerender piece to new square and redraw square on previous spot
        fill(get(clickedPiece.xPos, clickedPiece.yPos));
        rect(clickedPiece.xPos, clickedPiece.yPos, SQUARE_SIZE, SQUARE_SIZE);
        int[] tileClickedCoords = revertToCoords(tileClicked);
        image(clickedPiece.imgpath, tileClickedCoords[0] / GAME_SIZE, tileClickedCoords[1] / GAME_SIZE, PIECE_SIZE, PIECE_SIZE);

        //Set piece position to new position
        clickedPiece.xPos = tileClickedCoords[0] / GAME_SIZE;
        clickedPiece.yPos = tileClickedCoords[1] / GAME_SIZE;

        //cleanup
        clickedPiece = null;
        whitesTurn = !whitesTurn;
        
        //Following code runs after turn
        turnEnd();
    }
}
void turnEnd() {
    
}

void draw() {
}
