import SwiftUI
import UIKit

enum LoginToggle {
    case success, fail
}

struct LoginScreen : View {
    
    @State var username : String = ""
    @State var password : String = ""
    @State var login = false
    
    @State var signup = false
    
    var body : some View {
        ZStack {
            
            LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            Login(login: $login, signup: $signup, username: $username, password: $password)
        }
        .sheet(isPresented: $signup) {
            signUp(signup: self.$signup)
        }
    }
    
}

struct LoginScreen_Previews : PreviewProvider {
    static var previews : some View {
        LoginScreen()
    }
}

struct Login : View {
    
    @Binding var login : Bool
    @Binding var signup : Bool
    @Binding var username : String
    @Binding var password : String
    
    @State var loginToggle : LoginToggle = .success
    
    var body : some View {
        
        VStack(alignment: .center, spacing: 20, content: {
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
            
            Button(action: {
                if !self.username.isEmpty && !self.password.isEmpty {
                    self.loginToggle = .success
                } else {
                    self.loginToggle = .fail
                }
                self.login = true
            }) {
                Text("Login").foregroundColor(.white).padding().frame(width: 150)
                
            }
            .alert(isPresented: $login) {
                switch loginToggle {
                case .success:
                    return Alert(title: Text("Success"), message: Text("Login Successful"))
                case .fail:
                    return Alert(title: Text("Failed"), message: Text("Login failed, please check your username or password."))
                }
            }
            .background(LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .shadow(radius: 25)
            
            Button(action: {
                
            }) {
                Text("Forget password?").foregroundColor(.white)
            }
            
            VStack {
                Text("Don't have an account?").foregroundColor(.white)
                
                Button(action: {
                    
                    self.signup.toggle()
                    
                }) {
                    Text("Sign Up").foregroundColor(.white).padding().frame(width: 150)
                }
                .background(LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .shadow(radius: 25)
            }
            .padding(.top, 20)
            
        })
            .padding(.horizontal, 18)
    }
}

struct signUp : View {
    
    @Binding var signup : Bool
    @State var username : String = ""
    @State var password : String = ""
    @State var rePassword : String = ""
    
    var body : some View {
        
        ZStack {
            LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .center, spacing: 20, content: {
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
                
                HStack{
                    Image(systemName: "lock.fill").resizable().frame(width: 20, height: 20)
                    
                    SecureField("Re-Enter Password", text: $rePassword)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                }.padding(12)
                    .background(Color("Color"))
                    .cornerRadius(20)
                
                Button(action: {
                    
                    self.signup.toggle()
                    
                }) {
                    Text("Sign Up").foregroundColor(.white).padding().frame(width: 150)
                    
                }
                .background(LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .shadow(radius: 25)
                
                
                
            })
                .padding(.horizontal, 18)
        }
    }
}
