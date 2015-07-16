//
//  AlbumEntryViewController.swift
//  Prog3jzn0016Su15
//
//  Created by Jeffrey Nolen on 7/12/15.
//  Copyright (c) 2015 Jeffrey Nolen. All rights reserved.
//

import UIKit

class AlbumEntryViewController: UIViewController {
   
    private var albumsList: AlbumList!
    private var yearString:String!
    private var titleString:String!
    private var artistString:String!
    private var labelString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
    }
    @IBAction func artistAction(sender: UITextField) {
    }
    @IBAction func titleAction(sender: UITextField) {
    }
    @IBAction func labelAction(sender: UITextField) {
    }
}