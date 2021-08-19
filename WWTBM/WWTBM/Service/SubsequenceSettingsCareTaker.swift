//
//  SubsequenceSettingsCareTaker.swift
//  WWTBM
//
//  Created by Nikita on 19.08.2021.
//

import Foundation
class SubsequenceSettingsCareTaker{
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private let key = "Subsq"

    func save(state: Subsequence) {
        do {
            let data = try self.encoder.encode(state)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    func retrieveRecords() -> Subsequence {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return .inCource
        }
        do {
            return try self.decoder.decode(Subsequence.self, from: data)
        } catch {
            print(error)
            return .inCource
        }
    }
}
