package web.controller;

import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.ResponsavelDao;
import web.modelo.Responsavel;

@Transactional
@Controller
@RequestMapping("/responsavel")
public class ResponsavelController {

	private List<Responsavel> lista_responsaveis;

	@Autowired
	ResponsavelDao dao;

	@RequestMapping("/novo")
	public String responsavel() {
		return "responsavel/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Responsavel responsavel, BindingResult result) {
		
		if (result.hasErrors()) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(responsavel);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_responsaveis = dao.lista();
		model.addAttribute("responsaveis", this.lista_responsaveis);
		return "responsavel/lista";
	}

	@RequestMapping("/remove")
	public String remove(Responsavel responsavel) {
		dao.remove(responsavel.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("responsavel", dao.buscaPorId(id));
		return "responsavel/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("responsavel", dao.buscaPorId(id));
		return "responsavel/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Responsavel responsavel, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:edita?id=" + responsavel.getId();
		}

		dao.altera(responsavel);
		return "redirect:lista";
	}
}