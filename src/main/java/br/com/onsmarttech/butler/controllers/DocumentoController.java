package br.com.onsmarttech.butler.controllers;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import br.com.onsmarttech.butler.models.base.Documento;
import br.com.onsmarttech.butler.repositories.DocumentoRepository;
import br.com.onsmarttech.butler.service.DocumentoService;

@RestController
@RequestMapping("/documento")
public class DocumentoController {

	@Autowired
	private DocumentoRepository repository;
	
	@Autowired
	private DocumentoService service;

	@GetMapping(value = "/buscarDocumentosPorApartamento/{idApartamento}")
	public ResponseEntity<?> buscarDocumentosPorApartamento(@PathVariable Long idApartamento) {
		List<Documento> documentos = repository.buscarDocumentosPorApartamento(idApartamento);

		return documentos != null ? ResponseEntity.ok(documentos) : ResponseEntity.notFound().build();
	}

	@PostMapping(value = "/uploadDocumento/{idApartamento}/{idUsuario}")
	public ResponseEntity<?> uploadDocumento(@RequestParam MultipartFile file, @PathVariable Long idApartamento,
			@PathVariable Long idUsuario) {
		if (file != null && (idUsuario != null && idUsuario != 0) && (idApartamento != null && idApartamento != 0)) {
			service.uploadDocumento(idApartamento, idUsuario, file);

			return ResponseEntity.ok().body(null);
		} else {
			return ResponseEntity.badRequest().body(null);
		}

	}

	@GetMapping(path = "/exibirDocumento/{idDocumento}")
	public void exibirDocumento(@PathVariable("idDocumento") Long idDocumento, HttpServletResponse response) {
		try {
			Documento documento = repository.findOne(idDocumento);

			if (documento != null) {
				File file = new File(documento.getPath());

				if (file.exists()) {
					FileUtils.copyFile(file, response.getOutputStream());

					response.setContentType("application/pdf");
					response.setHeader("Content-disposition", "inline; filename=" + documento.getNome() + ".pdf");
					response.flushBuffer();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@DeleteMapping(value = "deletarDocumento/{idDocumento}")
	public ResponseEntity<?> deletarDocumento(@PathVariable Long idDocumento) {
		List<Documento> documentos = service.deletarDocumento(idDocumento);

		return documentos != null ? ResponseEntity.ok(documentos) : ResponseEntity.notFound().build();
	}

}
