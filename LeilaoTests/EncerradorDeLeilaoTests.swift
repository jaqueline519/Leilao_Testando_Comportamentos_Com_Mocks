//
//  EncerradorDeLeilaoTests.swift
//  LeilaoTests
//
//  Created by Jaqueline Bittencourt Santos on 27/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import XCTest
import Cuckoo
@testable import Leilao

class EncerradorDeLeilaoTests: XCTestCase {

    var formatador: DateFormatter!
    var encerradorDeLeilao: EncerradorDeLeilao!
    var daoFalso: MockLeilaoDao!
    var carteiroFalso: MockCarteiro!
    
    override func setUpWithError() throws {
        formatador = DateFormatter()
        formatador.dateFormat = "yyyy/MM/dd"
        daoFalso = MockLeilaoDao().withEnabledSuperclassSpy()
        carteiroFalso = MockCarteiro().withEnabledSuperclassSpy()
        encerradorDeLeilao = EncerradorDeLeilao(daoFalso, carteiro: carteiroFalso)
    }

    override func tearDownWithError() throws {
     
    }
    
    func testDeveEncerrarLeiloesQueComecaramUmaSemanaAntes(){

        guard let dataAntiga = formatador.date(from: "2018/05/09") else {return}
        
        let tvLed = CriadorDeLeilao().para(descricao: "TV LED").naData(data: dataAntiga).constroi()
        let geladeira = CriadorDeLeilao().para(descricao: "Geladeira").naData(data: dataAntiga).constroi()
        
        let leiloesAntigos = [tvLed, geladeira]
        
        
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn(leiloesAntigos)
        }

        encerradorDeLeilao.encerra()
        
        let leiloesEncerrados = daoFalso.encerrados()
        
        guard let statusTvLed = tvLed.isEncerrado() else {return}
        guard let statusGeladeira = geladeira.isEncerrado() else {return}
        
        XCTAssertEqual(2, encerradorDeLeilao.getTotalEncerrados())
        XCTAssertTrue(statusTvLed)
        XCTAssertTrue(statusGeladeira)
    }
    
    func testDeveAtualizarLeiloesEncerrados() {
        
        guard let dataAntiga = formatador.date(from: "2018/05/19") else {return}
        
        let tvLed = CriadorDeLeilao().para(descricao: "TV LED").naData(data: dataAntiga).constroi()
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn([tvLed])
        }
        
        encerradorDeLeilao.encerra()
        
        verify(daoFalso).atualiza(leilao: tvLed)
    }
    
    func testDeveContinuarExecucaoMesmoQuandoDaoFalhar() {
        guard let dataAntiga = formatador.date(from: "2019/05/19") else {return}
        
        let tvLed = CriadorDeLeilao().para(descricao: "TV Led").naData(data: dataAntiga).constroi()
        let geladeira = CriadorDeLeilao().para(descricao: "Geladeora").naData(data: dataAntiga).constroi()
        let error = NSError(domain: "Error", code: 0, userInfo: nil)
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn([tvLed, geladeira])
            when(daoFalso.atualiza(leilao: tvLed)).thenThrow(error)
        }
        
        encerradorDeLeilao.encerra()
        
        verify(daoFalso).atualiza(leilao: geladeira)
        verify(carteiroFalso).envia(geladeira)
       
    }
}
extension Leilao: Matchable {
    public var matcher: ParameterMatcher<Leilao> {
        return equal(to: self)
    }
}
