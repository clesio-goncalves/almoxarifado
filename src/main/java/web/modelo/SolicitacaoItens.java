package web.modelo;

public class SolicitacaoItens {

	private long id_item;
	private String nome;
	private String marca;
	private int qnt;

	public long getId_item() {
		return id_item;
	}

	public void setId_item(long id_item) {
		this.id_item = id_item;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public int getQnt() {
		return qnt;
	}

	public void setQnt(int qnt) {
		this.qnt = qnt;
	}

}
