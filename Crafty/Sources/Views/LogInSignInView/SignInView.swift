import SwiftUI

struct Line: View {
    var body: some View {
        Rectangle()
            .fill(Color.GRAY_TERTIARY) // Use the color that fits your design
            .frame(height: 1) // Adjust the height to match your design
    }
}

struct SignInView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 15
        ) {
            Text("Welcome back!")
                .foregroundStyle(Color.accentColor)
                .fontWeight(.semibold)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            CustomTextField(props: CustomTextFieldProps(
                label: "Email or Username",
                placeholder: "Enter your email or username",
                text: $email
            ))
    
            CustomTextField(props: CustomTextFieldProps(
                label: "Password",
                placeholder: "Enter your password",
                text: $email
            ))
            
            CustomButton(props: Props(
                title: "Sign in",
                action: {
                    print("Create Account")
                },
                fontSize: 14.0,
                backgroundColor: Color.BLUE_TERTIARY))
            
            HStack {
                       Line()
                       Text("or")
                           .font(.caption)
                           .foregroundColor(Color.GRAY_TERTIARY)
                           .padding(.horizontal, 5) // Adjust this padding as needed
                       Line()
                   }
            
            CustomButton(props: Props(
                title: "Sign in with Apple",
                titleColor: Color.BLACK_PRIMARY,
                fontSize: 14.0,
                backgroundColor: Color.GRAY_QUARTERY))
            
            CustomButton(props: Props(
                title: "Sign in Google",
                titleColor: Color.BLACK_PRIMARY,
                fontSize: 14.0,
                backgroundColor: Color.GRAY_QUARTERY))
        
        }.padding(.horizontal,25)
       
       
    }
}




#Preview {
    SignInView()
}
