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
    var macas: [Dictionary<String, Any>]
    var carrinho: Dictionary<String, Any>
    
    var anuncios: [AtivosSecao]!
    
    
    private init() {
        anuncios = [
            AtivosSecao(secao: "FRUTAS",
                        categorias: [
                            AtivosCategoria(categoria: "Maça", foto: "fruta-maca", produtos:
                                [
                                    AtivosProduto(nome: "Maca gala", anuncio:
                                        AtivosAnuncio(
                                            id: 124234,
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "QUA"]),
                                            diasDisponiveis: ["SEG", "QUA"]))
                            ]),
                            
                            AtivosCategoria(categoria: "Laranja", foto: "fruta-laranja", produtos:
                                [
                                    AtivosProduto(nome: "Laranja lima", anuncio:
                                        AtivosAnuncio(
                                            id: 124234,
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                            diasDisponiveis: ["SEG", "QUI"]))
                            ]),
                            AtivosCategoria(categoria: "Abacaxi", foto: "fruta-abacaxi", produtos:
                                [
                                    AtivosProduto(nome: "Abacaxi perola", anuncio:
                                        AtivosAnuncio(
                                            id: 124234,
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                            diasDisponiveis: ["TER", "QUI"]))
                            ])
            ]),
            
            
            AtivosSecao(secao: "LEGUMES",
                        categorias: [
                            AtivosCategoria(categoria: "Beterraba", foto: "legume-beterraba", produtos:
                                [
                                    AtivosProduto(nome: "Beterraba roxa", anuncio:
                                        AtivosAnuncio(
                                            id: 124234,
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                            diasDisponiveis: ["SEG", "QUA"]))
                            ]),
                            
                            AtivosCategoria(categoria: "Rabanete", foto: "legume-rabanete", produtos:
                                [
                                    AtivosProduto(nome: "Rabanete do Caule verde", anuncio:
                                        AtivosAnuncio(
                                            id: 124234,
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                            diasDisponiveis: ["QUI", "TER"]))
                            ]),
                            
            ]),
            
            AtivosSecao(secao: "VERDURAS",
                        categorias: [
                            AtivosCategoria(categoria: "Brocolis", foto: "verdura-brocolis", produtos:
                                [
                                    AtivosProduto(nome: "Brocolis", anuncio:
                                        AtivosAnuncio(
                                            id: 124234,
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "TER", "QUA", "QUI", "SEX"]),
                                            diasDisponiveis: ["SEX", "QUA"]))
                            ]),
                            
                            AtivosCategoria(categoria: "Alface", foto: "verdura-alface", produtos:
                                [
                                    AtivosProduto(nome: "Alface crespa", anuncio:
                                        AtivosAnuncio(
                                            id: 124234,
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "QUA"]),
                                            diasDisponiveis: ["TER", "QUI"]))
                            ]),
                            AtivosCategoria(categoria: "Couve-flor", foto: "verdura-couveflor", produtos:
                                [
                                    AtivosProduto(nome: "Couve", anuncio:
                                        AtivosAnuncio(
                                            id: 124234,
                                            valor: 14.99,
                                            qtdeMax: 43,
                                            produtor: AtivosProdutor(
                                                codigoProdutor: "46323423423",
                                                descricao: "descricao do produtor",
                                                diasAtendimento: ["SEG", "QUA"]),
                                            diasDisponiveis: ["SEG"]))
                            ])
            ]),
        ]
        
        
        macas = [
            ["titulo": "Maçã Gala",
             "imagem": "maca-gala",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            ["titulo": "Maçã Argentina",
             "imagem": "maca-argentina",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            
            ["titulo": "Maçã Gala",
             "imagem": "maca-gala2",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            
            ["titulo": "Maçã Verde",
             "imagem": "maca-verde",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            
            ["titulo": "Maçã Ambrosia",
             "imagem": "maca-ambrosia",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            ["titulo": "Maçã Gala",
             "imagem": "maca-gala",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            ["titulo": "Maçã Argentina",
             "imagem": "maca-argentina",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            
            ["titulo": "Maçã Gala",
             "imagem": "maca-gala2",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            
            ["titulo": "Maçã Verde",
             "imagem": "maca-verde",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ],
            
            
            ["titulo": "Maçã Ambrosia",
             "imagem": "maca-ambrosia",
             "preco": 4.50,
             "quantidadeDisponiel": 20,
             "produtor": "Fazenda do Sol",
             "avaliação do produtor": 4.9
            ]
        ]
        
        
        carrinho = [
            "produtos": [
                [
                    "titulo": "Banana Nanica",
                    "imagem": "fruta-banana",
                    "preco": 20.0,
                    "quantidade": 2,
                ],
                [
                    "titulo": "Mexerica",
                    "imagem": "fruta-laranja",
                    "preco": 35.0,
                    "quantidade": 3,
                ],
                [
                    "titulo": "Alface crespa",
                    "imagem": "verdura-alface",
                    "preco": 15.0,
                    "quantidade": 5,
                ],
            ],
            
            "endereco": "Rua Nilo José Casarin, 193",
            "cidade": "Curitiba - SP",
            "valorFrete": 30.0
        ]
        
        
        
        
    }
}



