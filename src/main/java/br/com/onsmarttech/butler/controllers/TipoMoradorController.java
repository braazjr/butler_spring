package br.com.onsmarttech.butler.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.onsmarttech.butler.models.base.TipoMorador;

@RestController
@RequestMapping("/tipoMorador")
public class TipoMoradorController {

    @GetMapping("/buscarTodos")
    public List<TipoMorador> buscarTodos() {
        return Arrays.asList(TipoMorador.values());
    }
}