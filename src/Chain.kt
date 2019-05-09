import java.lang.IllegalStateException
import java.lang.StringBuilder

data class Chain<T>(
    val head: T,
    val tail: Chain<T>? = null
) {
    fun print() {
        println(toString())
    }

    override fun toString(): String {
        val sb = StringBuilder()
        var curr: Chain<T>? = this
        sb.append('(')
        while (curr != null) {
            val c = curr
            sb.append(c.head)
            curr = c.tail
            if (c.tail != null)
                sb.append(' ')
        }
        sb.append(')')
        return sb.toString()
    }

    operator fun get(index: Int): T? {
        var i = index
        var c = this as Chain<T>?
        while (i-- >= 1) c = c?.tail
        return c?.head
    }
}

fun <T> chain(vararg args: T): Chain<T> = chain(args.toList())

fun <T> chain(args: List<T>): Chain<T> = when {
    (args.size == 1) ->
        Chain(args[0], null)
    (args.size > 1) ->
        Chain<T>(
            args[0],
            chain(args.slice(1..(args.size - 1)))
        )
    else -> throw IllegalStateException()
}

fun<T> cons(head: T, tail: Chain<T>?): Chain<T> = Chain(head, tail)

fun<T> nth(index: Int, list: Chain<T>?): T? = run {
    if (list != null) list[index] else null
}

fun<A1, A2, R> lambda2arg(lambda: (A1, A2) -> R) = lambda