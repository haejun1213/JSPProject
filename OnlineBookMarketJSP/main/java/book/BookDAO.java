package book;

import java.util.List;

public interface BookDAO {
	public int insertBook(Book book);
	public List<Book> selectAllBook();
	public Book selectBook(int no);
	public int updateBook(Book book);
	public int deleteBook(int no);

}
