//
//  SwiftUIView.swift
//  rosterpulse
//
//  Created by Sean Costello on 3/24/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {

            VStack {
                Logo()
                    .padding()

                TextField("Email", text: $email)
                    .font(Font.custom("Hero-Regular", size: 14))
                    .padding()
                    .background(Blur())
                    .cornerRadius(5)
                    .padding(.top, 25)

                SecureField("Password", text: $password)
                    .font(Font.custom("Hero-Regular", size: 14))
                    .padding()
                    .background(Blur())
                    .cornerRadius(5)
                    .padding(.bottom, 25)


                Button(action: { print("HELLLLOOOOO") }) {
                    Text("Sign In")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(Font.custom("Hero-Regular", size: 18))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(UIColor(hex: "#4c5fefff")!))
                }
                .cornerRadius(30)
            }
            .padding([.leading, .trailing], 27.5)
        }.background(
            Image("onboarding-bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
