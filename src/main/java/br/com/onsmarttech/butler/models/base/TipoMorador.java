package br.com.onsmarttech.butler.models.base;

public enum TipoMorador {

	JURIDICO("Juridico"), PROPRIETARIO("Proprietario"), LOCATARIO("Locatario"), DEPENDENTE("Dependente"), TEMPORADA(
			"Temporada"), EMPREGO("Emprego");

	public String label;

	private TipoMorador(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}
}
