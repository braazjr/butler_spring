package br.com.onsmarttech.butler.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.onsmarttech.butler.models.Condominio;
import br.com.onsmarttech.butler.repositories.CondominioRepository;

@Controller
@RequestMapping("/condominio")
public class CondominioController {

	@Autowired
	private CondominioRepository dao;

	@RequestMapping
	public ModelAndView listaCondominios() {
		ModelAndView view = new ModelAndView("condominio/listaCondominios");
		view.addObject("condominios", dao.findAll());
		return view;
	}

	@RequestMapping("/cadastro")
	public ModelAndView cadastroCondominio() {
		ModelAndView view = new ModelAndView("condominio/cadastroCondominio");
		view.addObject("condominio", new Condominio());
		return view;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/cadastro")
	public String salvarCondominio(Condominio condominio) {
		dao.save(condominio);
		
		System.out.println("teste");

		return "condominio/cadastroCondominio";
	}
}
