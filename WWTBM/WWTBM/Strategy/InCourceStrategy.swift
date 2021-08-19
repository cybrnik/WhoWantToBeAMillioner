//
//  InCourceStrategy.swift
//  WWTBM
//
//  Created by Nikita on 17.08.2021.
//

import Foundation

class InCourceStrategy: GetQuestionStrategy {
    var counter = -1
    func GetQuestion() -> Question? {
        counter += 1
        let questions = QuestionsStorage().questions
        if counter >= questions.count {
            return nil
        }
        
        return questions[counter]
    }
    
    
}
