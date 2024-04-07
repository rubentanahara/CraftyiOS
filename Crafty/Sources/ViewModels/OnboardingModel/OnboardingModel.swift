import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var onboardingPages: [OnboardingPage]
    
    init() {
        onboardingPages = [
            OnboardingPage(
                imageName: .CRAFTY_LOGO,
                title: "Explore",
                description: "Discover new beers and breweries in town. Explore a wide range of flavors and styles that cater to every taste."
            ),
            OnboardingPage(
                imageName: .CRAFTY_LOGO,
                title: "Discover",
                description: "Find your next favorite beer with personalized recommendations. Experience the best of local and international brews."
            ),
            OnboardingPage(
                imageName: .CRAFTY_LOGO,
                title: "Connect",
                description: "Join a community of beer enthusiasts. Share your experiences, rate beers, and connect with fellow beer lovers."
            )
        ]

    }
}
