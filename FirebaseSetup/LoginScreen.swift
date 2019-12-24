import SwiftUI

struct LoginScreen: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var success = false
    @State var fail = false
    
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
                        self.success.toggle()
                    } else {
                        self.fail.toggle()
                    }
                }) {
                Text("Login").foregroundColor(.white).padding().frame(width: 150)
                
                }
                .background(LinearGradient(gradient: .init(colors: [Color("1"), Color("2")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .offset(y: 25)
                .shadow(radius: 25)
                
            }
            .padding(.horizontal, 18)
            
        }
        .alert(isPresented: $success) {
            Alert(title: .init(verbatim: "Success"), message: .init(verbatim: "Login Successful") , dismissButton: .none)
        }
        .alert(isPresented: $fail) {
            Alert(title: .init(verbatim: "Failed"), message: .init(verbatim: "Login Failed") , dismissButton: .none)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
