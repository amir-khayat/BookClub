package com.codingdojo.bookclub.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepo;

@Service
public class BookService {

	@Autowired
	private BookRepo bookRepo;

	public List<Book> allBooks(){
		return bookRepo.findAll();
	}


	public Book getByID(Long id) {
		return this.bookRepo.findById(id).orElse(null);
	}

	public Book createOrUpdate(Book book) {
		return bookRepo.save(book);
	}

	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}

}
