package com.omg.company;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.omg.dto.Comments;
import com.omg.dto.Employees;
import com.omg.dto.FreeBoard;
import com.omg.dto.Notice;
import com.omg.service.CommentsService;
import com.omg.service.FreeBoardService;

@Controller
@RequestMapping(value="/freeboard")
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	private CommentsService commentsService;
	
	@RequestMapping(value="/freewrite", method=RequestMethod.GET)
	public String inputform(HttpSession session){
		
		//System.out.println("writeGet");
		
		return "pages/freeboard/freewrite";
	}
	
	@RequestMapping(value="/freewrite", method=RequestMethod.POST)
	public String input(HttpSession session, FreeBoard input){
		Employees emps = (Employees)session.getAttribute("user");
		input.setWriter(emps.getEmployeeId());
		int ret = freeBoardService.insertList(input);
		//System.out.println("writePost" + ret);
		return "redirect:index/1";
	}
	
	@RequestMapping("/index")
	public String index(HttpSession session){
		Employees user = (Employees)session.getAttribute("user");
		if(user == null){
			return "redirect:../../login";
		}
		return "redirect:index/1" ;
	}
	
	//페이지별로 글오는 것.
	@RequestMapping("/index/{page}")
	public String list(HttpSession session, Model model, @PathVariable("page") int page){		
		List<FreeBoard> list = freeBoardService.listBoard(page);
		List<FreeBoard> notices = freeBoardService.selectEmpName(list);
		int totalCount = freeBoardService.totalCount();
		model.addAttribute("freelist", list);
		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		//System.out.println(list.get(0).getCount());
		//System.out.println(totalCount);

		
		return "pages/freeboard/freeboard";
	}
	@RequestMapping("/selectListBoard/{page}")
	public String selectListBoard(HttpSession session, Model model, @PathVariable("page") int page, @RequestParam("title") String title){
		System.out.println(page);
		System.out.println(title);
		List<FreeBoard> list = freeBoardService.selectListBoard(page, title);
		List<FreeBoard> notices = freeBoardService.selectEmpName(list);
		System.out.println(list);
		int totalCount = freeBoardService.totalCount();
		model.addAttribute("freelist", list);
		model.addAttribute("page", page);
		model.addAttribute("title",title);
		model.addAttribute("totalCount", totalCount);
		//System.out.println(list.get(0).getCount());
		//System.out.println(totalCount);

		
		return "pages/freeboard/freeboard";
	}
	@RequestMapping(value="/freedetail", method=RequestMethod.GET)
	public String detail(HttpSession session, @RequestParam("freeboardNum") int freeboardNum, Model model/*, @PathVariable("page") int page*/){
		//List<Comments> commentsList = commentsService.commentsList(page);
		//List<Comments> commentsName = commentsService.selectEmpName(commentsList);
		//int totalCount = commentsService.commentsTotal();
		List<Comments> commentsList = commentsService.commentsList(freeboardNum);
		List<Comments> comments = commentsService.selectEmpName(commentsList);
/*for (Comments c : commentsList) {
	System.out.println(c.getCommentsWriter());
	System.out.println(c.getCommentsContent());
}*/
		FreeBoard freeboard = freeBoardService.freeBoard(freeboardNum);
		if(freeboard!=null){
		freeBoardService.count(freeboardNum);
		model.addAttribute("freedetail", freeboard);
		model.addAttribute("commentslist", commentsList);
		//model.addAttribute("page", page);
		//model.addAttribute("totalCount", totalCount);
		}
		//System.out.println(freeboardNum);
		return "pages/freeboard/freedetail";
	}
	@RequestMapping(value="/freedelete")
	public String delete(HttpSession session, @RequestParam("freeboardNum") int freeboardNum){
		//System.out.println(freeboardNum);
		int ret = freeBoardService.delete(freeboardNum);
		return "redirect:index/1";
	}
	
	@RequestMapping(value="/freeupdate", method=RequestMethod.GET)
	public String updateform(HttpSession session, @RequestParam("freeboardNum") int freeboardNum ,Model model){
		FreeBoard board = freeBoardService.freeBoard(freeboardNum);
		model.addAttribute("freeupdate", board);
		
		return "pages/freeboard/freeupdate";
	}
	
	@RequestMapping(value="/freeupdate", method=RequestMethod.POST)
	public String update(HttpSession session, FreeBoard Board){
		System.out.println(Board.getFreeboardNum());
//		System.out.println("update"+Board.getTitle());
		int ret = freeBoardService.update(Board);
//		System.out.println("updatePost" + ret);
		return "redirect:index/1";
		
	}
	
	@RequestMapping(value="/commentswrite", method=RequestMethod.POST)
	public String commentInput(HttpSession session, Comments comments){
		Employees emps = (Employees)session.getAttribute("user");
		comments.setCommentsWriter(emps.getEmployeeId());
		int ret = commentsService.insertComments(comments);
		//System.out.println("writePost" + ret);
		return "redirect:freedetail?freeboardNum="+comments.getFreeboardNum();
	}
	@RequestMapping(value="/commentsdelete")
	public String commentDelete(HttpSession session, @RequestParam("commentsNum") int commentsNum, @RequestParam("freeboardNum") int freeboardNum){
		//System.out.println(commentsNum);
		int ret = commentsService.deleteComments(commentsNum);
		return "redirect:freedetail?freeboardNum="+freeboardNum;
		//return "redirect:freedetail?freeboardNum="+comments.getFreeboardNum();
	}
	
}