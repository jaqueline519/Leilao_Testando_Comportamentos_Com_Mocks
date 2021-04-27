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
    
    override func setUpWithError() throws {
        formatador = DateFormatter()
        formatador.dateFormat = "yyyy/MM/dd"
    }

    override func tearDownWithError() throws {
     
    }
    
    func testDeveEncerrarLeiloesQueComecaramUmaSemanaAntes(){

        guard let dataAntiga = formatador.date(from: "2018/05/09") else {return}
        
        let tvLed = CriadorDeLeilao().para(descricao: "TV LED").naData(data: dataAntiga).constroi()
        let geladeira = CriadorDeLeilao().para(descricao: "Geladeira").naData(data: dataAntiga).constroi()
        
        let leiloesAntigos = [tvLed, geladeira]
        
        let daoFalso = MockLeilaoDao().withEnabledSuperclassSpy()
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn(leiloesAntigos)
        }
        
        let encerradorDeLeilao = EncerradorDeLeilao(daoFalso)
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
        let daoFalso = MockLeilaoDao().withEnabledSuperclassSpy()
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn([tvLed])
        }
        
        let encerradorDeLeilao = EncerradorDeLeilao(daoFalso)
        encerradorDeLeilao.encerra()
        
        verify(daoFalso).atualiza(leilao: tvLed)
    }
}
extension Leilao: Matchable {
    public var matcher: ParameterMatcher<Leilao> {
        return equal(to: self)
    }
}
