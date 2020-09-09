//
//  ModelVendedor.swift
//  aobaApp-iOS
//
//  Created by M Cavasin on 22/08/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation
import UIKit

class ModelVendedor {
    
    static let instance = ModelVendedor()
    
    private init() {
    }
    
    var hortifruit: [String] = []
    var email: String = ""
    var senha: String = ""
    var nome: String = ""
    var codigo_registro: String = ""
    var foto: String = ""
    var descricao: String = ""
    var dictListaProdutos = [[String: Any]]()
    var dictListaAnuncios = [[String: Any]]()
    
}





struct HortifruitStruct {
  var name: String
  var tipo: String
    
    
    
    /*


var a = ["secao": Optional(FRUTA), "categorias": Optional(<__NSArrayI 0x600003764bc0>(
    {
        categoria = Abacate;
        foto = "fruta-abacate";
        produtos =     (
                    {
                anuncios =             (
                                    {
                        id = 43;
                        produtor =                     {
                            codigoRegistro = codigo1;
                            descricao = "Produtor de frutas em curitiba";
                            email = "jose@redeaoba.com.br";
                            foto = "foto-jose";
                            id = 1;
                            nome = "Jos00e9 Bestel";
                            nomeFantasia = "Fazenda Bestel";
                        };
                        qtdeMax = 10;
                        valor = "14.99";
                    }
                );
                foto = "fruta-abacate-fortuna";
                nome = "Abacate Fortuna";
            }
        );
    },
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    {
        categoria = Abacaxi;
        foto = "fruta-abacaxi";
        produtos =     (
                    {
                anuncios =             (
                                    {
                        id = 44;
                        produtor =                     {
                            codigoRegistro = codigo1;
                            descricao = "Produtor de frutas em curitiba";
                            email = "jose@redeaoba.com.br";
                            foto = "foto-jose";
                            id = 1;
                            nome = "Jos Bestel";
                            nomeFantasia = "Fazenda Bestel";
                        };
                        qtdeMax = 10;
                        valor = "14.99";
                    }
                );
                foto = "fruta-abacaxi-perola";
                nome = "Abacaxi Pe9rola";
            }
        );
    },
    {
        categoria = Banana;
        foto = "fruta-banana";
        produtos =     (
                    {
                anuncios =             (
                                    {
                        id = 45;
                        produtor =                     {
                            codigoRegistro = codigo1;
                            descricao = "Produtor de frutas em curitiba";
                            email = "jose@redeaoba.com.br";
                            foto = "foto-jose";
                            id = 1;
                            nome = "Jos9 Bestel";
                            nomeFantasia = "Fazenda Bestel";
                        };
                        qtdeMax = 10;
                        valor = "14.99";
                    }
                );
                foto = "fruta-banana-maca";
                nome = "Banana Mae7a";
            }
        );
    },
    {
        categoria = Laranja;
        foto = "fruta-laranja";
        produtos =     (
                    {
                anuncios =             (
                                    {
                        id = 46;
                        produtor =                     {
                            codigoRegistro = codigo1;
                            descricao = "Produtor de frutas em curitiba";
                            email = "jose@redeaoba.com.br";
                            foto = "foto-jose";
                            id = 1;
                            nome = "Jo Bestel";
                            nomeFantasia = "Fazenda Bestel";
                        };
                        qtdeMax = 10;
                        valor = "14.99";
                    }
                );
                foto = "fruta-laranja-bahia";
                nome = "Laranja Bahia";
            }
        );
    },
    {
        categoria = "Mae7a";
        foto = "fruta-maca";
        produtos =     (
                    {
                anuncios =             (
                                    {
                        id = 47;
                        produtor =                     {
                            codigoRegistro = codigo1;
                            descricao = "Produtor de frutas em curitiba";
                            email = "jose@redeaoba.com.br";
                            foto = "foto-jose";
                            id = 1;
                            nome = "Jos00e9 Bestel";
                            nomeFantasia = "Fazenda Bestel";
                        };
                        qtdeMax = 10;
                        valor = "14.99";
                    }
                );
                foto = "fruta-maca-gala";
                nome = "Ma00e7a Gala";
            }
        );
    },
    {
        categoria = "Mam00e3o";
        foto = "fruta-mam00e3o";
        produtos =     (
                    {
                anuncios =             (
                                    {
                        id = 48;
                        produtor =                     {
                            codigoRegistro = codigo1;
                            descricao = "Produtor de frutas em curitiba";
                            email = "jose@redeaoba.com.br";
                            foto = "foto-jose";
                            id = 1;
                            nome = "Jos00e9 Bestel";
                            nomeFantasia = "Fazenda Bestel";
                        };
                        qtdeMax = 10;
                        valor = "14.99";
                    }
                );
                foto = "fruta-mamao-papaia";
                nome = "Mam00e3o Papaia";
            }
        );
    }
    )
    )]
    */
    
}

let allHortifruit = [
  HortifruitStruct(name: "Maçã Gala", tipo: "Fruta"),
  HortifruitStruct(name: "Maçã Fuji", tipo: "Fruta"),
  HortifruitStruct(name: "Abacate", tipo: "Fruta"),
  HortifruitStruct(name: "Banana Maçã", tipo: "Fruta"),
  HortifruitStruct(name: "Banana Prata", tipo: "Fruta"),
  HortifruitStruct(name: "Abacaxi Perola", tipo: "Fruta"),
  HortifruitStruct(name: "Abacaxi Gold", tipo: "Fruta"),
  HortifruitStruct(name: "Cenoura", tipo: "Legume"),
  HortifruitStruct(name: "Beterraba", tipo: "Legume"),
  HortifruitStruct(name: "Alface Crespa", tipo: "Verdura"),
  HortifruitStruct(name: "Alface Lisa", tipo: "Verdura")
]
