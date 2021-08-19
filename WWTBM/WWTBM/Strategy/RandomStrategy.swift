//
//  RandomStrategy.swift
//  WWTBM
//
//  Created by Nikita on 19.08.2021.
//

import Foundation

class RandomStrategy: GetQuestionStrategy {
    var used: [Int] = []
    func GetQuestion() -> Question? {

        let indexOfQuestionsForUse = Array(0..<QuestionsStorage().questions.count).filter { !used.contains($0) }
        if let rndEl = indexOfQuestionsForUse.randomElement() {
            used.append(rndEl)
            return QuestionsStorage().questions[rndEl]
            
        }
        
        return nil
    }
    
    
}
