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
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.top, 40.0)
                        .font(.system(size: 35))
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .bold()
                            .padding(.trailing, 10.0)
                            .foregroundColor(Color("Gris"))
                            .bold()
                        Text("Usuario")
                            .bold()
                            .foregroundColor(Color("Azul oscuro"))
                    }
                    .padding(.top, 50.0)
                    
                    TextField("Nombre de usuario", text: $usuario)
                        .submitLabel(.next)
                        .padding(.bottom, 40.0)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(5)

                    
                    HStack{
                        Image(systemName: "lock.circle")
                            .bold()
                            .padding(.trailing, 10.0)
                            .foregroundColor(Color("Gris"))
                        
                        Text("Contraseña")
                            .bold()
                            .foregroundColor(Color("Azul oscuro"))
                    }
                    .padding(.top, 20.0)
                            
                    SecureField("Contraseña", text: $contraseña)
                            //.withSecureFieldStyles()
                            .submitLabel(.next)
                            .focused($passwordIsFocused)
                            .textFieldStyle(.roundedBorder)
                            .lineLimit(5)
                            
                    Text(mensajeError).foregroundColor(.red).padding(.top, 30.0)

                    Spacer()
                    
                }
                .padding(.all, 30.0)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationDestination(for: Bool.self) { isAuth in
            }
            Spacer()
            VStack{
                if (!showAuthLoader) {
                   
                    Button("Iniciar Sesión") {
                        self.isValid = self.validate()
                    }
                    .background( //mandar recuperarIDRecolector en listarecibos()
                        
                        NavigationLink(destination: ListaDeRecibos(), isActive: $isValid) {
                            
                        }
                    )
                        .padding(20)
                        .frame(maxWidth:.infinity)
                        .font(.headline)
                        //.fontWeight(.bold)
                        .navigationBarTitle("Volver")
                        .toolbar(.hidden)
                        .background(Color("Azul oscuro"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 5.0)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20.0)
                        .padding(.bottom, 20.0)
                                
                                
                                
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
