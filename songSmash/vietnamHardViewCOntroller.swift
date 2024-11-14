//
//  vietnamHardViewCOntroller.swift
//  songSmash
//
//  Created by TY on 10/11/2024.
//

import UIKit

protocol FavoriteSongDelegate: AnyObject {
    func didAddFavoriteSong(songName: String, artist: String)
}
class vietnamHardViewController: UIViewController {
    weak var delegate: FavoriteSongDelegate?

    

    var vietnamHardsongNames = ["Bài hát 1", "Bài hát 2", "Bài hát 3"]
    var currentQuestionIndex = 0
    var selectedMusicType = ""
    var selectedMode = ""



    @IBOutlet weak var quesNumberLabel: UILabel!
    @IBOutlet weak var ansSubmitBtn: UIButton!
    @IBOutlet weak var questionLabel3: UILabel!
    
    @IBOutlet weak var answerTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hiển thị câu hỏi
        questionLabel3.text = "Câu hỏi \(currentQuestionIndex + 1)/7: \(vietnamHardsongNames[currentQuestionIndex])"
    }

    @IBAction func submitAnswer(_ sender: UIButton) {
        let enteredAnswer = answerTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        if enteredAnswer?.lowercased() == vietnamHardsongNames[currentQuestionIndex].lowercased() {
            // Nếu đúng, lưu vào danh sách yêu thích
            delegate?.didAddFavoriteSong(songName: vietnamHardsongNames[currentQuestionIndex], artist: "Vietnam")
        }

        currentQuestionIndex += 1
        if currentQuestionIndex < vietnamHardsongNames.count {
            questionLabel3.text = "Câu hỏi \(currentQuestionIndex + 1)/7: \(vietnamHardsongNames[currentQuestionIndex])"
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
