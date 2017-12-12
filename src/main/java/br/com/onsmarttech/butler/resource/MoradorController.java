package br.com.onsmarttech.butler.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.onsmarttech.butler.models.Morador;
import br.com.onsmarttech.butler.repositories.MoradorRepository;

@Controller
@RequestMapping("/morador")
public class MoradorController {

	@Autowired
	private MoradorRepository dao;

	@RequestMapping
	public ModelAndView listaMoradors() {
		ModelAndView view = new ModelAndView("morador/listaMoradores");
		view.addObject("moradores", dao.findAll());
		return view;
	}

	@RequestMapping("/cadastro")
	public ModelAndView cadastroMorador() {
		ModelAndView view = new ModelAndView("morador/cadastroMorador");
		view.addObject("morador", new Morador());
		return view;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/cadastro")
	public String salvarMorador(Morador morador) {
		dao.save(morador);

		System.out.println("teste");

		return "morador/cadastroMorador";
	}
}
