//
//  Question.swift
//  WWTBM
//
//  Created by Nikita on 10.08.2021.
//

import Foundation

struct Question: Codable {
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    let correctAnswer: String
}
