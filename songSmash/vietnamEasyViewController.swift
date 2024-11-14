//
//  vietnamEasyViewController.swift
//  songSmash
//
//  Created by TY on 10/11/2024.
//

import UIKit
import AVFoundation

class vietnamEasyViewController: UIViewController {
    
    struct Question {
        let songFile: String
        let correctAnswer: String
        let wrongAnswers: [String]
    }
    
    var questions: [Question] = [
        Question(songFile: "Buồn hay vui.mp3", correctAnswer: "Buồn Hay Vui - Obito", wrongAnswers: ["Đừng Làm Trái Tim Anh Đau - Sơn Tùng MTP", "Thằng Điên - Justatee & Phương Ly", "Nếu lúc đó - Tlinh"]),
        Question(songFile: "Đừng làm trái tim anh đau.mp3", correctAnswer: "Đừng Làm Trái Tim Anh Đau - Sơn Tùng MTP", wrongAnswers: ["Không Thể Say - Hieuthuhai", "Tay To - MCK", "Vì Anh Đâu Có Biết - Vũ"]),Question(songFile: "Lạ lùng.mp3", correctAnswer: "Lạ Lùng - Vũ", wrongAnswers: ["Buồn Hay Vui - Obito", "Đại Lộ Mặt Trời - Chilies", "BADBYE - Wean"]),Question(songFile: "Không thể say.mp3", correctAnswer: "Không Thể Say - Hieuthuhai", wrongAnswers: ["Simple Love - Obito", "Exit Sign - Hieuthuhai", "Đừng Làm Trái Tim Anh Đau - Sơn Tùng MTP"]),Question(songFile: "Thằng điên.mp3", correctAnswer: "Thằng Điên - Justatee & Phương Ly", wrongAnswers: ["Bước Qua Mùa Cô Đơn - Vũ", "Ngày Đẹp Trời Để Nói Chia Tay - Lou Hoàng", "Bầu Trời Mới - DA LAB"]),Question(songFile: "Nàng thơ.mp3", correctAnswer: "Nàng Thơ - Hoàng Vũ", wrongAnswers: ["Thế Thôi - Haisam", "Bận Lòng - Pay", "Tay To - MCK"]),Question(songFile: "Ex hate me.mp3", correctAnswer: "Ex's Hate Me - Amee & B-ray", wrongAnswers: ["Simple Love - Obito", "Không Thể Say - Hieuthuhai", "Phóng ZÌN ZIN - Tlinh"]),
    ]
    
    var currentQuestionIndex = 0
    var audioPlayer: AVAudioPlayer?
    var selectedMusicType = ""
    var selectedMode = ""
    
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var quesNumber: UILabel!
    
    @IBOutlet weak var answerABtn: UIButton!
    
    @IBOutlet weak var answerBBtn: UIButton!
    
    @IBOutlet weak var answerCBtn: UIButton!
    
    @IBOutlet weak var answerDBtn: UIButton!
    @IBOutlet weak var quesLabel: UILabel!
    
    @IBOutlet weak var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.shuffle()
        mySwitch.isOn = false
        func switchValueChanged(_ sender: UISwitch) {
             
                print("Switch is \(sender.isOn ? "on" : "off")")
            }
        
        loadCurrentQuestion()
    }
    
    func loadCurrentQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
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
    func updateAnswerButtons(for question: Question) {
        var allAnswers = question.wrongAnswers + [question.correctAnswer]
        allAnswers.shuffle()
        
        
        answerABtn.setTitle(allAnswers[0], for: .normal)
        answerBBtn.setTitle(allAnswers[1], for: .normal)
        answerCBtn.setTitle(allAnswers[2], for: .normal)
        answerDBtn.setTitle(allAnswers[3], for: .normal)
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
        let correctAnswer = questions[currentQuestionIndex].correctAnswer
        
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
        answerABtn.backgroundColor = .clear
        answerBBtn.backgroundColor = .clear
        answerCBtn.backgroundColor = .clear
        answerDBtn.backgroundColor = .clear

        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            loadCurrentQuestion()
        } else {
           
        }
    }
}
