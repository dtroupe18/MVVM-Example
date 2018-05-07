//
//  Data Models.swift
//  MVVM Example
//
//  Created by Dave on 5/7/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import Foundation

// If you want to use Codable then each piece of the JSON has be to decoable into its own struct
// This makes for a lot more code than we really need in this simple example
//
struct Response: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title, id: String
    let author: Author
    let links: [Link]
    let copyright, country, icon, updated: String
    let results: [Result]
}

struct Author: Codable {
    let name, uri: String
}

struct Link: Codable {
    let linkSelf, alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
}

struct Result: Codable {
    let artistName, id, releaseDate, name: String
    let kind: Kind
    let copyright, artistID, artistURL, artworkUrl100: String
    let genres: [Genre]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url
    }
}

struct Genre: Codable {
    let genreID, name, url: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case iosSoftware = "iosSoftware"
}
