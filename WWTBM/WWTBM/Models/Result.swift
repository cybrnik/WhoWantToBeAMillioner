//
//  Result.swift
//  WWTBM
//
//  Created by Nikita on 12.08.2021.
//

import Foundation

class Result: Codable {
    init(coutOfCorrectAnswers: Int, countOfQuestions: Int, timeOfGame: Int) {
        self.coutOfCorrectAnswers = coutOfCorrectAnswers
        self.countOfQuestions = countOfQuestions
        self.timeOfGame = timeOfGame
    }
    var coutOfCorrectAnswers = 0
    var countOfQuestions = 0
    var timeOfGame = 0
}
