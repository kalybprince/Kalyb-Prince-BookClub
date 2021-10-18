package com.kalyb.mvc.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kalyb.mvc.models.Book;
import com.kalyb.mvc.services.BookService;
import com.kalyb.mvc.services.UserService;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/books/new")
    public String newBook(Model model, @ModelAttribute("book") Book book, HttpSession session) {
    	model.addAttribute("user", userService.getOne((Long) session.getAttribute("user_id")));
        return "new.jsp";
    }
    
    @PostMapping(value="/books")
    public String create(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
        	
            return "new.jsp";
        } else {
            bookService.save(book);
            
            return "redirect:/books/new";
        }
    }
    
	@GetMapping(value="/books")
	public String showAll(Model model) {
		List<Book> allBooks = bookService.allBooks();
		model.addAttribute("allBooks", allBooks);
		
		return "books.jsp";
	}
	
	@GetMapping(value="/books/{id}")
	public String show(Model model, @PathVariable("id") Long id, HttpSession session) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		model.addAttribute("user", userService.getOne((Long) session.getAttribute("user_id")));
		
		return "show.jsp";
	}
	
	@GetMapping("/books/{id}/edit")
	public String editDog(@ModelAttribute("book") Book book, @PathVariable("id") Long id, Model model) {
		model.addAttribute("book", bookService.findBook(id));
		
		return "edit_book.jsp";
	}
    
	@PutMapping("/books/{id}/update")
	public String updateDog(@Valid @ModelAttribute("book") Book book, BindingResult result, @PathVariable("id") Long id, Model model) {
		if (result.hasErrors()) {
			
			return "edit_book.jsp";
		} else {
			bookService.save(book);
			
			return "redirect:/books/" + id;
		}
	}
	
	@DeleteMapping("/books/{id}/delete")
	public String deleteBook(@PathVariable("id") Long id) {
		bookService.delete(id);
		
		return "redirect:/books";
	}
}