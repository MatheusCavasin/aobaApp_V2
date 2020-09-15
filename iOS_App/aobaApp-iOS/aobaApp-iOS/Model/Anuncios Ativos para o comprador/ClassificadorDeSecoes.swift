//
//  ClassificadorDeSecoes.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 10/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class ClassificadorDeSecoes {
    
    
    // Pega todas as secoes e retorna as categorias onde ha pelo menos um produto cadastrado no dia da semana
    public func getCategoriasPelodiaDaSemana(anuncios: [AtivosSecao], nomeDaSecao:String ,diaDaSemana: String) -> AtivosSecao? {
        var novasCategorias: [AtivosCategoria] = []
        
        for secao in anuncios {
            if secao.secao == nomeDaSecao {   //Tem secao?
                for categoria in secao.categorias {  //sim -> verificar se tem algum produto para o dia da semana escolhido
                    if getCategoriasPelodiaDaSemanaAuxiliar(produtos: categoria.produtos, diaDaSemana: diaDaSemana) {
                        novasCategorias.append(categoria)
                    }
                }
            }
        }
        
        if  novasCategorias.count > 0 {
            let novaSecao: AtivosSecao = AtivosSecao(secao: diaDaSemana, categorias: novasCategorias)
            return novaSecao
        }
        else {
            return nil
        }
        
    }

    // Se houver pelo menos 1 produto o dia cadastrado, retorna true
    private func getCategoriasPelodiaDaSemanaAuxiliar (produtos: [AtivosProduto], diaDaSemana: String) -> Bool{
        for produto in produtos {
            for _diaDaSemana in produto.anuncio.diasDisponiveis {
                if _diaDaSemana == diaDaSemana {
                    return true
                }
            }
        }
        return false
    }
    
    
    public func getCategoriaPelaSecao(anuncios: [AtivosSecao], nomeDaSecao: String, diaDaSemana: String) -> AtivosSecao? {
        var novasCategorias: [AtivosCategoria] = []
        
        for secao in anuncios {
            if secao.secao == nomeDaSecao {   //Tem secao?
                for categoria in secao.categorias {  //sim -> verificar se tem algum produto para o dia da semana escolhido
                    if getCategoriasPelodiaDaSemanaAuxiliar(produtos: categoria.produtos, diaDaSemana: diaDaSemana) {
                        novasCategorias.append(categoria)
                    }
                }
            }
        }
        
        if  novasCategorias.count > 0 {
            let novaSecao: AtivosSecao = AtivosSecao(secao: nomeDaSecao, categorias: novasCategorias)
            return novaSecao
        }
        else {
            return nil
        }
    }
    
    
    public func getProdutosDaCategoria(categorias: [AtivosCategoria], diaDaSemana: String) -> [AtivosProduto] {
        
        var produtosDaCategoria: [AtivosProduto] = []
        
        for categoria in categorias {
            for produto in categoria.produtos {
                for diaDisponivel in produto.anuncio.diasDisponiveis {
                    if diaDisponivel == diaDaSemana {
                        produtosDaCategoria.append(produto)
                    }
                }
            }
        }
        return produtosDaCategoria
    }
    
    
    
    
    
}
