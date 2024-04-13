import SwiftUI

struct OnboardingView: View {
    @ObservedObject private var viewModel = OnboardingViewModel()
    @EnvironmentObject private var appState: AppState
    @State private var selectedIndex = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedIndex) {
                ForEach(0..<viewModel.onboardingPages.count) { index in
                    OnboardingContent(page: viewModel.onboardingPages[index])
                    
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            
            if selectedIndex == (viewModel.onboardingPages.count - 1) {
                CustomButton(props: Props(title: "Get started", action: {
                    appState.isOnboardingDone = true
                }, backgroundColor: Color.BLUE_TERTIARY))
                .frame(width: 200, height: 50)
                .padding(.bottom, 50)
            }
            
        }
    }}

#Preview {
    OnboardingView()
}
