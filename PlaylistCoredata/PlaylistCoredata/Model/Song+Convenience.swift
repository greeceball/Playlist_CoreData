//
//  Song+Convenience.swift
//  PlaylistCoredata
//
//  Created by Colby Harris on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    @discardableResult
    convenience init(name: String, artistName: String, playList: Playlist, moc: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: moc)
        self.title = name
        self.artist = artistName
        self.playlist = playList
        
    }
}
