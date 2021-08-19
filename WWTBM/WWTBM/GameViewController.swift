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

    @IBOutlet weak var percentsLabel: UILabel!
    let inCourseStrategy = InCourceStrategy()
    let randomStrategy = RandomStrategy()
    var start: Int = 0
    let questions: [Question] = QuestionsStorage().questions
    
    var randomElement = Question(question: "", answer1: "", answer2: "", answer3: "", answer4: "", correctAnswer: "")
    var countOfCorrectAnswers: Int = 0 {
        didSet {
            let qc = Double(questions.count)
            let coca = Double(countOfCorrectAnswers - 1)
            
            self.percentsLabel.text = String(Int((coca/qc)*100)) + "%"
        }
    }
    
    private(set) var results: [Result] = ResultsCareTaker().retrieveRecords() {
        didSet {
            ResultsCareTaker().save(results: self.results)
        }
    }
    
    func fillNewQuest() {
        countOfCorrectAnswers += 1
        if SubsequenceSettingsCareTaker().retrieveRecords() == .inCource {
            if let privateRandomElement = inCourseStrategy.GetQuestion() {
                randomElement = privateRandomElement
            }
            else {
                let alert = UIAlertController(title: "YOU WON!!!", message: "You answer to all questions its great job!", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))


                self.present(alert, animated: true)

                returnToMainVC()
            }
        }
        else if SubsequenceSettingsCareTaker().retrieveRecords() == .random {
            if let privateRandomElement = randomStrategy.GetQuestion() {
                randomElement = privateRandomElement
            }
            else {
                let alert = UIAlertController(title: "YOU WON!!!", message: "You answer to all questions its great job!", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))


                self.present(alert, animated: true)
                returnToMainVC()
            }
        }
            
        questionLabel.text = randomElement.question
        answer1Button.setTitle(" A: \(randomElement.answer1 )", for: .normal)
        answer2Button.setTitle(" B: \(randomElement.answer2 )", for: .normal)
        answer3Button.setTitle(" C: \(randomElement.answer3 )", for: .normal)
        answer4Button.setTitle(" D: \(randomElement.answer4 )", for: .normal)
        
        
    }
    func returnToMainVC() {
        let alert = UIAlertController(title: "You lose", message: "You can try play again!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
        
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
    override func viewDidLoad() {


        answer1Button.layer.cornerRadius = 20
        answer2Button.layer.cornerRadius = 20
        answer3Button.layer.cornerRadius = 20
        answer4Button.layer.cornerRadius = 20
        
        super.viewDidLoad()
        fillNewQuest()
        start = Int(NSDate().timeIntervalSince1970)
    }
    @IBAction func button1Touched(_ sender: Any) {
        if randomElement.answer1 == randomElement.correctAnswer {
            fillNewQuest()
        }
        else {
            results.append(Result(countOfCorrectAnswers: countOfCorrectAnswers, countOfQuestions: questions.count, timeOfGame: Int(NSDate().timeIntervalSince1970) - start))
            returnToMainVC()
        }
    }
    @IBAction func button2Touched(_ sender: Any) {
        if randomElement.answer2 == randomElement.correctAnswer {
            fillNewQuest()
        }
        else {
            results.append(Result(countOfCorrectAnswers: countOfCorrectAnswers, countOfQuestions: questions.count, timeOfGame: Int(NSDate().timeIntervalSince1970) - start))
            returnToMainVC()
        }
    }
    @IBAction func button3Touched(_ sender: Any) {
        if randomElement.answer3 == randomElement.correctAnswer {
            fillNewQuest()
        }
        else {
            results.append(Result(countOfCorrectAnswers: countOfCorrectAnswers, countOfQuestions: questions.count, timeOfGame: Int(NSDate().timeIntervalSince1970) - start))
            returnToMainVC()
        }
    }
    @IBAction func button4Touched(_ sender: Any) {
        if randomElement.answer4 == randomElement.correctAnswer {
            fillNewQuest()
        }
        else {
            results.append(Result(countOfCorrectAnswers: countOfCorrectAnswers, countOfQuestions: questions.count, timeOfGame: Int(NSDate().timeIntervalSince1970) - start))
            returnToMainVC()
        }
    }
}
