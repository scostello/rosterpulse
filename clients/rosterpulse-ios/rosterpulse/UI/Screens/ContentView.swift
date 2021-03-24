//
//  ContentView.swift
//  rosterpulse
//
//  Created by Sean Costello on 3/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
