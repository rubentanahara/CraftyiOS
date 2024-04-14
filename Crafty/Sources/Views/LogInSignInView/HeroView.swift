import SwiftUI

struct HeroView: View {
    
    @State private var selection = 0
    @State private var showBottomSheet = false
    @State private var buttonSelected : Int = 0
    
    let images = ["image1","image2","image3"]
    public let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            CarouselBackground
            VStack {
                Spacer()
                Logo
                Spacer()
                ActionButtons
                    .padding(.bottom, 50)
                    .padding(.horizontal, 15)
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showBottomSheet){
            VStack {
                CustomSlideTabView(initialIndex: buttonSelected)
                    .presentationDetents([.fraction(0.75)])
            }
            .presentationDragIndicator(Visibility.visible)
        }
    }
    
    private var CarouselBackground: some View {
        TabView(selection: $selection) {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index]).resizable().ignoresSafeArea()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onReceive(timer) { _ in
            selection = selection < images.count - 1 ? selection + 1 : 0
        }
        .allowsHitTesting(false)
        .overlay(Color.black.opacity(0.6))
    }
    
    private var Logo: some View {
        VStack {
            Image("CRAFTY_LOGO")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
            Text("Expand, Discover and connect")
                .foregroundColor(Color.WHITE_PRIMARY)
                .padding(.top,15)
        }
    }
    
    private var ActionButtons: some View {
        VStack(spacing: 15) {
            CustomButton(props: CustomButtonProps(
                title: "Create an account",
                action: {
                    buttonSelected = 0
                    showBottomSheet = true
                },
                fontSize: 14.0,
                backgroundColor: Color.accentColor
            ))
            
            CustomButton(props: CustomButtonProps(
                title: "Sign in",
                action: {
                    buttonSelected = 1
                    showBottomSheet = true
                },
                fontSize: 14.0,
                backgroundColor: .clear,
                borderColor: Color.WHITE_SECONDARY,
                borderWidth: 1
            ))
            
            Text("By signing up, you agree to Crafty’s Terms of Use & Privacy Policy")
                .font(.system(size: 10))
                .foregroundColor(Color.WHITE_SECONDARY)
        }
    }
}

#Preview{
    HeroView()
}
