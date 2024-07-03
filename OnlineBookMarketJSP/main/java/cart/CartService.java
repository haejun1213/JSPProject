package cart;

import java.util.List;

public interface CartService {
	
	boolean add(CartItem item);
	List<CartItem> listAll(int memberNo);
	boolean update(int cartId, int memberNo, int quantity);
	boolean remove(int cartId, int memberNo);
	boolean clear(int memberNo);
	
	//List<CartItem> readByBookId(int bookId);
	//boolean removeByBookId(int bookId);
}
