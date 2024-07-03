package book;

public class Book {

	private int no;
	private String title;
	private String author;
	private String publisher;
	private int price;
	private int inventory;

	public Book(int no, String title, String author, String publisher, int price, int inventory) {
		this.no = no;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.inventory = inventory;
	}
	
	public Book(String title, String author, String publisher, int price, int inventory) {
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.inventory = inventory;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	@Override
	public String toString() {
		return "Book [no=" + no + ", title=" + title + ", author=" + author + ", publisher="
				+ publisher + ", price=" + price + ", regdate=" + inventory + "]";
	}

}
