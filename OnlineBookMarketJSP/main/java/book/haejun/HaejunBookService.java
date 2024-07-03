package book.haejun;

import java.util.List;

import book.Book;
import book.BookDAO;
import book.BookService;

public class HaejunBookService implements BookService {

	private BookDAO bookDao;

	public HaejunBookService(BookDAO bookDao) {
		this.bookDao = bookDao;
	}

	public boolean insert(Book book) {
		return 1 == bookDao.insertBook(book);
	}

	public Book read(int no) {
		return bookDao.selectBook(no);
	}

	public List<Book> listAll() {
		return bookDao.selectAllBook();
	}

	public boolean edit(Book book) {
		if (book == null)
			return false;
			return 1 == bookDao.updateBook(book);

	}

	public boolean remove(int no) {
		if (bookDao.selectBook(no) == null)
			return false;
		return 1 == bookDao.deleteBook(no);
	}
}
