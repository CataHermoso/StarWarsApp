//
//  api.swift
//  flutter
//
//  Created by Catalina Hermoso on 18/10/2022.
//

import SwiftUI

struct Api: Codable {
    let results: [Personaje]
}

struct Personaje: Hashable, Codable {
    let name: String
    let gender: String
}

class ViewModel: ObservableObject {
    @State var page = "https://swapi.dev/api/people/?page=1"
    
    @Published var characters = [Personaje]()
    
    func fetchData() {
        guard let url = URL(string: page) else {
            print("error in url")
            return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("error in data")
                return }
            
            //convert to json
            do {
                let characters = try JSONDecoder().decode(Api.self, from: data)
                DispatchQueue.main.async {
                    self?.characters = characters.results
                }
            }
            catch {
                print (error)
            }
        }
        task.resume()
    }
}

