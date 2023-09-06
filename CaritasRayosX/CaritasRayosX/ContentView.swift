//
//  ContentView.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct ContentView: View {
    //@EnvironmentObject var authViewModel: AuthenticationViewModel
    var hasPersistedSignedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    var body: some View {
            NavigationStack {
                /*
                if authViewModel.state == .signedOut && !hasPersistedSignedIn && !authViewModel.restoreGoogleSignIn {
                    Login()
                */
                Login()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
