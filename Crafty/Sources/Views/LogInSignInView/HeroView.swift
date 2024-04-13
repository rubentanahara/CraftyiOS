import SwiftUI

struct HeroView: View {
    public let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    @State private var showBottomSheet = false
    
    let images = ["image1","image2","image3"]
    var body: some View {
        ZStack{
            TabView(selection: $selection){
                ForEach(0..<3){ i in
                    Image("\(images[i])").resizable().ignoresSafeArea()
                }
                
            }
            
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onReceive(timer){ _ in
                withAnimation{
                    selection  = selection < 2 ? selection + 1: 0
                }
            }
            .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            .overlay(Color.black.opacity(0.6))
            
            VStack {
                Spacer()
                Image(.CRAFTY_LOGO)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200, height: 100)
                Text("Expand, Discover and connect")
                    .foregroundStyle(Color.WHITE_PRIMARY)
                Spacer()
            }
            
            VStack(spacing: 15) {
                Spacer()
                CustomButton(props: Props(
                    title: "Create an account",
                    action: {
                        print("Create Account")
                    }, 
                    fontSize: 14.0,
                    backgroundColor: Color.BLUE_TERTIARY))
                
                CustomButton(props: Props(
                    title: "Sign in",
                    action: {
                        showBottomSheet.toggle()
                    },
                    fontSize: 14.0,
                    backgroundColor: .clear,
                    borderColor: Color.WHITE_SECONDARY,
                    borderWidth: 1
                ))
                
                Text("By signing up, you agree to Crafty’s Terms of Use & Privacy Policy").font(.system(size: 10))
                    .foregroundStyle(Color.WHITE_SECONDARY)
                
            }
            .padding(.bottom, 60)
            .padding(.horizontal, 25)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showBottomSheet){
            SignInView()
                .presentationDetents([.fraction(0.65)])
        }
    }
}


#Preview{
    HeroView()
}
