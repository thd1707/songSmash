//
//  englishHardViewControlelr.swift
//  songSmash
//
//  Created by TY on 10/11/2024.
//

import UIKit


class englishHardViewController: UIViewController {
    
    struct Question {
        let songFile: String
        let correctAnswer: String
    }
    var questions: [Question] = []
    var currentQuestionIndex = 0
    var selectedMusicType = ""
    var selectedMode = ""
    
    @IBOutlet weak var quesNumberLabel2: UILabel!
    
    
    @IBOutlet weak var ansSubmitBtn2: UIButton!
    @IBOutlet weak var ansTextField2: UITextField!
    @IBOutlet weak var quesLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
        displayCurrentQuestion()
    }
    func loadQuestions() {
        questions = [
            Question(songFile: "Car outside.mp3", correctAnswer: "car's outside"),
            Question(songFile: "Boy for the weekend.mp3", correctAnswer: "boy for the weekend"),Question(songFile: "Nobody gets me.mp3", correctAnswer: "nobody gets me"),Question(songFile: "Thinking out loud.mp3", correctAnswer: "thinking out loud"),Question(songFile: "Die with a smile.mp3", correctAnswer: "die with a smile"),Question(songFile: "The cutest pair.mp3", correctAnswer: "the cutest pair"),Question(songFile: "Happier.mp3", correctAnswer: "happier"),
            
        ]
    }
    func displayCurrentQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        quesLabel2.text = "Guess the song: \(currentQuestion.songFile)"
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let userAnswer = ansTextField2.text else { return }
                let correctAnswer = questions[currentQuestionIndex].correctAnswer

                if userAnswer.lowercased() == correctAnswer.lowercased() {
                    print("Correct!")
                } else {
                    print("Wrong!")
                }

                currentQuestionIndex += 1
                if currentQuestionIndex < questions.count {
                    displayCurrentQuestion()
                    ansTextField2.text = ""
                } else {
                   
                    let alert = UIAlertController(title: "Game Over", message: "You have finished the game.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
            }
    
    
    
}


 
