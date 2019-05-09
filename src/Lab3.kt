import java.lang.Math.*

fun main() {
    eightQueens()?.print()
}

fun badPosition(x1: Int, y1: Int, x2: Int, y2: Int) = when {
    (x1 == x2) -> true
    (y1 == y2) -> true
    (abs(x1 - x2) == abs(y1 - y2)) -> true
    (abs(x1 - x2) + abs(y1 - y2) == 3 && x1 - x2 != 0 && y1 - y2 != 0) -> true
    else -> false
}

tailrec fun checkPositions(x: Int, y: Int, chain: Chain<Chain<Int>>?): Boolean = when {
    (chain == null) -> true
    (badPosition(x, y, chain.head.head ?: 0, chain.head.tail?.head ?: 0)) -> false
    else -> checkPositions(x, y, chain.tail)
}

tailrec fun putQueen(x: Int, y: Int, chain: Chain<Chain<Int>>?): Chain<Chain<Int>>? {
    println("($x, $y) $chain")
    return when {
        (chain == null) -> putQueen(0, 1, Chain(Chain(x, Chain(y)), null))
        (y == 8) -> chain
        (x == 8) ->
            putQueen(chain.head.head + 1, chain.head.tail?.head ?: 0, chain.tail)
        (checkPositions(x, y, chain)) ->
            putQueen(0, y + 1, Chain(Chain(x, Chain(y)), chain))
        else ->
            putQueen(x + 1, y, chain)
    }
}

fun eightQueens() = putQueen(0, 0, null)