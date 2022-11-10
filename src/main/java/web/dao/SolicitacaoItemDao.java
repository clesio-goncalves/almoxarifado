package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Solicitacao_item;

@Repository
public class SolicitacaoItemDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Long solicitacao_id, Long item_id, int qnt) {
		manager.createNativeQuery(
				"insert into Solicitacao_item (solicitacao_id, item_id, qnt) values (:solicitacao_id, :item_id, :qnt)")
				.setParameter("solicitacao_id", solicitacao_id).setParameter("item_id", item_id)
				.setParameter("qnt", qnt).executeUpdate();
	}

	public List<Solicitacao_item> buscaItensSolicitacaoPorSolicitacaoId(Long solicitacao_id) {
		return manager.createQuery("select s from Solicitacao_item s where s.solicitacao.id = :solicitacao_id",
				Solicitacao_item.class).setParameter("solicitacao_id", solicitacao_id).getResultList();
	}

}
