package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import web.modelo.Item;

@Repository
public class ItemDao {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Item item) {
		manager.persist(item);
	}

	public void altera(Item item) {
		manager.merge(item);
	}

	public List<Item> lista() {
		return manager.createQuery("select c from Item c order by c.id desc", Item.class).getResultList();
	}

	public void atualizaQnt(Long id, int nova_qnt) {
		manager.createQuery("UPDATE Item i SET i.qnt = :nova_qnt WHERE i.id = :id").setParameter("nova_qnt", nova_qnt)
				.setParameter("id", id).executeUpdate();
	}

	public Item buscaPorId(Long id) {
		return manager.find(Item.class, id);
	}

	public void remove(Long id) {
		manager.createQuery("delete from Item c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}
