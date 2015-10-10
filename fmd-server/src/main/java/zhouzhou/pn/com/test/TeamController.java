package zhouzhou.pn.com.test;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeamController {

	@Autowired
	private TeamService teamService;

	@RequestMapping(value = "/team/add")
	public ModelAndView addTeamPage() {
		ModelAndView modelAndView = new ModelAndView("add");
		modelAndView.addObject("team", new Team());
		return modelAndView;
	}
	@RequestMapping(value = "/team/add2")
	public String addTeamPage2(HttpServletRequest request,@ModelAttribute("team") Team team) {
		System.out.println("name:"+request.getParameter("name"));
		System.out.println("team.getName():"+team.getName());
//		Team team = new Team();
//		team.setName(request.getParameter("name"));
//		team.setRating(1);
		teamService.addTeam(team);
		return "//list";
	}
	@RequestMapping(value = "/team/add/process")
	public String addingTeam(@ModelAttribute Team team) {
		System.out.println("team:"+team.getName());
		ModelAndView modelAndView = new ModelAndView("list");
		teamService.addTeam(team);

		String message = "Team was successfully added.";
		modelAndView.addObject("message", message);

		return "//team//list.im";
	}

	@RequestMapping(value = "/team/list")
	public ModelAndView listOfTeams() {
		ModelAndView modelAndView = new ModelAndView("list");

		List teams = teamService.getTeams();
		modelAndView.addObject("teams", teams);

		return modelAndView;
	}

	@RequestMapping(value = "/team/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editTeamPage(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("edit-team-form");
		Team team = teamService.getTeam(id);
		modelAndView.addObject("team", team);
		return modelAndView;
	}

	@RequestMapping(value = "/team/edit/{id}", method = RequestMethod.POST)
	public ModelAndView edditingTeam(@ModelAttribute Team team, @PathVariable Integer id) {

		ModelAndView modelAndView = new ModelAndView("home");

		teamService.updateTeam(team);

		String message = "Team was successfully edited.";
		modelAndView.addObject("message", message);

		return modelAndView;
	}

	@RequestMapping(value = "/team/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteTeam(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("home");
		teamService.deleteTeam(id);
		String message = "Team was successfully deleted.";
		modelAndView.addObject("message", message);
		return modelAndView;
	}

}