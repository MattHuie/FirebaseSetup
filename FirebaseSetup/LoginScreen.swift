import SwiftUI
import UIKit

enum LoginToggle {
    case success, fail
}

struct LoginScreen: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var showAlert = false
    @State var loginToggle: LoginToggle = .success
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                
                    TextField("Username", text: $username)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }.padding(12)
                .background(Color("Color"))
                .cornerRadius(20)
            
                HStack{
                    Image(systemName: "lock.fill").resizable().frame(width: 20, height: 20)
                
                    SecureField("Password", text: $password)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }.padding(12)
                .background(Color("Color"))
                .cornerRadius(20)
                .offset(y: 15)
            
                Button(action: {
                    if !self.username.isEmpty && !self.password.isEmpty {
                        self.loginToggle = .success
                    } else {
                        self.loginToggle = .fail
                    }
                    self.showAlert = true
                }) {
                Text("Login").foregroundColor(.white).padding().frame(width: 150)
                
                }
                .alert(isPresented: $showAlert) {
                    switch loginToggle {
                    case .success:
                        return Alert(title: Text("Success"), message: Text("Login Successful"))
                    case .fail:
                        return Alert(title: Text("Failed"), message: Text("Login failed, please check your username or password."))
                    }
                }
                .background(LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .offset(y: 25)
                .shadow(radius: 25)
                
            }
            .padding(.horizontal, 18)

            
        }
    }
    
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
