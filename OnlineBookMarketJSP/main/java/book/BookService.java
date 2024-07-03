package book;

import java.util.List;

public interface BookService {
	
	public boolean insert(Book book);
	
	public Book read(int no);
	
	public List<Book> listAll();
	
	public boolean edit(Book book);
	
	public boolean remove(int no);
}
