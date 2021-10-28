//
//  CharacterDetails.swift
//  PriorSolution_Test
//
//  Created by Pathompong Subtechitmanee on 28/10/2564 BE.
//

import Foundation

struct CharacterRequest: Decodable {
    var request: Characters
}

struct Characters: Decodable {
    var characters: [CharacterResults]
}

struct CharacterResults: Decodable {
    var name: String
    var status: String
    var species: String
    var gender: String
    var origin: CharacterOrigin
    var location: CharacterLocation
    var image: CharacterImage
}

struct CharacterOrigin: Decodable {
    var name: String
}

struct CharacterLocation: Decodable {
    var name: String
}

struct CharacterImage: Decodable {
    var image: URL
}
