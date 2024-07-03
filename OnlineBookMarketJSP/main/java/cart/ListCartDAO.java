package cart;

import java.util.LinkedList;
import java.util.List;

public class ListCartDAO implements CartDAO{
	
	static List<CartItem> itemList = new LinkedList<>();
	static int cart_seq = 0;
	
	@Override
	public int insert(CartItem item) {
		item.setId(++cart_seq);
		return itemList.add(item) ? 1 : 0;
	}

	@Override
	public CartItem select(int id, int memberNo) {
		for(CartItem item : itemList) {
			if(item.getId() == id)
				return item;
		}
		return null;
	}

	@Override
	public CartItem selectByBookId(int bookId, int memberNo) {
		for(CartItem item : itemList) {
			if(item.getBookId() == bookId && item.getMemberNo() == memberNo)
				return item;
		}
		return null;
	}

	@Override
	public List<CartItem> selectAll(int memberNo) {
		List<CartItem> resultList = new LinkedList<>();
		for(CartItem item : itemList) {
			if(item.getMemberNo() == memberNo)
				resultList.add(item);
				}
		return resultList;
	}

	@Override
	public int update(int cartId, int memberNo, int quantity) {
		int result = 0;
		
		CartItem item = select(cartId, memberNo);
		if(item != null) {
			item.setQuantity(quantity);
			result = 1;
		}
		return result;
	}

	@Override
	public int delete(int cartId, int memberNo) {
		int result = 0;
		if(select(cartId, memberNo) != null && itemList.remove(select(cartId, memberNo))) {
			result = 1;
		}
		return result;
	}


	
	@Override
	public int deleteAll(int memberNo) {
		
		int result = 0;
		for(CartItem item : itemList) {
			if(item.getMemberNo() == memberNo)
				itemList.removeIf(j -> j.getMemberNo() == memberNo);
				result++;
				}
		
		return result;
	}

}
