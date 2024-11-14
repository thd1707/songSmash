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
        var segueIdentifier = ""

            if selectedMode == "Easy" && selectedMusicType == "Vietnamese" {
                segueIdentifier = "toVietnameseEasy"
            } else if selectedMode == "Hard" && selectedMusicType == "Vietnamese" {
                segueIdentifier = "toVietnameseHard"
            } else if selectedMode == "Easy" && selectedMusicType == "US-UK" {
                segueIdentifier = "toUSUKEasy"
            } else if selectedMode == "Hard" && selectedMusicType == "US-UK" {
                segueIdentifier = "toUSUKHard"
            }
            
            performSegue(withIdentifier: segueIdentifier, sender: self)
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVietnameseEasy" {
            if let destinationVC = segue.destination as? vietnamEasyViewController {
                destinationVC.selectedMode = "Easy"
                destinationVC.selectedMusicType = "Vietnamese"
            }
        } else if segue.identifier == "toVietnameseHard" {
            if let destinationVC = segue.destination as? vietnamHardViewController {
                destinationVC.selectedMode = "Hard"
                destinationVC.selectedMusicType = "Vietnamese"
            }
        } else if segue.identifier == "toUSUKEasy" {
            if let destinationVC = segue.destination as? englishEasyViewController {
                destinationVC.selectedMode = "Easy"
                destinationVC.selectedMusicType = "English"
            }
        } else if segue.identifier == "toUSUKHard" {
            if let destinationVC = segue.destination as? englishHardViewController {
                destinationVC.selectedMode = "Hard"
                destinationVC.selectedMusicType = "English"
            }
        }
    }
}

