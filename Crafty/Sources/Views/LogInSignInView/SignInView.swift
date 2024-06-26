import SwiftUI

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(
            alignment: .center,
            spacing: 15
        ) {
            Text("Welcome back!")
                .foregroundStyle(Color.accentColor)
                .fontWeight(.semibold)
                .font(.title2)
            
            CustomTextField(props: CustomTextFieldProps(
                label: "Email or Username",
                placeholder: "Enter your email or username",
                text: $username
            ))
            
            CustomTextField(props: CustomTextFieldProps(
                label: "Password",
                placeholder: "Enter your password",
                text: $password,
                isSecure: true
            ))
            
            CustomButton(props: CustomButtonProps(
                title: "Sign in",
                action: {
                    print("Create Account")
                },
                fontSize: 14.0,
                backgroundColor: Color.BLUE_TERTIARY))
            
            HStack {
                Text("By signing in, you agree to Crafty’s Terms of Use & Privacy Policy").font(.system(size: 10))
                    .foregroundStyle(Color.BLACK_PRIMARY)
            }
        }.padding(.horizontal,25)
    }
}

#Preview {
    SignInView()
}
