package com.kalyb.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kalyb.mvc.models.Book;
import com.kalyb.mvc.repos.BookRepository;

@Service
public class BookService {
	@Autowired
    private BookRepository bookRepository;

    public List<Book> allBooks() {
        return bookRepository.findAll();
    }

    public Book save(Book b) {
        return bookRepository.save(b);
    }

    public Book findBook(Long id) {
        Optional<Book> optionalBook = bookRepository.findById(id);
        
        if(optionalBook.isPresent()) {
            return optionalBook.get();
        } else {
            return null;
        }
    }
    
	public void delete(Long id) {
		bookRepository.deleteById(id);
	}
}