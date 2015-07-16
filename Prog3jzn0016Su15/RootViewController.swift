//
//  RootViewController.swift
//  Prog3jzn0016Su15
//
//  Created by Jeffrey Nolen on 7/12/15.
//  Copyright (c) 2015 Jeffrey Nolen. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    private var cellPointSize: CGFloat!
    private var albumsList: AlbumList!
    private var albums:[Album]!
    private let albumCell = "Album"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferredTableViewFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize = preferredTableViewFont.pointSize
        albumsList = AlbumList.sharedAlbumList
        albums = albumsList.albums
       
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return albumsList.albums.isEmpty ? 1 : 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return section == 0 ? albums.count : 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Albums"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // The font names list
            let cell = tableView.dequeueReusableCellWithIdentifier(albumCell, forIndexPath: indexPath) as! UITableViewCell
            //cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
            cell.textLabel?.text = albums[indexPath.row].name
            cell.detailTextLabel?.text = albums[indexPath.row].artist
            return cell
        } else {
            // The favorites list
            return tableView.dequeueReusableCellWithIdentifier(albumCell, forIndexPath: indexPath) as! UITableViewCell
        }
    }
    
    @IBAction func addNewAlbumAction(sender: UIBarButtonItem) {
        var newAlbum = Album(nameIn: "New Title", yearIn: "New Year", artistIn: "New Artist", labelIn: "New Label")
        albumsList.addAlbum(newAlbum)
    }
    
    func saveData(albumObject: Album) {
        var archiveArray = NSMutableArray(capacity: albums.count)
        for a in albums {
            var albumEncodedObject = NSKeyedArchiver.archivedDataWithRootObject(a)
            archiveArray.addObject(albumEncodedObject)
        }
    
        var userData = NSUserDefaults()
        userData.setObject(archiveArray, forKey: "albums")
        userData.synchronize()
    }
    // MARK: Navigation
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
//        let listVC = segue.destinationViewController as! FontListViewController
//        
//        if indexPath.section == 0 {
//            // Font names list
//            let familyName = familyNames[indexPath.row]
//            listVC.fontNames = sorted(UIFont.fontNamesForFamilyName(familyName) as! [String])
//            listVC.navigationItem.title = familyName
//            listVC.showsFavorites = false
//        } else {
//            // Favorites list
//            listVC.fontNames = favoritesList.favorites
//            listVC.navigationItem.title = "Favorites"
//            listVC.showsFavorites = true
//        }
//    }

    
}

