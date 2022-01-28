//
//  DetailViewController.swift
//  TVShow
//
//  Created by Eureka Tatsu on 1/27/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var characterTableView: UITableView!
    
    
    var detailViewFilmID: String = ""
    var detailViewTitle: String = ""
    var detailViewReleaseDate: String = ""
    var detailViewEpisode: Int = 0
    var detailViewDirector: String = ""
    var detailViewCharacter: [AllFilmsQuery.Data.AllFilm.Film.CharacterConnection.Character?] = []
    
    
    override func viewDidLoad() {
        print(detailViewFilmID)
        print(detailViewTitle)
        print(detailViewReleaseDate)
        print(detailViewEpisode)
        filmTitle.text = detailViewTitle
        episodeLabel.text = String(detailViewEpisode)
        releaseDateLabel.text = detailViewReleaseDate
        directorLabel.text = detailViewDirector
        infoView.layer.cornerRadius = 10
        characterTableView.layer.cornerRadius = 10
        print("This is from DVC\(detailViewCharacter)")
        characterTableView.delegate = self
        characterTableView.dataSource = self
    }
}

extension DetailViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewCharacter.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        cell.textLabel?.text = detailViewCharacter[indexPath.row]?.name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12.0)
        cell.selectionStyle = .none
        return cell

    }

}



