//
//  ContentView.swift
//  Concurrency
//
//  Created by Ambrose Mbayi on 10/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            Task(priority: .background) {
                let imageName1 = await loadImage(name: "image1")
                let imageName2 = await loadImage(name: "image2")
                let imageName3 = await loadImage(name: "image3")
                print("\(imageName1), \(imageName2), and \(imageName3)")
            }
        }
    }
    
    func loadImage(name: String) async -> String {
        try? await Task.sleep(nanoseconds: 3 * 1000_000_000)
        return "Name: \(name)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
