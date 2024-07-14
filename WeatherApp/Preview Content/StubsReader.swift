//
//  StubReader.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 13/07/2024.
//

import Foundation

final class StubsReader {
    
    static func readData(from fileName: String) -> Data {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return Data()
        }
        return data
    }
    
    static func loadData<T: Codable>(from fileName: String) -> T {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                fatalError("Couldn't find or load \(fileName)")
        }
        
        if let decoded = try? JSONDecoder().decode(T.self, from: data) {
            return decoded
        } else {
            fatalError("Couldn't parse data in \(fileName)")
        }
    }
}
