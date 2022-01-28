//
//  ViewController.swift
//  TVShow
//
//  Created by Eureka Tatsu on 1/26/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var films: [AllFilmsQuery.Data.AllFilm.Film] = []
   
    
   
    @IBOutlet weak var filmsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filmsTableView.delegate = self
        self.filmsTableView.dataSource = self
        filmsTableView.layer.cornerRadius = 10
        loadData()
    }
    
//    @IBSegueAction func toDetailView(_ coder: NSCoder, sender: Any?) -> DetailViewController? {
//        guard
//          let cell = sender as? UITableViewCell,
//          let indexPath = filmsTableView.indexPath(for: cell)
//          else {
//            return nil
//        }
//        return DetailViewController(film: films[indexPath.row], coder: coder)
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmsCell", for: indexPath)
        as! FilmsTableViewCell
          let film = films[indexPath.row]
          cell.textLabel?.text = film.title
          cell.dateLabel.text = film.releaseDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let id = films[indexPath.row].id
        let title = films[indexPath.row].title
        let releaseDate = films[indexPath.row].releaseDate
        let episode = films[indexPath.row].episodeId
        let director = films[indexPath.row].director
        let characters = films[indexPath.row].characterConnection?.characters
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.detailViewFilmID = id
        vc?.detailViewTitle = title!
        vc?.detailViewReleaseDate = releaseDate!
        vc?.detailViewEpisode = episode!
        vc?.detailViewDirector = director!
        vc?.detailViewCharacter = characters!
        self.navigationController?.pushViewController(vc!, animated: true)

    }
    
   

    

}

extension ViewController {
  func loadData() {
      let query = AllFilmsQuery()
      Apollo.shared.client.fetch(query: query) { result in
        switch result {
        case .success(let graphQLResult):
            if let films = graphQLResult.data?.allFilms?.films?.compactMap({ $0 }) {
            self.films = films
            self.filmsTableView.reloadData()
          }

        case .failure(let error):
          print("Error loading data \(error)")
        }
      }

  }
}



