package br.com.onsmarttech.butler.models;

public enum TipoDocumento {

	IDENTIDADE("Identidade"), CARTEIRAMOTORISTA("Carteira de motorista"), CARTEIRATRABALHO("Cateira de trabalho");

	public String label;

	private TipoDocumento(String label) {
		this.label = label;
	}
}
