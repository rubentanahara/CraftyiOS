import SwiftUI

struct ContentView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            if isActive {
                MainView()
            } else {
                SplashScreenView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: 1.2)) {
                    isActive = true
                }
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
