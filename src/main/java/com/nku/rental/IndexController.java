package com.nku.rental;

import java.security.Principal;
import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nku.model.User;
import com.nku.service.SecurityService;
import com.nku.service.UserService;
import com.nku.validator.UserValidator;

@Controller
public class IndexController {
	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	private ArrayList<User> users = new ArrayList<User>();
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("userForm", new User());
		return "index";
	}
	
	@GetMapping("/index")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Kullanýcý adý veya þifre hatalý girildi.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");
		model.addAttribute("userForm", new User());
		return "index";
	}

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}

	@PostMapping("/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "index";
		}

		userService.save(userForm);

		securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

		return "redirect:/admin";
	}
	
	@GetMapping("admin")
	public String dashboard(Model model, Principal principal) {
		model.addAttribute("username", principal.getName());
		return "admin";
	}

//	@RequestMapping(value = {"/", "/index" }, method = RequestMethod.GET)
//	public String welcome(Model model) {
//		return "index";
//	}

	/*
	 * @PostMapping(value = "register") public String
	 * register(@Valid @ModelAttribute("user") User user, BindingResult
	 * bindingResult, Model model) { if (bindingResult.hasErrors()) { String
	 * errObjName = bindingResult.getFieldError().getObjectName();
	 * 
	 * return "index"; } else { ArrayList<User> users = new ArrayList<User>(); User
	 * s = new User(); s.setEmail("a@s.d"); s.setPassword("123456");
	 * s.setUsername("erto"); users.add(user); users.add(s);
	 * 
	 * model.addAttribute("user", users);
	 * 
	 * return "admin"; } }
	 * 
	 * @PostMapping(value = "login") public String
	 * login(@Valid @ModelAttribute("user") User user, BindingResult bindingResult,
	 * Model model) { if (bindingResult.hasErrors()) { String errObjName =
	 * bindingResult.getFieldError().getObjectName();
	 * 
	 * return "index"; } else { User s = new User(); s.setEmail("a@s.d");
	 * s.setPassword("123456"); s.setUsername("erto"); users.add(user);
	 * users.add(s);
	 * 
	 * model.addAttribute("user", users);
	 * 
	 * return "redirect:/dashboard"; } }
	 * 
	 * @GetMapping(value = "dashboard") public String redirect(Model model) {
	 * model.addAttribute("user", users); return "admin"; }
	 */
}
