//
//  displayFavoriteSong.swift
//  songSmash
//
//  Created by TY on 12/11/2024.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var favoriteTableView: UITableView!
    
    var favoriteSongs: [String] = []
        var questions = ["Câu hỏi 1", "Câu hỏi 2", "Câu hỏi 3"]
        var songNames = ["Bài hát 1", "Bài hát 2", "Bài hát 3"]
        var currentQuestionIndex = 0
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            favoriteTableView.dataSource = self
            favoriteTableView.delegate = self
        }
    @IBAction func addButtonTapped(_ sender: UIButton) {
            let currentSongName = songNames[currentQuestionIndex]
            if !favoriteSongs.contains(currentSongName) {
                favoriteSongs.append(currentSongName)
                favoriteTableView.reloadData()  // Tải lại TableView để cập nhật danh sách
            }
        }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteSongCell", for: indexPath)
                cell.textLabel?.text = favoriteSongs[indexPath.row]
                return cell
    }
}
