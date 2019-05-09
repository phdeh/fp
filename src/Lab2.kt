
fun main() {
    val set1 = chain(1, 2, 3, 4, 5)
    val set2 = chain(4, 5, 6, 7)
    intersections(set1, set2)?.print()
}

tailrec fun <T> belongs(element: T, set: Chain<T>): Boolean = when {
    (element == set.head) -> true
    (set.tail == null) -> false
    else -> belongs(element, set.tail)
}

tailrec fun <T> nextIntersection(set1: Chain<T>?, set2: Chain<T>): Pair<T?, Chain<T>?> = when {
    (set1 == null) ->
        Pair(null, null)
    (belongs(set1.head, set2)) ->
        Pair(set1.head, set1.tail)
    else -> nextIntersection(set1.tail, set2)
}

fun <T> intersections(set1: Chain<T>?, set2: Chain<T>): Chain<T>? = when {
    (nextIntersection(set1, set2).first != null) ->
        Chain<T>(nextIntersection(set1, set2).first!!,
            intersections(nextIntersection(set1, set2).second, set2))
    else -> null
}