//
//  ResultsCareTaker.swift
//  WWTBM
//
//  Created by Nikita on 12.08.2021.
//

import Foundation

class ResultsCareTaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "recordsOfResults"
    
    func save(results: [Result]) {
        do {
            let data = try self.encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Result] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Result].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
