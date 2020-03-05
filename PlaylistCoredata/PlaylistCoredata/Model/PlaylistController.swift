//
//  PlaylistController.swift
//  PlaylistCoredata
//
//  Created by Colby Harris on 3/4/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    //MARK: - Singleton (when allowing user to create and delete)
    static let sharedInstance = PlaylistController()

    var fetchResultsController: NSFetchedResultsController<Playlist>
    
    //MARK: - Source Of Truth
    init() {
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let resultsController: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultsController = resultsController
        
            do {
                try fetchResultsController.performFetch()
            }catch {
                print("There was an error performing the fetch. \(error.localizedDescription) \(#function)")
            }
    
    }
    
    //MARK: - CRUD
    
    func createPlaylist(with name: String) {
        Playlist(name: name)
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlist: Playlist) {
        playlist.managedObjectContext?.delete(playlist)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore(){
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error saving the data!!!\(#function) \(error.localizedDescription)")
        }
    }
}
