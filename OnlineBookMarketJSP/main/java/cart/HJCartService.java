package cart;

import java.util.List;

public class HJCartService implements CartService{
	
	CartDAO cartDao;

	public HJCartService(CartDAO cartDao) {
		this.cartDao = cartDao;
	}
	
	@Override
	public boolean add(CartItem item) {
		if(item == null) return false;
		
		int result = 0;
		
		CartItem inItem = cartDao.selectByBookId(item.getMemberNo(), item.getBookId());
		if(inItem == null) {
			result = cartDao.insert(item);
		} else {
			result = cartDao.update(inItem.getId(), item.getMemberNo(), item.getQuantity() + inItem.getQuantity());
		}
		return result == 1;
	}

	@Override
	public List<CartItem> listAll(int memberNo) {
		return cartDao.selectAll(memberNo);
	}

	@Override
	public boolean update(int id, int memberNo, int quantity) {
		return cartDao.update(id, memberNo, quantity) == 1;
	}

	@Override
	public boolean remove(int id, int memberNo) {
		return cartDao.delete(id, memberNo) == 1;
	}

	public boolean clear(int memberNo) {
		int result = cartDao.deleteAll(memberNo);
		return result > 0;
	}
}
