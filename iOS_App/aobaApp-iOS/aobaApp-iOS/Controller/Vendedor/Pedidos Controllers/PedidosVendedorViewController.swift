//
//  PedidosVendedorViewController.swift
//  aobaApp-iOS
//
//  Created by José Guilherme Bestel on 24/11/20.
//  Copyright © 2020 M Cavasin. All rights reserved.
//

import UIKit

class PedidosVendedorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var pedidosTableView: UITableView!
        
    var produtorRepository: ProdutorRepository = ProdutorRepository()
    var pedidosRespondidos : [[String : Any?]] = []
    var pedidosRespondidosFiltro : [[String : Any?]] = []
    var novosPedidos : [[String : Any?]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pedidos"
        self.navigationController?.title = "Pedidos"
        setupSegmentationControl()
        setupTablePedidos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Iniciar o load
        LoadView.shared.showLoadView(self.view)
        loadPedidosNovos()
    }
    
    func loadPedidosNovos(){
        produtorRepository.getPedidosNovos{ (result, err) in
            if let result = result{
                let novos = result as? [[String : Any?]]
                if(novos == nil){
                    print("novos pedidos é nil")
                }else{
                    self.novosPedidos = novos as! [[String : Any?]]
                }
            }
            DispatchQueue.main.async {
                self.loadPedidosRespondidos()
            }
            
        }
    }
    
    func loadPedidosRespondidos(){
        produtorRepository.getCarrinhoVendedor { (result, err) in
            if let result = result {
                let respondidos = result as? [[String : Any?]]
                if(respondidos == nil){
                    print("respondidos é nil")
                }else{
                    self.pedidosRespondidos = respondidos as! [[String : Any?]]
                    self.pedidosRespondidosFiltro = self.pedidosRespondidos
                }
            } else {
                print(err as Any)

            }
            DispatchQueue.main.async {
                //Quando finaliza o carregamento
                self.filterBySegmented(index: self.segmentedControl.selectedSegmentIndex)
                
                //Finalizar o load
                LoadView.shared.hideLoadView()
            }
        }
    }
    
    func setupSegmentationControl() {
        segmentedControl.setTitle("Em andamento", forSegmentAt: 0)
        segmentedControl.setTitle("Passados", forSegmentAt: 1)
    }

    func setupTablePedidos(){
        pedidosTableView.delegate = self
        pedidosTableView.dataSource = self
        
        pedidosTableView.register(PedidoAndamentoTableViewCell.nib(),
                                  forCellReuseIdentifier: PedidoAndamentoTableViewCell.identifier)
        pedidosTableView.register(NovoPedidoTableViewCell.nib(),
                                  forCellReuseIdentifier: NovoPedidoTableViewCell.identifier)
        pedidosTableView.separatorStyle = .none
        
    }
    
    func filterBySegmented(index: Int){
        if(index == 0){
            //Filtrados = em andamento
            var emAndamento: [[String : Any?]] = []
            for p in self.pedidosRespondidos{
                let status = p["status"] as! String
                if(status != "ENTREGUE"){
                    emAndamento.append(p)
                }
            }
            self.pedidosRespondidosFiltro = emAndamento
        }else{
            //Filtrados = passados
            var passados: [[String : Any?]] = []
            for p in self.pedidosRespondidos{
                let status = p["status"] as! String
                if(status == "ENTREGUE"){
                    passados.append(p)
                }
            }
            self.pedidosRespondidosFiltro = passados
        }
        
        self.pedidosTableView.reloadData()
        
    }
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        filterBySegmented(index: segmentedControl.selectedSegmentIndex)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(segmentedControl.selectedSegmentIndex == 0 && novosPedidos.count > 0){
            return (pedidosRespondidosFiltro.count + novosPedidos.count)
        }
        return pedidosRespondidosFiltro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let segmentedSelected = segmentedControl.selectedSegmentIndex
        
        if(segmentedSelected == 0 && novosPedidos.count > 0 && indexPath.row < novosPedidos.count){
            let cell = tableView.dequeueReusableCell(withIdentifier: NovoPedidoTableViewCell.identifier) as! NovoPedidoTableViewCell
            return cell
        }
        let row = (novosPedidos.count > 0 && indexPath.row >= novosPedidos.count) ? indexPath.row - novosPedidos.count : indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PedidoAndamentoTableViewCell.identifier) as! PedidoAndamentoTableViewCell
        
        cell.config(pedidoRespondido: pedidosRespondidosFiltro[row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicado: \(indexPath.row)")
        if(segmentedControl.selectedSegmentIndex == 0 && novosPedidos.count > 0){
            if(indexPath.row < novosPedidos.count){
                print("item clicado é pedido novo: \(indexPath.row)")
                
                let novo = novosPedidos[indexPath.row]
                //MARK: enviar esse novo para a tela de novos p/ responder
                print("\n\n\n\n\n\n\n\n")
                print(novo)
                print("\n\n\n\n\n\n\n\n")
                if let vc = storyboard?.instantiateViewController(withIdentifier: "NovosPedidosViewController") as? NovosPedidosViewController {
                    vc.itens = novo["itens"] as! [[String : Any?]]
                    vc.produtor = novo
                    self.present(vc, animated:true, completion: {
//                        self.dadosChamar()
                    })
                }
                
            }else{
                let row = indexPath.row - novosPedidos.count
                print("item clicado é pedido em andamento: \(row)")
                
                let respondido = pedidosRespondidosFiltro[row]
                //MARK: enviar esse novo para detalhes
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(novosPedidos.count > 0 && indexPath.row < novosPedidos.count && segmentedControl.selectedSegmentIndex == 0){
            return 105
        }
        return 315
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
