package br.com.onsmarttech.butler.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.onsmarttech.butler.models.base.Apartamento;
import br.com.onsmarttech.butler.repositories.ApartamentoRepository;
import br.com.onsmarttech.butler.util.LogUtil;

@Service
public class ApartamentoService {

	@Autowired
	private ApartamentoRepository repository;

	public Apartamento atualizar(Long codigo, Apartamento apartamento) {
		Apartamento apartamentoSalva = repository.findOne(codigo);

		if (apartamentoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}

		BeanUtils.copyProperties(apartamento, apartamentoSalva, "id");

		return repository.save(apartamentoSalva);
	}

	public Apartamento save(Apartamento apartamento) {
		LogUtil.printTitulo("SALVANDO APARTAMENTO");
		Apartamento apartamentoSalvo = repository.save(apartamento);

		LogUtil.printMensagem("APARTAMENTO SALVO: " + apartamentoSalvo.toString());

		if (apartamentoSalvo.getMoradores() != null && !apartamentoSalvo.getMoradores().isEmpty()) {
			apartamentoSalvo.getMoradores().forEach(morador -> {
				try {
					String foto = morador.getFoto64();

					if (foto != null && !foto.isEmpty()) {
						LogUtil.printTitulo("SALVANDO FOTO DO MORADOR");

						InputStream is = new ByteArrayInputStream(Base64.encodeBase64(foto.getBytes()));

						BufferedImage image = ImageIO.read(is);
						is.close();

						ImageIO.write(image, "jpeg",
								new File("C:\\Users\\ebj\\Documents\\GitHub\\butler_spring\\fotos\\" + morador.getId()
										+ ".jpeg"));

						LogUtil.printMensagem("FOTO SALVA!");
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			});
		}

		return apartamentoSalvo;
	}
}
