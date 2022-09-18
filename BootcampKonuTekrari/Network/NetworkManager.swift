//
//  NetworkManager.swift
//  BootcampKonuTekrari
//
//  Created by Mert Demirtaş on 18.09.2022.
//

import Foundation

struct NetworkConstans {
    static let url: String? = "https://rickandmortyapi.com/api/character"
}

class NetworkManager {
    
    static let shared = NetworkManager()

    private init(){
        
    }
    
    func fetchData<T: Decodable>(pageNumber: Int, completion: @escaping (T) -> Void) {
        guard var urlString = NetworkConstans.url else { return }
        urlString = urlString + "?page=\(pageNumber)"
        
        guard let url = URL(string: urlString) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            }
            catch {
                print(error)
            }
        })
        task.resume()
    }
}
