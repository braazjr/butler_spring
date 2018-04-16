package br.com.onsmarttech.butler.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import br.com.onsmarttech.butler.models.base.Apartamento;
import br.com.onsmarttech.butler.models.base.Documento;
import br.com.onsmarttech.butler.models.security.Usuario;
import br.com.onsmarttech.butler.repositories.ApartamentoRepository;
import br.com.onsmarttech.butler.repositories.DocumentoRepository;
import br.com.onsmarttech.butler.repositories.UsuarioRepository;

@Service
public class ApartamentoService {

	@Autowired
	private ApartamentoRepository repository;

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	private DocumentoRepository documentoRepository;

	public Apartamento atualizar(Long codigo, Apartamento apartamento) {
		Apartamento apartamentoSalva = repository.findOne(codigo);

		if (apartamentoSalva == null) {
			throw new EmptyResultDataAccessException(1);
		}

		BeanUtils.copyProperties(apartamento, apartamentoSalva, "id");

		return repository.save(apartamentoSalva);
	}

	public List<Documento> uploadDocumento(Long idUsuario, MultipartFile file) {
		try {
			Usuario usuario = usuarioRepository.findOne(idUsuario);

			if (usuario != null) {
				File targetFile = new File("src/main/resources/uploads/" + file.getOriginalFilename());
				FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);

				documentoRepository.save(new Documento(file.getName(), targetFile.getAbsolutePath(), usuario));
				
				return documentoRepository.findAll();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
}
