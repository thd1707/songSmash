//
//  englishEasyViewController.swift
//  songSmash
//
//  Created by TY on 10/11/2024.
//

import UIKit
import AVFoundation

class englishEasyViewController: UIViewController {
    
    struct Question1 {
        let songFile: String
        let correctAnswer: String
        let wrongAnswers: [String]
    }
    
    var questions: [Question1] = [
        Question1(songFile: "Love story.mp3", correctAnswer: "Love Story - Taylor Swift", wrongAnswers: ["Die With A Smile - Lady Gaga & bruno Mars", "Lover - Taylor Swift", "I Love You So - The Walters"]),
        Question1(songFile: "Baby.mp3", correctAnswer: "Baby - Justin Bieber", wrongAnswers: ["Snooze - SZA", "Astronomy - Conan Gray", "Photograph - Ed Sheeran"]),Question1(songFile: "The lazy song.mp3", correctAnswer: "The Lazy Song - Bruno Mars", wrongAnswers: ["Kill Bill - SZA", "Night Changes - One Direction", "Yellow - ColdPlay"]),Question1(songFile: "Espresso.mp3", correctAnswer: "Espresso - Sabrina Carpenter", wrongAnswers: ["Good Days - SZA", "Love Yourself - Justin Bieber", "Heather - Conan Gray"]),Question1(songFile: "Lemon tree.mp3", correctAnswer: "Lemon Tree - Fool's Gardens", wrongAnswers: ["August - Taylor Swift", "Honesty - Pink Sweat$", "Positions - Ariana Grande"]),Question1(songFile: "Last christmas.mp3", correctAnswer: "Last Christmas - Wham!", wrongAnswers: ["Not Angry - Chris James", "Close - The Chainsmokers"]),Question1(songFile: "Happier.mp3", correctAnswer: "Happier - Olivia Rodrigo", wrongAnswers: ["That Should Be Me - Justin Bieber", "Perfect - Ed Sheeran", "As It Was - Harry Styles"]),
    ]
    
    var currentQuestion1Index = 0
    var audioPlayer: AVAudioPlayer?
    var selectedMusicType = ""
    var selectedMode = ""
    
    @IBOutlet weak var quesNumber2: UILabel!
    
    @IBOutlet weak var quesLabel2: UILabel!
    
    @IBOutlet weak var answer1Btn: UIButton!
    
    @IBOutlet weak var answer2Btn: UIButton!
    
    @IBOutlet weak var answer3Btn: UIButton!
    
    @IBOutlet weak var answer4Btn: UIButton!
    
    @IBOutlet weak var mySwitch2: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.shuffle()
        mySwitch2.isOn = false
        func switchValueChanged(_ sender: UISwitch) {
             
                print("Switch is \(sender.isOn ? "on" : "off")")
            }
        
        loadCurrentQuestion1()
    }
    
    func loadCurrentQuestion1() {
        let currentQuestion = questions[currentQuestion1Index]
        let songFile = currentQuestion.songFile
        
        if let songURL = Bundle.main.url(forResource: songFile, withExtension: nil) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: songURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Không thể tải nhạc: \(error)")
            }
        }
        
        updateAnswerButtons(for: currentQuestion)
    }
    func updateAnswerButtons(for question: Question1) {
        var allAnswers = question.wrongAnswers + [question.correctAnswer]
        allAnswers.shuffle()
        
        
        answer1Btn.setTitle(allAnswers[0], for: .normal)
        answer2Btn.setTitle(allAnswers[1], for: .normal)
        answer3Btn.setTitle(allAnswers[2], for: .normal)
        answer4Btn.setTitle(allAnswers[3], for: .normal)
    }
    
    @IBAction func toggleMusic(_ sender: UISwitch) {
        if sender.isOn {
                audioPlayer?.play()
            } else {
                audioPlayer?.pause()
            }
    }
    @IBAction func answerSelected(_ sender: UIButton) {
        guard let selectedAnswer = sender.titleLabel?.text else { return }
        let correctAnswer = questions[currentQuestion1Index].correctAnswer
        
        if selectedAnswer == correctAnswer {
            
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        // Chuyển sang câu hỏi tiếp theo sau một khoảng thời gian ngắn
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.moveToNextQuestion()
        }
    }
    func moveToNextQuestion() {
        answer1Btn.backgroundColor = .clear
        answer2Btn.backgroundColor = .clear
        answer3Btn.backgroundColor = .clear
        answer4Btn.backgroundColor = .clear

        currentQuestion1Index += 1
        
        if currentQuestion1Index < questions.count {
            loadCurrentQuestion1()
        } else {
           
        }
    }
}


