fun main() {
    Lab3Tigran.main()
}

object Lab3Tigran {

    const val Infty = Integer.MAX_VALUE

    val chain = chain(
        chain(0, Infty, Infty, 18),
        chain(40, 0, 22, 6, 15),
        chain(Infty, 22, 0, 14, Infty),
        chain(Infty, 6, 14, 0, 20),
        chain(18, 15, 20, 0)
    )

    val vertices = chain(0, 1, 2, 3, 4)

    tailrec fun vertexChain(vertex: Int, c: CIChain = chain): IChain =
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

    fun notInList(a: IChain?, b: IChain?): IChain? =
        if (a == null)
            null
        else if (b == null)
            a
        else if (isInList(a.head, b))
            notInList(a.tail, b)
        else
            cons(a.head, notInList(a.tail, b))

    tailrec fun <T> joinLists(a: Chain<T>?, b: Chain<T>?): Chain<T>? =
        if (a == null && b == null)
            null
        else if (a == null)
            b
        else if (b == null)
            a
        else joinLists(a.tail, cons(a.head, b))

    /*            1
                A — E
            2 /  \ 3 \
      W =    B   C   F
           1 | /     |
             D    —  G

        F(O, Q, R, P, D):
             Если {<O} \ O \ P = D):
                    F(<Q, Q>, R + O, P, D)

             Если {<O} \ O \ P ≠ 0:
                    F(O, Q, R, P + + <({<O} \ O \ P), D)

             Если {<O} \ O \ P = 0, P ≠ 0:
                    F(O, Q + [<P], R, P>, D)

             Если {<O} \ O \ P = 0, P = 0:
                    F(<Q, Q>, R, P, D)

             Если {<O} \ O \ P = 0, P = 0, Q = 0:
                    R


    Шаг 1.1.1.

        O = [A], Q = [], R = []
        A -> E, C, B
        P <= E

    Шаг 1.1.2.
        O = [A], Q = [], R = [], P = [E]
        A -> E', C, B
        P <= C

    Шаг 1.1.3.
        O = [A], Q = [], R = [], P = [E, C]
        A -> E', C', B
        P <= B

    Шаг 1.2.1.
        O = [A], Q = [], R = [], P = [E, C, B]
        A -> E', C', B'
        Q <= <E

    Шаг 1.2.2.
        O = [A], Q = [[A, E]], R = [], P = [C, B]
        Q <= <P

    Шаг 1.2.3.
        O = [A], Q = [[A, E], [A, C]], R = [], P = [B]
        Q <= <P

    Шаг 1.2.4.
        O = [A], Q = [[A, E], [A, C], [A, B]], R = [], P = []
        O <= <Q

    Шаг 2.

        O = [A, E], Q = [[A, B], [A, C]], R = []
        E -> A', F
        O <= O + [F]

    Шаг 3.

        O = [A, E, F], Q = [[A, B], [A, C]], R = []
        F -> E', G
        O <= O + [G]

    Шаг 4.

        O = [A, E, F, G], Q = [[A, B], [A, C]], R = []
        G -> F', D
        R <= O + [D], O <= <Q

    Шаг 5.

        O = [A, C], Q = [[A, B]], R = [[A, E, F, G, D]]
        C -> A', D
        R <= O + [D], O <= <Q

    Шаг 6.

        O = [A, B], Q = [], R = [[A, C, D], [A, E, F, G, D]]
        C -> A', D
        R <= O + [D], O <= <Q

    Шаг 7.

        O = [], Q = [], R = [[A, B, D], [A, C, D], [A, E, F, G, D]]
        return R.

     */

    fun main() {

    }

}