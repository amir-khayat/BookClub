package com.codingdojo.bookclub.controllers;

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
import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private UserService userService;

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {

		if (session.getAttribute("userID") == null) {
			return "redirect:/";
		}

		User thisUser = this.userService.findUserById((Long) session.getAttribute("userID"));
		model.addAttribute("user", thisUser);

		model.addAttribute("books", this.bookService.allBooks());

		return "dashboard.jsp";
	}

	@GetMapping("/create")
	public String renderCreate(HttpSession session, @ModelAttribute("book") Book book, Model model) {

		if (session.getAttribute("userID") == null) {
			return "redirect:/users";
		}

		User thisUser = this.userService.findUserById((Long) session.getAttribute("userID"));
		model.addAttribute("user", thisUser);

		return "create.jsp";
	}

	@PostMapping("/create/new")
	public String submitCreate(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model,
			HttpSession session) {

		if (result.hasErrors()) {
			User thisUser = this.userService.findUserById((Long) session.getAttribute("userID"));
			model.addAttribute("user", thisUser);
			model.addAttribute("bindingResult", result);
			return "create.jsp";
		}

		bookService.createOrUpdate(book);
		return "redirect:/dashboard";
	}

	@GetMapping("/show/{id}")
	public String viewBook(HttpSession session, @PathVariable("id") Long id, Model model) {
		if (session.getAttribute("userID") == null) {
			return "redirect:/users";
		}

		User thisUser = this.userService.findUserById((Long) session.getAttribute("userID"));
		model.addAttribute("user", thisUser);

		model.addAttribute("book", bookService.getByID(id));
		return "show.jsp";

	}

	@GetMapping("/edit/{id}")
	public String renderEdit(@PathVariable("id") Long id, @ModelAttribute("book") Book book, Model model,
			HttpSession session) {
		if (session.getAttribute("userID") == null) {
			return "redirect:/users";
		}

		User thisUser = this.userService.findUserById((Long) session.getAttribute("userID"));
		model.addAttribute("user", thisUser);

		model.addAttribute("book", bookService.getByID(id));

		return "edit.jsp";
	}

	@PutMapping("update/{id}")
	public String submitEdit(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model,
			HttpSession session) {
		if (result.hasErrors()) {
			User thisUser = this.userService.findUserById((Long) session.getAttribute("userID"));
			model.addAttribute("user", thisUser);
			model.addAttribute("bindingResult", result);
			return "edit.jsp";
		}

		bookService.createOrUpdate(book);
		return "redirect:/dashboard";
	}

	@DeleteMapping("/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookService.deleteBook(id);
		return "redirect:/dashboard";
	}

}