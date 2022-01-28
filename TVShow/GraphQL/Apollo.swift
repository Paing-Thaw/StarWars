//
//  Apollo.swift
//  TVShow
//
//  Created by Eureka Tatsu on 1/26/22.
//

import Foundation
import Apollo

class Apollo {
    static let shared = Apollo()
    let client: ApolloClient
    init() {
      client = ApolloClient(url: URL(string: "http://localhost:64671")!)
    }
}

