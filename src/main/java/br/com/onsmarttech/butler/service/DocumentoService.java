package br.com.onsmarttech.butler.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import br.com.onsmarttech.butler.models.base.Apartamento;
import br.com.onsmarttech.butler.models.base.Documento;
import br.com.onsmarttech.butler.models.security.Usuario;
import br.com.onsmarttech.butler.repositories.ApartamentoRepository;
import br.com.onsmarttech.butler.repositories.DocumentoRepository;
import br.com.onsmarttech.butler.repositories.UsuarioRepository;

@Service
public class DocumentoService {

	@Autowired
	private DocumentoRepository repository;

	@Autowired
	private UsuarioRepository usuarioRepository;

	@Autowired
	private ApartamentoRepository apartamentoRepository;

	public void uploadDocumento(Long idApartamento, Long idUsuario, MultipartFile file) {
		try {
			Apartamento apto = apartamentoRepository.findOne(idApartamento);
			Usuario usuario = usuarioRepository.findOne(idUsuario);

			if (usuario != null && apto != null) {
				String uuid = UUID.randomUUID().toString();

				File targetFile = new File(
						"src/main/resources/uploads/" + uuid + "." + file.getContentType().split("/")[1]);
				FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);

				repository.save(new Documento(uuid, targetFile.getAbsolutePath(), usuario, apto));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Documento> deletarDocumento(Long idDocumento) {
		Documento documento = repository.findOne(idDocumento);

		File file = new File(documento.getPath());

		if (file.delete()) {
			repository.delete(documento);

			return repository.buscarDocumentosPorApartamento(documento.getApartamento().getId());
		}

		return null;
	}
}
