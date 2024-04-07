import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var selectedView = 0
    @State private var isOnBoarding = true
    
    private let ANIMATION_DELAY = 3.0
    private let ANIMATION_DURATION = 1.5
    
    init() {
        if let backgroundColor = UIColor(named: "WHITE_SECONDARY") {
            UITabBar.appearance().backgroundColor = backgroundColor
        }
    }
    
    var body: some View {
        if isActive {
            mainTabView
        } else {
            SplashScreenView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + ANIMATION_DELAY) {
                        withAnimation(.easeOut(duration: ANIMATION_DURATION)) {
                            isActive = true
                        }
                    }
                }
        }
    }
    
    private var mainTabView: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                .tag(1)
        }
    }
}


struct HomeView: View {
    var body: some View {
        Text("Home View").padding().frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct OnBoardingView: View {
    var body: some View {
        Text("Onboarding...")
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile screen")
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
