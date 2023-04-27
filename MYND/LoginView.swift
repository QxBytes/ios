

import SwiftUI
import Firebase
import FirebaseCore

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var loggedIn = false
    @Binding var userData: UserData
    @Binding var db: DB
    //TODO: add a variable that tracks whether the user has successfully logged in or not
    
    init(userData: Binding<UserData>, db: Binding<DB>) {
        _userData = userData
        _db = db
    }
    
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                //                TODO: update the variable to track that the user has successfully logged in
                print("success")
                loggedIn = true
                var userID = result?.user.uid ?? ""
                userData.userId = userID
                read(db: db.db, doc_id: userID) { document, error in
                    if let error = error {
                        print("Error fetching document: \(error)")
                    } else if let document = document {
                        print("Document data: \(document.data() ?? [:])")
                        userData = parseUserData(snapshot: document)!
                    } else {
                        print("Document does not exist")
                    }
                }
            }
        }
    }
    func save() {
        create(db: db.db, userData: userData)
    }
    var body: some View {
        //TODO: Implement an if-else to return a new view when a certain condition is met
        VStack {
            if !loggedIn {
                TextField("Email", text: $email).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)
                SecureField("Password", text: $password).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)
                
                Button(action: { login() }){
                    Text("Sign in")
                }
                .buttonStyle(. bordered).tint(.mint)
            } else {
                Text("You logged in!")
                Button(action: { save() }) {
                    Text("Save")
                }
                .buttonStyle(. bordered).tint(.mint)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var userData: UserData = UserData(checkins: [])
    static var db: DB = DB()
    static var previews: some View {
        LoginView(userData: Binding(get: {self.userData}, set: {self.userData = $0}), db: Binding(get: {self.db}, set: {self.db = $0}))
    }
}
