//
//  Result.swift
//  WWTBM
//
//  Created by Nikita on 12.08.2021.
//

import Foundation

class Result: Codable {
    init(countOfCorrectAnswers: Int, countOfQuestions: Int, timeOfGame: Int) {
        self.countOfCorrectAnswers = countOfCorrectAnswers
        self.countOfQuestions = countOfQuestions
        self.timeOfGame = timeOfGame
    }
    var countOfCorrectAnswers = 0
    var countOfQuestions = 0
    var timeOfGame = 0
}
