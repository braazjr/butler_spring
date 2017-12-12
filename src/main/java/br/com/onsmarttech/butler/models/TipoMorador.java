package br.com.onsmarttech.butler.models;

public enum TipoMorador {

	JURIDICO("Jur�dico"), PROPRIETARIO("Propriet�rio"), LOCATARIO("Locat�rio"), DEPENDENTE("Dependente"), TEMPORADA(
			"Temporada"), EMPREGO("Emprego");

	public String label;

	private TipoMorador(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}
}
