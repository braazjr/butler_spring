package br.com.onsmarttech.butler.resource;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.onsmarttech.butler.models.Empresa;
import br.com.onsmarttech.butler.repositories.EmpresaRepository;

@RestController
@RequestMapping("/empresas")
public class EmpresaController {

	@Autowired
	private EmpresaRepository repository;

	@GetMapping
	public ModelAndView listaEmpresas() {
		ModelAndView view = new ModelAndView("empresa/listaEmpresas");
		view.addObject("empresas", repository.findAll());
		return view;
	}

	@GetMapping("/cadastro")
	public ModelAndView cadastroEmpresa() {
		ModelAndView view = new ModelAndView("empresa/cadastroEmpresa");
		view.addObject("empresa", new Empresa());
		return view;
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> buscarEmpresaPorId(@PathVariable Long id) {
		Empresa empresa = repository.findOne(id);
		
		return empresa != null ? ResponseEntity.ok(empresa) : ResponseEntity.notFound().build();
	}

	@PostMapping(value = "/cadastro")
	public ResponseEntity<?> salvarEmpresa(@Valid Empresa empresa, BindingResult bindingResult) {
		Empresa empresaSalva = repository.save(empresa);

		if (bindingResult.hasErrors()) {
			return new ResponseEntity<List<ObjectError>>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<Empresa>(empresaSalva, HttpStatus.OK);
	}
}
