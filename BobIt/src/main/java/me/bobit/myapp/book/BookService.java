package me.bobit.myapp.book;

import java.util.List;



public interface BookService {

	List<Book> list(Pager pager);

	void add(Book item);

	Book item(Long bookid);

	void update(Book item);

	void delete(Long bookid);

	void dummy();

	void init();

}
