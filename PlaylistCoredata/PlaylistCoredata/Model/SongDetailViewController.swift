//
//  SongDetailViewController.swift
//  PlaylistCoredata
//
//  Created by Colby Harris on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {

    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //landing pad
    var playlist: Playlist?
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self //Delegate
        tableView.dataSource = self //Delegate
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addbuttonTapped(_ sender: Any) {
        guard let playlist = playlist, let songName = songNameTextField.text, let artistName = artistNameTextField.text else { return }
        SongController.createSong(with: artistName, and: songName, addTo: playlist)
        
        songNameTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()

    }
}//eoc



extension SongDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let playlist = self.playlist else {return 0}
        return playlist.songs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        guard let playlist = self.playlist else {return UITableViewCell()}
        if let song = playlist.songs?[indexPath.row] as? Song {
            cell.textLabel?.text = song.artist
            cell.detailTextLabel?.text = song.title
        }
        return cell
    }
}

extension SongDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist, let song = playlist.songs?[indexPath.row] as? Song else {return}
            SongController.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
