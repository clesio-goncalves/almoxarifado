package web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.ItemDao;
import web.dao.ResponsavelDao;
import web.dao.ServidorDao;
import web.dao.SolicitacaoDao;
import web.dao.SolicitacaoItemDao;
import web.modelo.Item;
import web.modelo.Responsavel;
import web.modelo.Servidor;
import web.modelo.Solicitacao;
import web.modelo.SolicitacaoItens;
import web.modelo.Solicitacao_item;

@Transactional
@Controller
@RequestMapping("/solicitacao")
public class SolicitacaoController {

	private SolicitacaoItens itens_qnt;
	private Servidor servidor;
	private Responsavel responsavel;
	private Item item;
	private int nova_qnt;
	private List<Solicitacao> lista_solicitacoes;
	private List<Item> lista_itens;
	private List<SolicitacaoItens> lista_itens_qnt;
	private List<Solicitacao_item> lista_solicitacao_itens;

	@Autowired
	SolicitacaoDao dao;

	@Autowired
	ServidorDao dao_servidor;

	@Autowired
	ResponsavelDao dao_responsavel;

	@Autowired
	ItemDao dao_item;

	@Autowired
	SolicitacaoItemDao dao_solicitacao_item;

	@RequestMapping("/novo")
	public String solicitacao(Model model) {
		this.lista_itens = dao_item.lista();
		model.addAttribute("itens", this.lista_itens);
		return "solicitacao/novo";
	}

	@RequestMapping(value = "/adiciona_itens", method = RequestMethod.POST)
	public String adicionaItens(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		this.lista_itens = dao_item.lista();
		this.lista_itens_qnt = new ArrayList<SolicitacaoItens>();

		for (Item item : this.lista_itens) {
			if (!request.getParameter(item.getId() + "_qnt").equals("")) {
				this.itens_qnt = new SolicitacaoItens();
				this.itens_qnt.setId_item(item.getId());
				this.itens_qnt.setNome(item.getNome());
				this.itens_qnt.setMarca(item.getMarca());
				this.itens_qnt.setQnt(Integer.parseInt(request.getParameter(item.getId() + "_qnt")));
				this.lista_itens_qnt.add(this.itens_qnt);
			}
		}

		model.addAttribute("itens", this.lista_itens_qnt);
		return "solicitacao/confirmacao";
	}

	@RequestMapping("/adiciona")
	public String adiciona() {

		// Pega o último servidor cadastrado
		this.servidor = dao_servidor.buscarUltimoServidorCadastrado();

		// Adiciona a Solicitação
		Solicitacao solicitacao = new Solicitacao();
		solicitacao.setData(new Date());
		solicitacao.setHorario(new Date());
		solicitacao.setStatus("Solicitado");
		solicitacao.setServidor(this.servidor);
		Long solicitacao_id = dao.adiciona(solicitacao);

		// Adiciona os itens de Solicitacao_item
		for (SolicitacaoItens item : this.lista_itens_qnt) {
			this.dao_solicitacao_item.adiciona(solicitacao_id, item.getId_item(), item.getQnt());
		}

		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_solicitacoes = dao.lista();
		model.addAttribute("solicitacoes", this.lista_solicitacoes);
		return "solicitacao/lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("solicitacao", dao.buscaPorId(id));
		model.addAttribute("itens_solicitacao", dao_solicitacao_item.buscaItensSolicitacaoPorSolicitacaoId(id));
		return "solicitacao/exibe";
	}

	@RequestMapping("/aprovar")
	public String aprovar(Long id, Model model) {

		if (dao.buscaPorId(id).getStatus().equals("Solicitado")) {

			// Lista de itens da solicitação
			this.lista_solicitacao_itens = dao_solicitacao_item.buscaItensSolicitacaoPorSolicitacaoId(id);

			// Altera a quantidade de todos os itens da Solicitação
			for (Solicitacao_item solicitacao_item : this.lista_solicitacao_itens) {
				this.item = dao_item.buscaPorId(solicitacao_item.getItem().getId());
				this.nova_qnt = this.item.getQnt() - solicitacao_item.getQnt();
				dao_item.atualizaQnt(this.item.getId(), this.nova_qnt);
			}

			// Pega o último responsável cadastrado
			this.responsavel = dao_responsavel.buscarUltimoResponsavelCadastrado();

			// Alterar o Status da Solicitação para Aprovado
			dao.aprovaSolicitacao(id, this.responsavel.getId());

		}

		return "redirect:exibe?id=" + id;
	}

	@RequestMapping("/rejeitar")
	public String rejeitar(Long id, Model model) {

		if (dao.buscaPorId(id).getStatus().equals("Solicitado")) {
			// Pega o último responsável cadastrado
			this.responsavel = dao_responsavel.buscarUltimoResponsavelCadastrado();

			// Alterar o Status da Solicitação para Aprovado
			dao.rejeitaSolicitacao(id, this.responsavel.getId());
		}

		return "redirect:exibe?id=" + id;
	}
}
