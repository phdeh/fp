
const val Infty = Integer.MAX_VALUE

val chain = chain(
    chain(0, Infty, Infty, 18),
    chain(40, 0, 22, 6, 15),
    chain(Infty, 22, 0, 14, Infty),
    chain(Infty, 6, 14, 0, 20),
    chain(18, 15, 20, 0)
)

val vertices = chain(0, 1, 2, 3, 4)

fun main() {

}

tailrec fun vertexChain(vertex: Int, c: Chain<IChain> = chain): IChain =
    if (vertex > 0 && c.tail != null)
        vertexChain(vertex - 1, c.tail)
    else
        c.head

fun attaches(c: IChain?, index: Int = 0): IChain? =
    if (c == null)
        null
    else if (c.head != Infty)
        cons(index, attaches(c.tail, index + 1))
    else
        attaches(c.tail, index + 1)

tailrec fun isInList(a: Int, b: IChain?): Boolean =
    if (b == null)
        false
    else if (a == b.head)
        true
    else
        isInList(a, b.tail)

fun notInList(a: IChain?, b: IChain): IChain? =
    if (a == null)
        null
    else if (isInList(a.head, b))
        notInList(a.tail, b)
    else
        cons(a.head, notInList(a.tail, b))

fun depthFirst(from: Int, to: Int, c: IChain? = vertices, x: IChain? = null): Chain<IChain>? =
        if (to == from)
            cons(cons(from, null), null)
        else if (c != null)
            depthFirst(from, to, c.tail, cons(c.head, x))
        else
            null