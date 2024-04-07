import SwiftUI

struct OnboardingView: View {
    @ObservedObject private var viewModel = OnboardingViewModel()
    @State private var selectedIndex = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(0..<viewModel.onboardingPages.count) { index in
                    OnboardingContent(page: viewModel.onboardingPages[index])
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            if selectedIndex == (viewModel.onboardingPages.count - 1) {
                
                
            }
        }
    }
}

#Preview {
    OnboardingView()
}
