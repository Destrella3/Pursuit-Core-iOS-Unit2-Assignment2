//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
  //  private var refreshControl: UIRefreshControl!
    
    var gotEpisodes = GOTEpisode.allEpisodes
    var arrayOfSeasons = [
        GOTEpisode.allEpisodes.filter{$0.season == 1},GOTEpisode.allEpisodes.filter{$0.season == 2}, GOTEpisode.allEpisodes.filter{$0.season == 3}, GOTEpisode.allEpisodes.filter{$0.season == 4},GOTEpisode.allEpisodes.filter{$0.season == 5}, GOTEpisode.allEpisodes.filter{$0.season == 6},GOTEpisode.allEpisodes.filter{$0.season == 7}]

    private func setupProtocols() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
//    private func setupRefreshControl () {
//        refreshControl = UIRefreshControl()
//        mainTableView.refreshControl = refreshControl
//        refreshControl.addTarget(self, action: #selector(fetchEpisodes), for: .valueChanged)
//    }
    
//    @objc private func fetchEpisodes() {
//        refreshControl.endRefreshing()
//        gotEpisodes = GOTEpisode.allEpisodes
//    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
       // gotEpisodes = GOTEpisode.allEpisodes
        setupProtocols()
//        setupRefreshControl()
    
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? GOTDetailController,
        let cellSelected = mainTableView.indexPathForSelectedRow else {return}
        let gotSelected = gotEpisodes[cellSelected.row]
        destination.gotEpisodes = gotSelected
    }
}

extension GOTViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let got = gotEpisodes[indexPath.row]
        if got.season % 2 == 0 {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: "GoTCell", for: indexPath) as? GOTCell else {return UITableViewCell()}
        let episodeToSet = gotEpisodes[indexPath.row]
        cell.gotImage.image = UIImage(named: episodeToSet.originalImageID)
        cell.gotName.text = episodeToSet.name
        cell.gotSeasonAndEpisode.text = "S:\(episodeToSet.season) E:\(episodeToSet.number)"
        return cell
        } else {
            guard let cell = mainTableView.dequeueReusableCell(withIdentifier: "GOTCell", for: indexPath) as? GOTCell else {return UITableViewCell()}
            let episodeToSet = gotEpisodes[indexPath.row]
            cell.gotImage.image = UIImage(named: episodeToSet.originalImageID)
            cell.gotName.text = episodeToSet.name
            cell.gotSeasonAndEpisode.text = "S:\(episodeToSet.season) E:\(episodeToSet.number)"
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return arrayOfSeasons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
}

extension GOTViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

