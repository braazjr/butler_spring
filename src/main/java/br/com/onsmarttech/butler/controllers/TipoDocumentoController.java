package br.com.onsmarttech.butler.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.onsmarttech.butler.models.base.TipoDocumento;

@RestController
@RequestMapping("/tipoDocumento")
public class TipoDocumentoController {

    @GetMapping("/buscarTodos")
    public List<TipoDocumento> buscarTodos() {
        return Arrays.asList(TipoDocumento.values());
    }
}