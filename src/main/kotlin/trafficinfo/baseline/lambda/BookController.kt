package trafficinfo.baseline.lambda

import io.micronaut.http.annotation.Body
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.Post
import java.util.UUID
import javax.validation.Valid

@Controller("/")
open class BookController {

  var books: MutableList<BookSaved> = mutableListOf()

  init {
    val book = BookSaved()
    book.name = "A Road Less Traveled"
    book.isbn = UUID.randomUUID().toString()
    books.add(book)
  }

  @Get
  open fun index(): MutableList<BookSaved> {
    return books
  }

  @Post
  open fun save(@Valid @Body book: Book): BookSaved {
    val bookSaved = BookSaved()
    bookSaved.name = book.name
    bookSaved.isbn = UUID.randomUUID().toString()
    books.add(bookSaved)
    return bookSaved
  }
}
