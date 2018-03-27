package br.com.onsmarttech.butler.resource;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.onsmarttech.butler.models.base.TipoMorador;

@RestController
@RequestMapping("/tipoMorador")
public class TipoMoradorResource {

    @GetMapping
    public List<TipoMorador> listaTiposMorador() {
        return Arrays.asList(TipoMorador.values());
    }
}