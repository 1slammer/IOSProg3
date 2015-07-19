//
//  AlbumList.swift
//  Prog3jzn0016Su15
//
//  Created by Jeffrey Nolen on 7/12/15.
//  Copyright (c) 2015 Jeffrey Nolen. All rights reserved.
//

import Foundation
import UIKit

class AlbumList {
    class var sharedAlbumList : AlbumList {
        struct Singleton {
            static let instance = AlbumList()
        }
        return Singleton.instance;
    }
    private(set) var albums:[Album]
    
    init() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let storedAlbums = defaults.objectForKey("albums") as? [String]
        func convertArraytoAlbums(arrayIn:[String]) -> [Album]! {
            var array = [Album]()
            for var a = 0; a < (arrayIn.count / 4); a++ {
                var name = arrayIn[a]
                var artist = arrayIn[a+1]
                var label = arrayIn[a+2]
                var year = arrayIn[a+3]
                var locAlbum = Album(nameIn: name, yearIn: year, artistIn: artist, labelIn: label)
                array.append(locAlbum)
                
            }
            return array
        
            
        }

        let myAlbums = storedAlbums != nil ? convertArraytoAlbums(storedAlbums!) : []
        albums = myAlbums != nil ? myAlbums : []

    }
    
    func addAlbum(albumIn: Album) {
        if (!contains(albums, albumIn)) {
            albums.append(albumIn)
                savealbums()
        }
    }

    func removeAlbum(index: Int) {
                albums.removeAtIndex(index)
        
            savealbums()
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = albums[from]
        albums.removeAtIndex(from)
        albums.insert(item, atIndex: to)
        savealbums()
    }
    
    private func savealbums() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let array = convertAlbumstoArray()
        defaults.setObject(array, forKey: "albums")
        defaults.synchronize()
    }
    func saveData() {
        savealbums()
    }
    
    private func convertAlbumstoArray() -> [String]{
        var array = [String] (count:albums.count*4, repeatedValue:" ")
        for var a = 0; a < albums.count; a++ {
            var element = albums[a]
            array[a] = element.name
            array[a+1] = element.artist
            array[a+2] = element.label
            array[a+3] = element.year
            
        }
        return array
    }
    private func convertArraytoAlbums(arrayIn:[String]) -> [Album]! {
        var array:[Album]!
        for var a = 0; a < arrayIn.count; a++ {
            var name = arrayIn[a]
            var artist = arrayIn[a+1]
            var label = arrayIn[a+2]
            var year = arrayIn[a+3]
            var locAlbum = Album(nameIn: name, yearIn: year, artistIn: artist, labelIn: label)
            array.append(locAlbum)
            
        }
        return array

        
    }
    
    
}
