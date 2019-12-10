package com.example.demo;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HelloController {
	@Autowired
	private UserDAO userdao;
	@Autowired
	private TableDAO tabledao;
	@Autowired
	private EiljungDAO textdao;

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST }) // 로그인 페이지
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST }) // 회원가입페이지
	public String join() {
		return "join";
	}

	@RequestMapping(value = "/joinAction", method = { RequestMethod.GET, RequestMethod.POST }) // 회원가입 처리페이지
	public String joinAction() {
		return "joinAction";
	}

	@RequestMapping(value="/login_process",method={RequestMethod.GET,RequestMethod.POST}) // 로그인 처리페이지 																		
	public String login_process() {
		return "login_process";
	}

	@RequestMapping(value = "/choose", method = { RequestMethod.GET, RequestMethod.POST }) // 시간표, 일정달력 선택페이지
	public String choose(Model model) {
		List<User> userList = userdao.selectAll();  // <User>리스트를 model을 이용해 choose(달력, 시간표 선택) 페이지에서 사용 가능하게 함
		model.addAttribute("users", userList);
		return "choose";
	}

	@RequestMapping(value = "/hc_main", method = { RequestMethod.GET, RequestMethod.POST }) // 시간표 페이지
	public String hc_main(Model model) {
		List<Table> tableList = tabledao.selectAll();   // <Table>리스트를 model을 이용해 hc_main(시간표) 페이지에서 사용 가능하게 함
		model.addAttribute("tables", tableList);
		return "hc_main";
	}

	@RequestMapping(value = "/write", method = { RequestMethod.GET, RequestMethod.POST }) // 강좌등록 페이지
	public String write() {
		return "write";
	}

	@RequestMapping(value = "/writeAction", method = { RequestMethod.GET, RequestMethod.POST }) // 강좌등록 처리페이지
	public String writeAction() {
		return "writeAction";
	}

	@RequestMapping(value = "/calendar", method = { RequestMethod.GET, RequestMethod.POST }) // 달력 페이지
	public String calendar(Model model) {
		List<Eiljung> eiljungList = textdao.selectAll();   // <Eiljung>, <User> 리스트를 model을 이용해 calendar(달력) 페이지에서 사용 가능하게 함
		model.addAttribute("eiljungs", eiljungList);
		List<User> userList = userdao.selectAll();
		model.addAttribute("users", userList);
		return "calendar";
	}

	@RequestMapping(value = "/write2", method = { RequestMethod.GET, RequestMethod.POST }) // 일정등록 페이지
	public String write2(Model model) {
		List<Eiljung> eiljungList = textdao.selectAll();   // <Eiljung>리스트를 model을 이용해 write2(일정등록) 페이지에서 사용 가능하게 함
		model.addAttribute("eiljungs", eiljungList);
		return "write2";
	}

	@RequestMapping(value = "/writeAction2", method = { RequestMethod.GET, RequestMethod.POST }) // 일정등록 처리페이지
	public String writeAction2() {
		return "writeAction2";
	}

	@RequestMapping(value = "/deleteAction", method = { RequestMethod.GET, RequestMethod.POST }) // 일정삭제 처리페이지
	public String deleteAction() {
		return "deleteAction";
	}

	@RequestMapping(value = "/class_delete", method = { RequestMethod.GET, RequestMethod.POST }) // 강의삭제 페이지
	public String class_delete() {
		return "class_delete";
	}

	@RequestMapping(value = "/class_deleteAction", method = { RequestMethod.GET, RequestMethod.POST }) // 강의삭제 처리페이지
	public String class_deleteAction() {
		return "class_deleteAction";
	}

}
