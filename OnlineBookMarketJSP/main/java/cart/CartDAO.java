package cart;

import java.util.List;

public interface CartDAO {

	int insert(CartItem item);

	CartItem select(int cartId, int memberNo);

	CartItem selectByBookId(int memberNo, int bookId);

	List<CartItem> selectAll(int memberNo);

	int update(int cartId, int memberNo, int quantity);

	int delete(int cartId, int memberNo);

	int deleteAll(int memberNo);

}
