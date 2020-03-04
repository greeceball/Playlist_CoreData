//
//  SongController.swift
//  PlaylistCoredata
//
//  Created by Colby Harris on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation

class SongController {
    
    
    //MARK: - CRUD
    
    func createSong(with title: String, and artist: String, addTo playlist: Playlist) {
        Song(name: title, artistName: artist, playList: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    func deleteSong(song: Song) {
        CoreDataStack.context.delete(song)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
}
