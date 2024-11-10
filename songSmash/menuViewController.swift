//
//  ViewController.swift
//  songSmash
//
//  Created by TY on 10/11/2024.
//

import UIKit

class menuViewController: UIViewController {
    
    @IBOutlet weak var vietnamBtn: UIButton!
    
    @IBOutlet weak var englishBtn: UIButton!
    
    
    @IBOutlet weak var easyBtn: UIButton!
    
    @IBOutlet weak var hardBtn: UIButton!
    
    @IBOutlet weak var playBtn: UIButton!
    
    var selectedMusicType = ""
    var selectedMode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func selectMusicType(_ sender: UIButton) {
        if sender == englishBtn {
            selectedMusicType = "US-UK"
            englishBtn.backgroundColor = .red
            vietnamBtn.backgroundColor = .clear
        } else if sender == vietnamBtn {
            selectedMusicType = "Vietnamese"
            vietnamBtn.backgroundColor = .red
            englishBtn.backgroundColor = .clear
        }
    }
    
    @IBAction func selectMode(_ sender: UIButton) {
        if sender == easyBtn {
            selectedMode = "Easy"
            easyBtn.backgroundColor = .red
            hardBtn.backgroundColor = .clear
        } else if sender == hardBtn {
            selectedMode = "Hard"
            hardBtn.backgroundColor = .red
            easyBtn.backgroundColor = .clear
        }
    }
    @IBAction func playButtonTapped(_sender: UIButton) {
        if selectedMusicType.isEmpty || selectedMode.isEmpty {
            let alert = UIAlertController(title: "Chọn thiếu", message: "Vui lòng chọn cả thể loại nhạc và cấp đọ chơi", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            
        }
    }
}

