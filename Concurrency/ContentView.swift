//
//  ContentView.swift
//  Concurrency
//
//  Created by Ambrose Mbayi on 10/07/2023.
//

import SwiftUI

enum MyErrors: Error {
    case noData, noImage
}

struct ContentView: View {
   
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
       
        .onAppear{
            Task(priority: .background) {
                do {
                    let imageName = try await loadImage(name: "Image1")
                    print(imageName)
                } catch MyErrors.noData {
                    print("error: no data available")
                } catch MyErrors.noImage {
                    print("Error: no Image Available")
                }
            }
        }
    }
    
    func loadImage(name: String) async throws -> String {
        try? await Task.sleep(nanoseconds: 3 * 1000_000_000)
        
        let error = true
        if error {
            throw MyErrors.noImage
        }
        return "Name: \(name)"
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
