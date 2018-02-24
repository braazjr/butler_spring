package br.com.onsmarttech.butler.models.buscontrol;

public enum TipoVeiculo {

	CARRO("Carro"), ONIBUS("Onibus"), VAN("Van"), MICROONIBUS("Microonibus");

	public String label;

	private TipoVeiculo(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

}