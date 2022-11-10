package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Responsavel;

@Repository
public class ResponsavelDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Responsavel responsavel) {
		manager.persist(responsavel);
	}

	public void altera(Responsavel responsavel) {
		manager.merge(responsavel);
	}

	public List<Responsavel> lista() {
		return manager.createQuery("select c from Responsavel c order by c.id desc", Responsavel.class).getResultList();
	}

	public Responsavel buscarUltimoResponsavelCadastrado() {
		return manager.createQuery("select c from Responsavel c order by c.id desc", Responsavel.class)
				.getSingleResult();
	}

	public Responsavel buscaPorId(Long id) {
		return manager.find(Responsavel.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Responsavel c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
