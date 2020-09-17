//
//  Singleton.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 18/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation

class Singleton {
    static var shared = Singleton()
    
    
    var carrinho: [AtivosProduto] = []
    var anuncios: [AtivosSecao]!
    
    
    private init() {
        anuncios = [
            AtivosSecao(secao: "FRUTAS",
                        categorias: [
                            AtivosCategoria(categoria: "Maça", foto: "fruta-maca", produtos:
                                [
                                    AtivosProduto(nome: "Maca gala", anuncio:
                                        [
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 16.00,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "QUA"]),
                                                diasDisponiveis: ["SEG", "QUA"]),
                                            
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 15.00,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "QUI"]),
                                                diasDisponiveis: ["SEG", "QUI"]),
                                            
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 12.00,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "QUI"]),
                                                diasDisponiveis: ["SEG", "QUI"])
                                        ]
                                    ),
                                    
                                    AtivosProduto(nome: "Maca verde", anuncio:
                                        [
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 21.00,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "QUA"]),
                                                diasDisponiveis: ["SEG", "QUA"]),
                                            
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 25.00,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "QUI"]),
                                                diasDisponiveis: ["SEG", "QUI"]),
                                            
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 23.00,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "QUI"]),
                                                diasDisponiveis: ["SEG", "QUI"])
                                        ]
                                    )
                                    
                            ]),
                            
                            AtivosCategoria(categoria: "Laranja", foto: "fruta-laranja", produtos:
                                [
                                    AtivosProduto(nome: "Laranja lima", anuncio:
                                        [
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 5.00,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                                diasDisponiveis: ["SEG", "QUI"]),
                                            
                                            AtivosAnuncio(
                                            id: 124234,
                                            image: "logo.png",
                                            valor: 4.50,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                            diasDisponiveis: ["SEG", "QUI"]),
                                            
                                            AtivosAnuncio(
                                            id: 124234,
                                            image: "logo.png",
                                            valor: 22.0,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                            diasDisponiveis: ["SEG", "QUI"]),
                                        
                                        
                                        ]
                                        
                                    )
                            ]),
                            AtivosCategoria(categoria: "Abacaxi", foto: "fruta-abacaxi", produtos:
                                [
                                    AtivosProduto(nome: "Abacaxi perola", anuncio:
                                        [
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 14.99,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                                diasDisponiveis: ["TER", "QUI"])])
                            ])
            ]),
            
            
            AtivosSecao(secao: "LEGUMES",
                        categorias: [
                            AtivosCategoria(categoria: "Beterraba", foto: "legume-beterraba", produtos:
                                [
                                    AtivosProduto(nome: "Beterraba roxa", anuncio:
                                        [
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 14.99,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                                diasDisponiveis: ["SEG", "QUA"])])
                            ]),
                            
                            AtivosCategoria(categoria: "Rabanete", foto: "legume-rabanete", produtos:
                                [
                                    AtivosProduto(nome: "Rabanete do Caule verde", anuncio:
                                        [
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 14.99,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                                diasDisponiveis: ["QUI", "TER"])])
                            ]),
                            
            ]),
            
            AtivosSecao(secao: "VERDURAS",
                        categorias: [
                            AtivosCategoria(categoria: "Brocolis", foto: "verdura-brocolis", produtos:
                                [
                                    AtivosProduto(nome: "Brocolis", anuncio:[
                                        AtivosAnuncio(
                                            id: 124234,
                                            image: "logo.png",
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                            diasDisponiveis: ["SEX", "QUA"])])
                            ]),
                            
                            AtivosCategoria(categoria: "Alface", foto: "verdura-alface", produtos:
                                [
                                    AtivosProduto(nome: "Alface crespa", anuncio:
                                        [
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 14.99,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "QUA"]),
                                                diasDisponiveis: ["TER", "QUI"])])
                            ]),
                            AtivosCategoria(categoria: "Couve-flor", foto: "verdura-couveflor", produtos:
                                [
                                    AtivosProduto(nome: "Couve", anuncio:
                                        [
                                            AtivosAnuncio(
                                                id: 124234,
                                                image: "logo.png",
                                                valor: 14.99,
                                                qtdeMax: 43,
                                                produtor: AtivosProdutor(
                                                    codigoProdutor: "46323423423",
                                                    descricao: "descricao do produtor",
                                                    diasAtendimento: ["SEG", "QUA"]),
                                                diasDisponiveis: ["SEG"])])
                            ])
            ]),
        ]
        
        
        
        
        
    }
}



