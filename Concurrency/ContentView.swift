//
//  ContentView.swift
//  Concurrency
//
//  Created by Ambrose Mbayi on 10/07/2023.
//

import SwiftUI

struct ContentView: View {
    var thumbnail: String {
        get async {
            try? await Task.sleep(nanoseconds: 3 * 1000_000_000)
            return "mythumbail"
        }
    }
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
       
        .onAppear{
            Task(priority: .background) {
                let imageName = await thumbnail
                print(imageName)
            }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
