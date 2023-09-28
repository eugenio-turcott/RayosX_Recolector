//
//  Login.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct Login: View {
    @State public var idRecolector: String = ""
    @State private var usuario: String = ""
    @State private var contraseña: String = ""
    @State private var showAuthLoader: Bool = false
    @State private var showInvalidUCAlert: Bool = false
    @State private var isAuthenticated: Bool = false
    @FocusState private var passwordIsFocused: Bool
    @State public var listaRecibos: Array<RECIBOS> = []
    @Environment(\.presentationMode) var presentationMode
    @State private var isValid = false
    @State private var mensajeError = ""
    @State private var idR: Int=0
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(alignment: .center) {
                HStack(alignment: .top){
                    NavigationLink("", value: isAuthenticated)
                    Text("Iniciar sesión")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.top, 40.0)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45.0)
                            .padding(.trailing, 15.0)
                            .foregroundColor(Color("Gris"))
                            
                        Text("Usuario")
                            .font(.system(size: 28))
                            .bold()
                            .foregroundColor(Color("Azul oscuro"))
                    }
                    .padding(.top, 15.0)
                    
                    TextField("Nombre de usuario", text: $usuario)
                        .submitLabel(.next)
                        .font(.system(size: 22))
                        .textFieldStyle(.roundedBorder)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                        .padding(.bottom, 20.0)

                    
                    HStack{
                        Image(systemName: "lock.circle")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45.0)
                            .padding(.trailing, 15.0)
                            .foregroundColor(Color("Gris"))
                        
                        Text("Contraseña")
                            .font(.system(size: 28))
                            .bold()
                            .foregroundColor(Color("Azul oscuro"))
                    }
                    .padding(.top, 20.0)
                            
                    SecureField("Contraseña", text: $contraseña)
                            .submitLabel(.next)
                            .font(.system(size: 22))
                            .focused($passwordIsFocused)
                            .textFieldStyle(.roundedBorder)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                            
                    Text(mensajeError)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.top, 40.0)
                }
                .padding(.all, 30.0)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationDestination(for: Bool.self) { isAuth in
            }
            VStack{
                if (!showAuthLoader) {
                    Button {
                        self.isValid = self.validate()
                    }
                    label: {
                        Text("Iniciar Sesión")
                            .padding(20)
                            .frame(width: 300.0, height: 70.0)
                            .font(.headline)
                            .background(Color("Azul oscuro"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20.0)
                            .padding(.bottom, 20.0)
                    }
                    .background(
                        // Mandar recuperarIDRecolector en listarecibos()
                        NavigationLink(destination: ListaDeRecibos(), isActive: $isValid) {
                        }
                            .toolbar(.hidden)
                    )
                        
                        
                                
                                
                                
                    } else {
                        ProgressView()
                    }
                 
                    }
                    .padding(.bottom, 30.0)
                    Spacer()
                }
                .background(.white)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Rosa"), lineWidth: 5))
                .padding(.top, 130.0)
                .padding(.horizontal, 20.0)
                .padding(.bottom, 10.0)
    
        }
        
    }
    
    private func validate() -> Bool {
        var valor : Bool = false
        idR = RecuperarIDRecolector(usuario: usuario, contrasenaI: contraseña)
        UserDefaults.standard.setValue(idR, forKey: "idR")
        if (usuario != "" && contraseña != ""){
            valor = loginVer(usuario: usuario, contrasenaI: contraseña)
            if (valor == true){
                return true
            }
            else{
                mensajeError = "Usuario y/o contraseña incorrectos"
                return false

            }
        }else{
            mensajeError = "Debe ingresar usuario y contraseña"
            return false
        }
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
