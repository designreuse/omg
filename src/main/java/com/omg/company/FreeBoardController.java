package com.omg.company;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.omg.dto.*;
import com.omg.service.*;

@Controller
@RequestMapping(value = "/freeboard")
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	private CommentsService commentsService;

	@RequestMapping(value = "/freewrite", method = RequestMethod.GET)
	public String inputform(HttpSession session) {
		return "pages/freeboard/freewrite";
	}

	@RequestMapping(value = "/freewrite", method = RequestMethod.POST)
	public String input(HttpSession session, FreeBoard input) {
		Employees emps = (Employees) session.getAttribute("user");
		input.setWriter(emps.getEmployeeId());
		freeBoardService.insertList(input);
		return "redirect:index/1";
	}

	@RequestMapping("/index")
	public String index(HttpSession session) {
		Employees user = (Employees) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login";
		}
		return "redirect:index/1";
	}

	// 페이지별로 글오는 것.
	@RequestMapping("/index/{page}")
	public String list(HttpSession session, Model model,
			@PathVariable("page") int page) {
		List<FreeBoard> list = freeBoardService.listBoard(page);
		List<FreeBoard> notices = freeBoardService.selectEmpName(list);
		int totalCount = freeBoardService.totalCount();
		model.addAttribute("freelist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		return "pages/freeboard/freeboard";
	}

	@RequestMapping("/selectListBoard/{page}")
	public String selectListBoard(HttpSession session, Model model,
			@PathVariable("page") int page, @RequestParam("title") String title) {
		List<FreeBoard> list = freeBoardService.selectListBoard(page, title);
		List<FreeBoard> notices = freeBoardService.selectEmpName(list);
		int totalCount = freeBoardService.totalCount();
		model.addAttribute("freelist", list);
		model.addAttribute("page", page);
		model.addAttribute("title", title);
		model.addAttribute("totalCount", totalCount);

		return "pages/freeboard/freeboard";
	}

	@RequestMapping(value = "/freedetail", method = RequestMethod.GET)
	public String detail(HttpSession session,
			@RequestParam("freeboardNum") int freeboardNum, Model model) {
		List<Comments> commentsList = commentsService
				.commentsList(freeboardNum);
		List<Comments> comments = commentsService.selectEmpName(commentsList);
		FreeBoard freeboard = freeBoardService.freeBoard(freeboardNum);
		if (freeboard != null) {
			freeBoardService.count(freeboardNum);
			model.addAttribute("freedetail", freeboard);
			model.addAttribute("commentslist", commentsList);
		}
		return "pages/freeboard/freedetail";
	}

	@RequestMapping(value = "/freedelete")
	public String delete(HttpSession session,
			@RequestParam("freeboardNum") int freeboardNum) {
		freeBoardService.delete(freeboardNum);
		return "redirect:index/1";
	}

	@RequestMapping(value = "/freeupdate", method = RequestMethod.GET)
	public String updateform(HttpSession session,
			@RequestParam("freeboardNum") int freeboardNum, Model model) {
		FreeBoard board = freeBoardService.freeBoard(freeboardNum);
		model.addAttribute("freeupdate", board);
		return "pages/freeboard/freeupdate";
	}

	@RequestMapping(value = "/freeupdate", method = RequestMethod.POST)
	public String update(HttpSession session, FreeBoard Board) {
		freeBoardService.update(Board);
		return "redirect:index/1";

	}

	@RequestMapping(value = "/commentswrite", method = RequestMethod.POST)
	public String commentInput(HttpSession session, Comments comments) {
		Employees emps = (Employees) session.getAttribute("user");
		comments.setCommentsWriter(emps.getEmployeeId());
		commentsService.insertComments(comments);
		return "redirect:freedetail?freeboardNum=" + comments.getFreeboardNum();
	}

	@RequestMapping(value = "/commentsdelete")
	public String commentDelete(HttpSession session,
			@RequestParam("commentsNum") int commentsNum,
			@RequestParam("freeboardNum") int freeboardNum) {
		commentsService.deleteComments(commentsNum);
		return "redirect:freedetail?freeboardNum=" + freeboardNum;
	}

}