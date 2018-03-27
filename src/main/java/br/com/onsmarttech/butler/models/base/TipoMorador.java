package br.com.onsmarttech.butler.models.base;

public enum TipoMorador {

	JURIDICO("Jurídico"), PROPRIETARIO("Proprietário"), LOCATARIO("Locatário"), DEPENDENTE("Dependente"), TEMPORADA(
			"Temporada"), EMPREGO("Emprego");

	public String label;

	private TipoMorador(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}
}
