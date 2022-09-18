//
//  RickAndMortyCharacterModel.swift
//  BootcampKonuTekrari
//
//  Created by Mert Demirtaş on 18.09.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rickAndMortyCharacterModel = try? newJSONDecoder().decode(RickAndMortyCharacterModel.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rickAndMortyCharacterModel = try? newJSONDecoder().decode(RickAndMortyCharacterModel.self, from: jsonData)
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let rickAndMortyCharacterModel = try? newJSONDecoder().decode(RickAndMortyCharacterModel.self, from: jsonData)

import Foundation

// MARK: - RickAndMortyCharacterModel
struct RickAndMortyCharacterModel: Codable {
    let info: Info
    var results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let image: String

}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

