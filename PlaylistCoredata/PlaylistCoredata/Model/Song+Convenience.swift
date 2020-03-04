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
    convenience init(name: String, artistName: String, moc: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: moc)
        self.title = name
        self.artist = artistName
        self.playlist = playlist
        
    }
}
