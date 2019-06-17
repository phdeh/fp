fun main() {
    Lab3Vlad.main()
}

object Lab3Vlad {

    val most_positive_fixnum = Int.MAX_VALUE // most-positive-fixnum in CLisp

    val chain = chain(
        chain(0, 40, 0, 0, 18),
        chain(40, 0, 22, 6, 15),
        chain(0, 22, 0, 14, 0),
        chain(0, 6, 14, 0, 20),
        chain(18, 15, 0, 20, 0)
    )

    tailrec fun <T> lengthOf(chain: Chain<T>?, value: Int = 0): Int =
        when (chain) {
            null -> value
            else -> lengthOf(chain.tail, value + 1)
        }

    fun numbers(value: Int): IChain =
        when (value) {
            1 -> cons(value, null)
            else -> cons(value, numbers(value - 1))
        }

    tailrec fun <T> isInList(a: T, b: Chain<T>?): Boolean =
        if (b == null)
            false
        else if (a == b.head)
            true
        else
            isInList(a, b.tail)

    fun <T> notInList(a: Chain<T>?, b: Chain<T>?): Chain<T>? =
        if (a == null || b == null)
            null
        else if (isInList(a.head, b))
            notInList(a.tail, b)
        else
            cons(a.head, notInList(a.tail, b))

    fun comb(l: IChain?, a: IChain?, e: IChain?): Chain<IChain?>? =
        if (a == null && e != null)
            cons(null, comb(cons(e.head, null), e.tail, e.tail))
        else if (a != null && e != null)
            cons(l, comb(cons(e.head, l), a, e.tail))
        else if (a != null && e == null)
            cons(l, comb(cons(a.head, null), a.tail, a.tail))
        else
            null

    tailrec fun flow(a: IChain?, b: IChain?, c: CIChain, volume: Int = 0, a2: IChain? = a): Int =
        if (a != null && b != null)
            flow(a.tail, b, c, volume + (nth(a.head, nth(b.head, c)) ?: 0), a2)
        else if (a == null && b != null)
            flow(a2, b.tail, c, volume, a2)
        else
            volume

    fun minPositive(a: Int, b: Int): Int =
        if (a < b && a > 0) a
        else if (b < a && b > 0) b
        else a

    tailrec fun minFlow(a: CCIChain?, c: CIChain, min: Int = most_positive_fixnum): Int =
        when (a) {
            null -> min
            else -> minFlow(a.tail, c, minPositive(min, flow(a.head.head, a.head.tail?.head, c)))
        }

    fun middle(from: Int, to: Int, c: CIChain): IChain? =
        notInList(numbers(lengthOf(c)), cons(to, cons(from, null)))

    fun b(from: Int, to: Int, a: IChain?, c: CIChain): IChain? =
        notInList(middle(from, to, c), a)

    fun decorate(from: Int, to: Int, a: Chain<IChain?>?, c: CIChain): CCIChain? =
        if (a == null)
            null
        else if (a.head == null)
            cons(
                cons(cons(from, null), cons(cons(to, middle(from, to, c)), null)),
                decorate(from, to, a.tail, c)
            )
        else
            cons(
                cons(cons(from, a.head), cons(cons(to, b(from, to, a.head, c)), null)),
                decorate(from, to, a.tail, c)
            )

    fun addAllCuts(from: Int, to: Int, a: CCIChain?, c: CIChain, min: Int): CCIChain? =
        if (a == null)
            null
        else if (flow(a.head.head, a.head.tail?.head, c) == min)
            cons(a.head, addAllCuts(from, to, a.tail, c, min))
        else
            addAllCuts(from, to, a.tail, c, min)

    fun allCuts(from: Int, to: Int, c: CIChain) = addAllCuts(
        from, to, decorate(from, to, comb(null, null, middle(from, to, c)), c),
        c, minFlow(decorate(from, to, comb(null, null, middle(from, to, c)), c), c)
    )


    fun main() {
        val cuts = allCuts(1, 4, chain)
        println(cuts)
    }
}