# Concurrency
Two pieces or more code running simultanously
- To be able to process code in paralle, the system groups units of codes in tasks.
- In swift Tasks can be implemented with asychronous and concurrent programming.
- Asynchronous in the programming pattern in which the code waits for a process to finish before completing the tasks.
- This allows the system to sahre computing resources among many processes.
- While waiting, the system can use the resources to perform other tasks.
- On the other hand, concurrent programming implements code that can take advantage of multiple core processors to execute tasks simultaneously
```
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
        .task(priority: .background) {
            let imageName = await loadImage(name: "image1")
            print(imageName)
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

```
The printout after 3 seconds
```
Name: image1

```

## Running Multiple asynchronous Processes
```
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
        .task(priority: .background) {
            let imageName1 = await loadImage(name: "image1")
            let imageName2 = await loadImage(name: "image2")
            let imageName3 = await loadImage(name: "image3")
            print("\(imageName1), \(imageName2), and \(imageName3)")
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
```

printout after 9 seconds
```
Name: image1, Name: image2, and Name: image3
```

## Defining a task Explicitly
