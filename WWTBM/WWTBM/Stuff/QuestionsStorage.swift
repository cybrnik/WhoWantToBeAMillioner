//
//  QuestionsStorage.swift
//  WWTBM
//
//  Created by Nikita on 17.08.2021.
//

import Foundation

class QuestionsStorage {
    var quest: [Question] = [Question(question: "Какое животное вылезает из часов?", answer1: "Страус", answer2: "Дятел", answer3: "Кукушка", answer4: "Пингвин", correctAnswer: "Кукушка"), Question(question: "Какая страна запустила первую космическую станцию к венере?", answer1: "Россия", answer2: "СССР", answer3: "Америка", answer4: "Англия", correctAnswer: "СССР"), Question(question: "Мужская сборная каких стран становилась чемпионом мира по настольному тенису?", answer1: "Россия", answer2: "Щвеция", answer3: "Япония", answer4: "Китай", correctAnswer: "Китай"), Question(question: "Перстень с каким камнем подарил В. Далю Пушкин перед смертью?", answer1: "Сердолик", answer2: "Рубин", answer3: "Изумруд", answer4: "Сапфир", correctAnswer: "Изумруд"), Question(question: "В каком из городов Италии находиться сад чудовищ?", answer1: "Падуя", answer2: "Бомарцо", answer3: "Мессина", answer4: "Париж", correctAnswer: "Бомарцо"), Question(question: "Когда жил Горацио Нельсон?", answer1: "1805-1854", answer2: "1758-1805", answer3: "1659-1706", answer4: "1602-1665", correctAnswer: "1758-1805"), Question(question: "У автомобилей какой фирмы техническая особенность двигателей - вращение коленчатого вала против часовой стрелки?", answer1: "Хендай", answer2: "БМВ", answer3: "Сузука", answer4: "Хонда", correctAnswer: "Хонда")]
    var questions: [Question] {
        get {
            return quest
        }
        set (newValue) {
            self.quest = newValue
            QuestionsCareTaker().save(questions: newValue)
        }
    }
    
}
