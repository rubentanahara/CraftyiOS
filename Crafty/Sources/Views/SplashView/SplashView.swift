import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.accentColor
            Image(.CRAFTY_LOGO)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SplashView()
}
