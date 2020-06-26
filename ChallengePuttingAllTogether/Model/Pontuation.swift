//
//  Pontuation.swift
//  ChallengePuttingAllTogether
//
//  Created by Mateus Nobre Ferreira on 17/06/20.
//  Copyright © 2020 Lidiane Gomes Barbosa. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class Pontuation {
    
    let defauls = UserDefaults.standard
    static var nav: UINavigationController?
    
    func getTotalNextLevel() -> Int{
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return 100
        case 100..<200:
            return 100
        default:
            return 200
        }
        
    }
    
    func levelPontuation() -> Int {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return totalPontuation
        case 100..<200:
            return totalPontuation - 100
        default:
            return totalPontuation - 200
        }
    }
    
    func nivelString() -> String {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return "Nivel 1"
        case 100..<200:
            return "Nivel 2"
        default:
            return "Nivel 3"
        }
        
    }
    
    func levelNivelUserString() -> String {
        
        let totalPontuation = defauls.integer(forKey: "totalPontuation")
        
        switch totalPontuation {
        case 0..<100:
            return "Profissional do Miojo"
        case 100..<200:
            return "Orgulho da Mamae"
        default:
            return "Eu sou a Lenda"
        }
    }
    
    func increasePontuation(in num: Int){
        
        var currentPontuation = defauls.integer(forKey: "totalPontuation")
        currentPontuation = currentPontuation + num
       
        defauls.set(currentPontuation, forKey: "totalPontuation")
    }

    func decreasePontuation(in num: Int){
        
        var currentPontuation = defauls.integer(forKey: "totalPontuation")
        currentPontuation = currentPontuation - num
       
        defauls.set(currentPontuation, forKey: "totalPontuation")
    }
    
    func zeraPontuation(){
        defauls.set(0, forKey: "totalPontuation")
    }
    
    func completConquer(id:Int){
        if let currentConquers = defauls.array(forKey: "conquersId") as? [Int]{
            var totalIds = currentConquers
            totalIds.append(id)
            defauls.set(totalIds, forKey: "conquersId")
        }
    }
    
    func setInicialConquers(){
        
        guard let _ = defauls.array(forKey: "conquersId") as? [Int] else{
            defauls.set([], forKey: "conquersId")
            return
        }
        return
    }
    
    func verifyId(id: Int) -> Bool{
        if let currentConquers = defauls.array(forKey: "conquersId") as? [Int]{
            
            return currentConquers.contains(id)
            
        }
        
        return false
    }
    
}
