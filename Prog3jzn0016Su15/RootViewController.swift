//
//  RootViewController.swift
//  Prog3jzn0016Su15
//
//  Created by Jeffrey Nolen on 7/12/15.
//  Copyright (c) 2015 Jeffrey Nolen. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    private var cellPointSize: CGFloat!
    private var albumsList: AlbumList!
    private let albumCell = "Album"
    
    @IBOutlet var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferredTableViewFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        cellPointSize = preferredTableViewFont.pointSize
        albumsList = AlbumList.sharedAlbumList
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        navigationItem.rightBarButtonItem = editButtonItem()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        albumsList.saveData()
        tableView.reloadData()
    }
        
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return albumsList.albums.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Albums"
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let cell = myTableView.dequeueReusableCellWithIdentifier(albumCell, forIndexPath: indexPath) as! UITableViewCell
            //cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
            cell.textLabel?.text = albumsList.albums[indexPath.row].name
        cell.detailTextLabel?.text = albumsList.albums[indexPath.row].artist
            return cell
           }
    
    @IBAction func addNewAlbumAction(sender: UIBarButtonItem) {
        var newAlbum = Album(nameIn: "New Title", yearIn: "New Year", artistIn: "New Artist", labelIn: "New Label")
        albumsList.addAlbum(newAlbum)
        
        self.myTableView.reloadData()
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
        let albumListVC = segue.destinationViewController as! AlbumEntryViewController
        
        albumListVC.yearString = albumsList.albums[indexPath.row].year
        albumListVC.titleString = albumsList.albums[indexPath.row].name
        albumListVC.artistString = albumsList.albums[indexPath.row].artist
        albumListVC.labelString = albumsList.albums[indexPath.row].label
        albumListVC.indexPath = indexPath.row
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            albumsList.removeAlbum(indexPath.row)
            myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
        
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        albumsList.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    

    
}

