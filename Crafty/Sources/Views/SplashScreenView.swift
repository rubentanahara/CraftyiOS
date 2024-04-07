import SwiftUI

struct SplashScreenView: View {
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

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
