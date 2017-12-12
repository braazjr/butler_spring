package br.com.onsmarttech.butler.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.onsmarttech.butler.models.Apartamento;
import br.com.onsmarttech.butler.repositories.ApartamentoRepository;

@Controller
@RequestMapping("/apartamento")
public class ApartamentoController {

	@Autowired
	private ApartamentoRepository dao;

	@RequestMapping
	public ModelAndView listaApartamentos() {
		ModelAndView view = new ModelAndView("apartamento/listaApartamentos");
		view.addObject("apartamentos", dao.findAll());
		return view;
	}

	@RequestMapping("/cadastro")
	public ModelAndView cadastroApartamento() {
		ModelAndView view = new ModelAndView("apartamento/cadastroApartamento");
		view.addObject("apartamento", new Apartamento());
		return view;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/cadastro")
	public String salvarApartamento(Apartamento apartamento) {
		dao.save(apartamento);
		
		System.out.println("teste");

		return "apartamento/cadastroApartamento";
	}
}
