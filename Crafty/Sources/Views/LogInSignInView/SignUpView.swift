import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View{
        VStack(
            alignment: .center,
            spacing: 15
        ) {
            Text("Sign up for Crafty")
                .foregroundStyle(Color.accentColor)
                .fontWeight(.semibold)
                .font(.title2)
            
            CustomTextField(props: CustomTextFieldProps(
                label: "Email",
                placeholder: "Enter your email",
                text: $email
            ))
            
            CustomTextField(props: CustomTextFieldProps(
                label: "Username",
                placeholder: "Enter your username",
                text: $username
            ))
            
            CustomTextField(props: CustomTextFieldProps(
                label: "Password (8+ characters)",
                placeholder: "Enter your password",
                text: $password,
                isSecure: true
            ))
            
            CustomButton(props: CustomButtonProps(
                title: "Sign Up",
                action: {
                    print("Create Account")
                },
                fontSize: 14.0,
                backgroundColor: Color.BLUE_TERTIARY))
            
            HStack {
                Text("By signing up, you agree to Crafty’s Terms of Use & Privacy Policy").font(.system(size: 10))
                    .foregroundStyle(Color.BLACK_PRIMARY)
            }
            
        }.padding(.horizontal,25)
    }
}

#Preview {
    SignUpView()
}
