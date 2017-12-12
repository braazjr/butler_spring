package br.com.onsmarttech.butler.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.onsmarttech.butler.models.Construtora;
import br.com.onsmarttech.butler.repositories.ConstrutoraRepository;

@Controller
@RequestMapping("/construtora")
public class ConstrutoraController {

	@Autowired
	private ConstrutoraRepository dao;

	@RequestMapping
	public ModelAndView listaConstrutoras() {
		ModelAndView view = new ModelAndView("construtora/listaConstrutoras");
		view.addObject("construtoras", dao.findAll());
		return view;
	}

	@RequestMapping("/cadastro")
	public ModelAndView cadastroConstrutora() {
		ModelAndView view = new ModelAndView("construtora/cadastroConstrutora");
		view.addObject("construtora", new Construtora());
		return view;
	}

	@RequestMapping("/{id}")
	public ModelAndView buscarConstrutoraPorId(@PathVariable Long id) {
		ModelAndView view = new ModelAndView("construtora/cadastroConstrutora");
		view.addObject("construtora", dao.findOne(id));
		return view;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/cadastro")
	public String salvarConstrutora(Construtora construtora) {
		dao.save(construtora);

		System.out.println("teste");

		return "construtora/cadastroConstrutora";
	}
}
