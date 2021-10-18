package com.kalyb.mvc.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kalyb.mvc.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long>{
    List<Book> findAll();
}