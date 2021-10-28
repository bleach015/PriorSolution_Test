//
//  CharacterRequest.swift
//  PriorSolution_Test
//
//  Created by Pathompong Subtechitmanee on 28/10/2564 BE.
//

import Foundation

func getCharacter(completion: @escaping(Result<[Characters], Error>) -> Void) {
    let dataTask = URLSession.shared.dataTask(with: URL(string: "https://rickandmortyapi.com/api/character")!) { data, _, _ in
        guard let jsonData = data else {return}
        
        do {
            let decoder = JSONDecoder()
            let characterRequest = try decoder.decode(CharacterRequest.self, from: jsonData)
            let characterDetails = characterRequest.request.characters
            //completion(.success(characterDetails))
        }
        catch {
            
        }
    }
    dataTask.resume()
}
