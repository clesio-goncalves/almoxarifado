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

import web.dao.ItemDao;
import web.modelo.Item;

@Transactional
@Controller
@RequestMapping("/item")
public class ItemController {

	private List<Item> lista_itens;

	@Autowired
	ItemDao dao;

	@RequestMapping("/novo")
	public String item() {
		return "item/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Item item, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(item);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_itens = dao.lista();
		model.addAttribute("itens", this.lista_itens);
		return "item/lista";
	}

	@RequestMapping("/remove")
	public String remove(Item item) {
		dao.remove(item.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("item", dao.buscaPorId(id));
		return "item/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("item", dao.buscaPorId(id));
		return "item/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Item item, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:edita?id=" + item.getId();
		}

		dao.altera(item);
		return "redirect:lista";
	}
}
