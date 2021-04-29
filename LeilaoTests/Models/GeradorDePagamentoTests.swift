//
//  GeradorDePagamentoTests.swift
//  LeilaoTests
//
//  Created by Jaqueline Bittencourt Santos on 28/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import XCTest
@testable import Leilao
import Cuckoo

class GeradorDePagamentoTests: XCTestCase {

    var daoFalso: MockLeilaoDao!
    var avaliador: Avaliador!
    var pagamentos:  MockRepositorioDePagamento!
    
    override func setUpWithError() throws {
        super.setUp()
        daoFalso = MockLeilaoDao().withEnabledSuperclassSpy()
        avaliador = Avaliador()
        pagamentos = MockRepositorioDePagamento().withEnabledSuperclassSpy()
    }

    override func tearDownWithError() throws {
       
    }
 
    func testDeveGerarPagamentoParaUmLeilaoEncerrado() {
        let playstation = CriadorDeLeilao().para(descricao: "Playstation")
            .lance(Usuario(nome: "Joao"),2000.0)
            .lance(Usuario(nome: "Maria"), 2500.0)
            .constroi()
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.encerrados()).thenReturn([playstation])
        }
        let avaliadorFalso = Avaliador()

        
        let geradorDePagamento = GeradorDePagamento(daoFalso, avaliador, pagamentos)
        geradorDePagamento.gera()
        
        let capturadorDeArgumento = ArgumentCaptor<Pagamento>()
        verify(pagamentos).salva(capturadorDeArgumento.capture())
        
        let pagamentoGerado = capturadorDeArgumento.value
        
        XCTAssertEqual(2500.0, pagamentoGerado?.getValor())
    }
    
    func testDeveEmpurrarParaProximoDiaUtil() {
        let iphone = CriadorDeLeilao().para(descricao: "iPhone")
            .lance(Usuario(nome: "Joao"), 2000.0)
            .lance(Usuario(nome: "Maria"), 2500.0)
            .constroi()
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.encerrados()).thenReturn([iphone])
        }
        
        let formatador = DateFormatter()
        formatador.dateFormat = "yyy/MM/dd"
        
        guard let dataAntiga = formatador.date(from: "2018/05/19") else {return}
        
        let geradorDePagamento = GeradorDePagamento(daoFalso, avaliador, pagamentos, dataAntiga)
        geradorDePagamento.gera()
        
        
        let capturadorDeArgumento = ArgumentCaptor<Pagamento>()
        verify(pagamentos).salva(capturadorDeArgumento.capture())
        
        let pagamentoGerado = capturadorDeArgumento.value
        
        let formatadorDeData = DateFormatter()
        formatadorDeData.dateFormat = "ccc"
        
        guard let dataDoPagamento = pagamentoGerado?.getData() else {return}
        let diaDaSemana = formatadorDeData.string(from: dataDoPagamento)
        
        XCTAssertEqual("Mon", diaDaSemana)
    }

}
