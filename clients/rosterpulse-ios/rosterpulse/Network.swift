//
// Created by Sean Costello on 3/22/21.
//

import Apollo
import Foundation

class Network {
    static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:8001/query")!)
}
