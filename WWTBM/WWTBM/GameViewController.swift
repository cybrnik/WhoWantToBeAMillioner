//
//  GameViewController.swift
//  WWTBM
//
//  Created by Nikita on 10.08.2021.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!

    var start: Int = 0
    let questions: [Question] = [Question(question: "Какое животное вылезает из часов?", answer1: "Страус", answer2: "Дятел", answer3: "Кукушка", answer4: "Пингвин", correctAnswer: "Кукушка"), Question(question: "Какая страна запустила первую космическую станцию к венере?", answer1: "Россия", answer2: "СССР", answer3: "Америка", answer4: "Англия", correctAnswer: "СССР"), Question(question: "Мужская сборная каких стран становилась чемпионом мира по настольному тенису?", answer1: "Россия", answer2: "Щвеция", answer3: "Япония", answer4: "Китай", correctAnswer: "Китай"), Question(question: "Перстень с каким камнем подарил В. Далю Пушкин перед смертью?", answer1: "Сердолик", answer2: "Рубин", answer3: "Изумруд", answer4: "Сапфир", correctAnswer: "Изумруд"), Question(question: "В каком из городов Италии находиться сад чудовищ?", answer1: "Падуя", answer2: "Бомарцо", answer3: "Мессина", answer4: "Париж", correctAnswer: "Бомарцо"), Question(question: "Когда жил Горацио Нельсон?", answer1: "1805-1854", answer2: "1758-1805", answer3: "1659-1706", answer4: "1602-1665", correctAnswer: "1758-1805"), Question(question: "У автомобилей какой фирмы техническая особенность двигателей - вращение коленчатого вала против часовой стрелки?", answer1: "Хендай", answer2: "БМВ", answer3: "Сузука", answer4: "Хонда", correctAnswer: "Хонда")]
    var randomElement = Question(question: "", answer1: "", answer2: "", answer3: "", answer4: "", correctAnswer: "")
    var coutOfCorrectAnswers = 0
    private(set) var results: [Result] = ResultsCareTaker().retrieveRecords() {
        didSet {
            ResultsCareTaker().save(results: self.results)
        }
    }
    
    func fillNewQuest() {
        coutOfCorrectAnswers += 1
        randomElement = questions.randomElement() ?? Question(question: "", answer1: "", answer2: "", answer3: "", answer4: "", correctAnswer: "")
        questionLabel.text = randomElement.question
        answer1Button.setTitle(" A: \(randomElement.answer1 )", for: .normal)
        answer2Button.setTitle(" B: \(randomElement.answer2 )", for: .normal)
        answer3Button.setTitle(" C: \(randomElement.answer3 )", for: .normal)
        answer4Button.setTitle(" D: \(randomElement.answer4 )", for: .normal)
    }
    func returnToMainVC() {
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
    override func viewDidLoad() {
        answer1Button.layer.cornerRadius = 20
        answer2Button.layer.cornerRadius = 20
        answer3Button.layer.cornerRadius = 20
        answer4Button.layer.cornerRadius = 20
        fillNewQuest()
        super.viewDidLoad()
        start = Int(NSDate().timeIntervalSince1970)
    }
    @IBAction func button1Touched(_ sender: Any) {
        if randomElement.answer1 == randomElement.correctAnswer {
            fillNewQuest()
        }
        else {
            results.append(Result(coutOfCorrectAnswers: coutOfCorrectAnswers, countOfQuestions: questions.count, timeOfGame: Int(NSDate().timeIntervalSince1970) - start))
            returnToMainVC()
        }
    }
    @IBAction func button2Touched(_ sender: Any) {
        if randomElement.answer2 == randomElement.correctAnswer {
            fillNewQuest()
        }
        else {
            results.append(Result(coutOfCorrectAnswers: coutOfCorrectAnswers, countOfQuestions: questions.count, timeOfGame: Int(NSDate().timeIntervalSince1970) - start))
            returnToMainVC()
        }
    }
    @IBAction func button3Touched(_ sender: Any) {
        if randomElement.answer3 == randomElement.correctAnswer {
            fillNewQuest()
        }
        else {
            results.append(Result(coutOfCorrectAnswers: coutOfCorrectAnswers, countOfQuestions: questions.count, timeOfGame: Int(NSDate().timeIntervalSince1970) - start))
            returnToMainVC()
        }
    }
    @IBAction func button4Touched(_ sender: Any) {
        if randomElement.answer4 == randomElement.correctAnswer {
            fillNewQuest()
        }
        else {
            results.append(Result(coutOfCorrectAnswers: coutOfCorrectAnswers, countOfQuestions: questions.count, timeOfGame: Int(NSDate().timeIntervalSince1970) - start))
            returnToMainVC()
        }
    }
}
