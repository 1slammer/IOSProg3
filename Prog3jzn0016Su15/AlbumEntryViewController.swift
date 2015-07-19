//
//  AlbumEntryViewController.swift
//  Prog3jzn0016Su15
//
//  Created by Jeffrey Nolen on 7/12/15.
//  Copyright (c) 2015 Jeffrey Nolen. All rights reserved.
//

import UIKit

class AlbumEntryViewController: UIViewController, UITextFieldDelegate {
   
    private var albumsList: AlbumList!
    var yearString:String!
    var titleString:String!
    var artistString:String!
    var labelString:String!
    var indexPath:Int!
    var oldVals: [String]!
    var cancelPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleOutlet.text = titleString
        titleOutlet.delegate = self
        labelOutlet.delegate = self
        yearOutlet.delegate = self
        artistOutlet.delegate = self
        artistOutlet.text = artistString
        yearOutlet.text = yearString
        labelOutlet.text = labelString
        oldVals = [titleString, artistString, yearString, labelString]
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: Selector("cancelAction:"))
        self.navigationItem.rightBarButtonItem = cancelButton
        albumsList = AlbumList.sharedAlbumList
            }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    @IBOutlet weak var titleOutlet: UITextField!
    @IBOutlet weak var artistOutlet: UITextField!
    
    @IBOutlet weak var yearOutlet: UITextField!
    @IBOutlet weak var labelOutlet: UITextField!
    // MARK: - Table view data source
    
    @IBAction func yearAction(sender: UITextField) {
        if (!cancelPressed){

        albumsList.albums[indexPath].year = yearOutlet.text
        }
        
    }
    @IBAction func artistAction(sender: UITextField) {
        if (!cancelPressed){

        albumsList.albums[indexPath].artist = artistOutlet.text
        }
    }
    @IBAction func titleAction(sender: UITextField) {
        if (!cancelPressed){

        albumsList.albums[indexPath].name = titleOutlet.text
        }
    }
    @IBAction func labelAction(sender: UITextField) {
        if (!cancelPressed){
        albumsList.albums[indexPath].label = labelOutlet.text
        }
    }
    
    @IBAction func cancelAction(sender: UIBarButtonItem) {
        cancelPressed = true
        albumsList.albums[indexPath].year = oldVals[2]
        albumsList.albums[indexPath].label = oldVals[3]
        albumsList.albums[indexPath].artist = oldVals[1]
        albumsList.albums[indexPath].name = oldVals[0]
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}