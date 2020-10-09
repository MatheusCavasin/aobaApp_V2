//
//  Carrinho.swift
//  aobaApp-iOS
//
//  Created by Carlos Modinez on 22/09/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import Foundation


class Carrinho {
    var produtos: [ItemCarrinho] = []
    var valorProdutos: Float = 0
    var valorEntrega: Float = 30.0
    var metodoPagamento: String = "Dinheiro"
    var endereco: EnderecoData?
    
    public func setEndereco(novoEndereco: EnderecoData?) {
        if novoEndereco == nil {
            return
        } else {
            self.endereco = novoEndereco
        }
        
    }
    
    public func adicionarNovoProduto(_ novoProduto: ItemCarrinho, _ qtde: Int) {
        novoProduto.anuncio.qtdeMax = qtde
        self.produtos.append(novoProduto)
        self.valorProdutos += Float(novoProduto.anuncio.qtdeMax) * novoProduto.anuncio.valor
    }
    
}
