//
//  GOTDetailController.swift
//  GameOfThrones
//
//  Created by Diego Estrella III on 11/17/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GOTDetailController: UIViewController {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeRuntime: UILabel!
    @IBOutlet weak var episodeAirdate: UILabel!
    @IBOutlet weak var episodeSummary: UITextView!
    
    var gotEpisodes: GOTEpisode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGOTUI()
    }
    
    private func updateGOTUI() {
        episodeImage.image = UIImage(named: (gotEpisodes.originalImageID))
        episodeName.text = gotEpisodes.name
        episodeSeason.text = "Season: \(gotEpisodes.season)"
        episodeNumber.text = "Episode: \(gotEpisodes.number)"
        episodeRuntime.text = "Runtime: \(gotEpisodes.runtime) minuets"
        episodeAirdate.text = gotEpisodes.airdate
        episodeSummary.text = gotEpisodes.summary
        
        
    }

}
