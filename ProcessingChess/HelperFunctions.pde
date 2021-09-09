//Helper functions

//Converts pixel coordinates to chess tile representation (e.g (x: 0, y: 0) = a8)
String getChessSquare(int x, int y) {
    String result = "";
    switch ((int)(x / SQUARE_SIZE)) {
        case 0:
            result += 'a';
            break;
        case 1:
            result += 'b';
            break;
        case 2:
            result += 'c';
            break;
        case 3:
            result += 'd';
            break;
        case 4:
            result += 'e';
            break;
        case 5:
            result += 'f';
            break;
        case 6:
            result += 'g';
            break;
        case 7:
            result += 'h';
            break;
        default:
            break;
    }

    switch ((int)(y / SQUARE_SIZE)) {
        case 0:
            result += '8';
            break;
        case 1:
            result += '7';
            break;
        case 2:
            result += '6';
            break;
        case 3:
            result += '5';
            break;
        case 4:
            result += '4';
            break;
        case 5:
            result += '3';
            break;
        case 6:
            result += '2';
            break;
        case 7:
            result += '1';
            break;
        default:
            break;
    }
    return result;
}

String getChessSquare(float x, float y) {
    return getChessSquare((int)x, (int)y);
}

//Converts chess tile coordinates back to screen coords (e.g  a8 = (0, 0))
int[] revertToCoords(String chessSquare) {
    int coords[] = new int[2];
    switch (chessSquare.substring(0, 1)) {
        case "a":
            coords[0] = 0;
            break;
        case "b":
            coords[0] = (int)SQUARE_SIZE;
            break;
        case "c":
            coords[0] = (int)(SQUARE_SIZE * 2);
            break;
        case "d":
            coords[0] = (int)(SQUARE_SIZE * 3);
            break;
        case "e":
            coords[0] = (int)(SQUARE_SIZE * 4);
            break;
        case "f":
            coords[0] = (int)(SQUARE_SIZE * 5);
            break;
        case "g":
            coords[0] = (int)(SQUARE_SIZE * 6);
            break;
        case "h":
            coords[0] = (int)(SQUARE_SIZE * 7);
            break;
        default:
            break;
    }

    switch (chessSquare.substring(1)) {
        case "1":
            coords[1] = (int)(SQUARE_SIZE * 7);
            break;
        case "2":
            coords[1] = (int)(SQUARE_SIZE * 6);
            break;
        case "3":
            coords[1] = (int)(SQUARE_SIZE * 5);
            break;
        case "4":
            coords[1] = (int)(SQUARE_SIZE * 4);
            break;
        case "5":
            coords[1] = (int)(SQUARE_SIZE * 3);
            break;
        case "6":
            coords[1] = (int)(SQUARE_SIZE * 2);
            break;
        case "7":
            coords[1] = (int)SQUARE_SIZE;
            break;
        case "8":
            coords[1] = 0;
            break;
        default:
            break;
    }
    return coords;
}

//Checks if square at given position is free of a team (returns true if empty square or ally)
Boolean checkFreeAtSquare(String square, Boolean isWhitePiece) {
    Boolean answer = true;
    if (isWhitePiece) {
        for (Piece bp : blackPieces) {
            if (getChessSquare(bp.xPos, bp.yPos).equals(square)) {
                answer = false;
            }
        }
        
    } else {
        for (Piece wp : whitePieces) {
            if (getChessSquare(wp.xPos, wp.yPos).equals(square)) {
                answer = false;
            }
        }
    }
    return answer;
}

// Debug & dev functions
void cp(String msg) {
    println(msg);
}

void cp(String tag, Object msg) {
    println(tag + ": " + msg);
}

void cp(ArrayList<String> msgs) {
    for(String m : msgs) {
        println(m);
    }
}
