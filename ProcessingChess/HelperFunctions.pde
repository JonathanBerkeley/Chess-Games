//Helper functions
//Converts pixel coordinates to chess tile representation (e.g (x: 0, y: 0) = a8)
String getChessSquare(int x, int y) {
    String result = "";
    switch (x / SQUARE_SIZE) {
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

    switch (y / SQUARE_SIZE) {
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
