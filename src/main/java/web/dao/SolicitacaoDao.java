package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Solicitacao;

@Repository
public class SolicitacaoDao {

	@PersistenceContext
	private EntityManager manager;

	public Long adiciona(Solicitacao solicitacao) {
		manager.persist(solicitacao);
		return solicitacao.getId();
	}

	public void altera(Solicitacao solicitacao) {
		manager.merge(solicitacao);
	}

	public List<Solicitacao> lista() {
		return manager.createQuery("select c from Solicitacao c order by c.id desc", Solicitacao.class).getResultList();
	}

	public void aprovaSolicitacao(Long id, Long responsavel_id) {
		manager.createQuery(
				"UPDATE Solicitacao s SET s.status = 'Aprovado', s.responsavel.id = :responsavel_id WHERE s.id = :id")
				.setParameter("responsavel_id", responsavel_id).setParameter("id", id).executeUpdate();
	}

	public void rejeitaSolicitacao(Long id, Long responsavel_id) {
		manager.createQuery(
				"UPDATE Solicitacao s SET s.status = 'Rejeitado', s.responsavel.id = :responsavel_id WHERE s.id = :id")
				.setParameter("responsavel_id", responsavel_id).setParameter("id", id).executeUpdate();
	}

	public Solicitacao buscaPorId(Long id) {
		return manager.find(Solicitacao.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Solicitacao c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
