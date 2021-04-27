// MARK: - Mocks generated from file: Leilao/Dao/LeilaoDao.swift at 2021-04-27 21:40:06 +0000

//
//  LeilaoDao.swift
//  Leilao
//
//  Created by Ândriu Coelho on 22/05/18.
//  Copyright © 2018 Alura. All rights reserved.
//
import Cuckoo
@testable import Leilao

import UIKit


 class MockLeilaoDao: LeilaoDao, Cuckoo.ClassMock {
    
     typealias MocksType = LeilaoDao
    
     typealias Stubbing = __StubbingProxy_LeilaoDao
     typealias Verification = __VerificationProxy_LeilaoDao

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: LeilaoDao?

     func enableDefaultImplementation(_ stub: LeilaoDao) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func executaQuery(_ sql: String)  {
        
    return cuckoo_manager.call("executaQuery(_: String)",
            parameters: (sql),
            escapingParameters: (sql),
            superclassCall:
                
                super.executaQuery(sql)
                ,
            defaultCall: __defaultImplStub!.executaQuery(sql))
        
    }
    
    
    
     override func salva(_ leilao: Leilao)  {
        
    return cuckoo_manager.call("salva(_: Leilao)",
            parameters: (leilao),
            escapingParameters: (leilao),
            superclassCall:
                
                super.salva(leilao)
                ,
            defaultCall: __defaultImplStub!.salva(leilao))
        
    }
    
    
    
     override func correntes() -> [Leilao] {
        
    return cuckoo_manager.call("correntes() -> [Leilao]",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.correntes()
                ,
            defaultCall: __defaultImplStub!.correntes())
        
    }
    
    
    
     override func encerrados() -> [Leilao] {
        
    return cuckoo_manager.call("encerrados() -> [Leilao]",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.encerrados()
                ,
            defaultCall: __defaultImplStub!.encerrados())
        
    }
    
    
    
     override func atualiza(leilao: Leilao)  {
        
    return cuckoo_manager.call("atualiza(leilao: Leilao)",
            parameters: (leilao),
            escapingParameters: (leilao),
            superclassCall:
                
                super.atualiza(leilao: leilao)
                ,
            defaultCall: __defaultImplStub!.atualiza(leilao: leilao))
        
    }
    

	 struct __StubbingProxy_LeilaoDao: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func executaQuery<M1: Cuckoo.Matchable>(_ sql: M1) -> Cuckoo.ClassStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: sql) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "executaQuery(_: String)", parameterMatchers: matchers))
	    }
	    
	    func salva<M1: Cuckoo.Matchable>(_ leilao: M1) -> Cuckoo.ClassStubNoReturnFunction<(Leilao)> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "salva(_: Leilao)", parameterMatchers: matchers))
	    }
	    
	    func correntes() -> Cuckoo.ClassStubFunction<(), [Leilao]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "correntes() -> [Leilao]", parameterMatchers: matchers))
	    }
	    
	    func encerrados() -> Cuckoo.ClassStubFunction<(), [Leilao]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "encerrados() -> [Leilao]", parameterMatchers: matchers))
	    }
	    
	    func atualiza<M1: Cuckoo.Matchable>(leilao: M1) -> Cuckoo.ClassStubNoReturnFunction<(Leilao)> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLeilaoDao.self, method: "atualiza(leilao: Leilao)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_LeilaoDao: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func executaQuery<M1: Cuckoo.Matchable>(_ sql: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: sql) { $0 }]
	        return cuckoo_manager.verify("executaQuery(_: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func salva<M1: Cuckoo.Matchable>(_ leilao: M1) -> Cuckoo.__DoNotUse<(Leilao), Void> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return cuckoo_manager.verify("salva(_: Leilao)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func correntes() -> Cuckoo.__DoNotUse<(), [Leilao]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("correntes() -> [Leilao]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func encerrados() -> Cuckoo.__DoNotUse<(), [Leilao]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("encerrados() -> [Leilao]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func atualiza<M1: Cuckoo.Matchable>(leilao: M1) -> Cuckoo.__DoNotUse<(Leilao), Void> where M1.MatchedType == Leilao {
	        let matchers: [Cuckoo.ParameterMatcher<(Leilao)>] = [wrap(matchable: leilao) { $0 }]
	        return cuckoo_manager.verify("atualiza(leilao: Leilao)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class LeilaoDaoStub: LeilaoDao {
    

    

    
     override func executaQuery(_ sql: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func salva(_ leilao: Leilao)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func correntes() -> [Leilao]  {
        return DefaultValueRegistry.defaultValue(for: ([Leilao]).self)
    }
    
     override func encerrados() -> [Leilao]  {
        return DefaultValueRegistry.defaultValue(for: ([Leilao]).self)
    }
    
     override func atualiza(leilao: Leilao)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

