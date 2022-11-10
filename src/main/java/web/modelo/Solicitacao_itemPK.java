package web.modelo;

import java.io.Serializable;

public class Solicitacao_itemPK implements Serializable {

	private Long solicitacao;

	private Long item;

	private int qnt;

	public Solicitacao_itemPK(Long solicitacao, Long item, int qnt) {
		super();
		this.solicitacao = solicitacao;
		this.item = item;
		this.qnt = qnt;
	}

	public Solicitacao_itemPK() {
	}

	public Long getSolicitacao() {
		return solicitacao;
	}

	public void setSolicitacao(Long solicitacao) {
		this.solicitacao = solicitacao;
	}

	public Long getItem() {
		return item;
	}

	public void setItem(Long item) {
		this.item = item;
	}

	public int getQnt() {
		return qnt;
	}

	public void setQnt(int qnt) {
		this.qnt = qnt;
	}

}
