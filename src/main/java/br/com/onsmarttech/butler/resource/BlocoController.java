package br.com.onsmarttech.butler.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.onsmarttech.butler.models.Bloco;
import br.com.onsmarttech.butler.repositories.BlocoRepository;

@Controller
@RequestMapping("/bloco")
public class BlocoController {

	@Autowired
	private BlocoRepository dao;

	@RequestMapping
	public ModelAndView listaBlocos() {
		ModelAndView view = new ModelAndView("bloco/listaBlocos");
		view.addObject("blocos", dao.findAll());
		return view;
	}

	@RequestMapping("/cadastro")
	public ModelAndView cadastroBloco() {
		ModelAndView view = new ModelAndView("bloco/cadastroBloco");
		view.addObject("bloco", new Bloco());
		return view;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/cadastro")
	public String salvarBloco(Bloco bloco) {
		dao.save(bloco);
		
		System.out.println("teste");

		return "bloco/cadastroBloco";
	}
}
