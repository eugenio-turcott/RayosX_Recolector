//
//  sesionView.swift
//  CaritasRayosX
//
//  Created by Alumno on 04/10/23.
//

import SwiftUI

struct sesionView: View {
    @State private var usuario: String = ""
    @State private var contraseña: String = ""
    @State var dataPie: [(Double, Color)] = []
    @State private var showAlert = false
    @State private var showAlert2 = false

    @Environment(\.presentationMode) var presentationMode
    @Binding var cambio: Bool
    @State private var estatus: Int = 1
    @State var recibo: RECIBOS
    @State var donante: DONANTES
    @State private var isValid = false
    @State private var texto : String = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                BackgroundView()
                VStack{
                    Button(action: {}){
                        HStack{
                            Image(systemName: "arrowshape.turn.up.backward.2")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                            Text("Atrás")
                                .font(.title3)
                            
                        }
                        .onTapGesture {
                            self.isValid = validate()
                            if self.isValid{
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                    
                }
                .foregroundColor(.white)
                .padding(.top, -380.0)
                .padding(.leading, -170)
                
                VStack(alignment: .center) {
                    VStack{
                        Spacer()
                        VStack(alignment: .center){
                            Text("Actualizar Usuario")
                                .font(.system(size: 30))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("Azul oscuro"))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, -30.0)
                            HStack {
                                Text("Usuario:")
                                    .font(.system(size: 20))
                                    .padding(.leading, 20.0)
                                    .padding(.top, 50.0)
                                TextField("", text: $usuario)
                                    .cornerRadius(10)
                                    .submitLabel(.next)
                                    .font(.system(size: 22))
                                    .textFieldStyle(.roundedBorder)
                                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                                    .padding(.horizontal, 20.0)
                                    .padding(.top, 50.0)
                            }
                            HStack {
                                Text("Contraseña:")
                                    .font(.system(size: 20))
                                    .padding(.leading, 20.0)
                                    .padding(.top, 20.0)
                                TextField("", text: $contraseña)
                                    .cornerRadius(10)
                                    .submitLabel(.next)
                                    .font(.system(size: 22))
                                    .textFieldStyle(.roundedBorder)
                                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                                    .padding(.horizontal, 20.0)
                                    .padding(.top, 20.0)
                            }
                        }
                        .padding(.vertical)
                        
                        
                        Button {
                            showAlert2.toggle()
                        }
                    label: {
                        Text("Guardar")
                            .padding(20)
                            .frame(width: 300.0, height: 70.0)
                            .font(.headline)
                            .background(Color("Azul oscuro"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20.0)
                            .padding(.bottom, 10.0)
                    }
                    
                        
                        VStack {
                            PieChartView(slices:[
                                (callRecibosHechos(idR: UserDefaults.standard.integer(forKey:"idR")), Color.green),
                                ((callRecibosTotales(idR: UserDefaults.standard.integer(forKey:"idR")) - callRecibosHechos(idR: UserDefaults.standard.integer(forKey:"idR"))), Color.red)
                            ])
                            HStack {
                                Image(systemName: "stop.fill")
                                    .foregroundColor(Color.green)
                                Text("Recolectados")
                            }
                            HStack {
                                Image(systemName: "stop.fill")
                                    .foregroundColor(Color.red)
                                Text("No Recolectados")
                            }
                        }
                        
                        Button {
                            showAlert.toggle()
                        }
                    label: {
                        Text("Cerrar Sesión")
                            .padding(20)
                            .frame(width: 300.0, height: 70.0)
                            .font(.headline)
                            .background(Color("Azul oscuro"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20.0)
                            .padding(.bottom, 20.0)
                    }
                        
                    }
                    .onAppear(){
                        usuario=UserDefaults.standard.string(forKey:"usuario") ?? ""
                        contraseña=UserDefaults.standard.string(forKey:"contraseña") ?? ""
                        
                    }
                    
                }
                .background(.white)
                .cornerRadius(35)
                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color("Rosa"), lineWidth: 4))
                .padding(.top, 110.0)
                .padding(.horizontal, 20.0)
                
                
                
            }
            .alert("¿Seguro que quieres cerrar la sesión?", isPresented: $showAlert){
                Button("Si"){
                    cambio.toggle()
                    self.presentationMode.wrappedValue.dismiss()
                }
                Button("No"){}
            }
            .background(Color(red: 17/255, green: 151/255, blue: 165/255))
        }
        .alert("¿Seguro que desear actualizar tu usuario?", isPresented: $showAlert2){
            Button("Si"){
                enviarUsuario(usuario: usuario, idRecolector: UserDefaults.standard.integer(forKey:"idR"))
                enviarContrasena(contrasena:contraseña, idRecolector: UserDefaults.standard.integer(forKey:"idR"))
                UserDefaults.standard.setValue(usuario, forKey: "usuario")
                UserDefaults.standard.setValue(contraseña, forKey: "contraseña")
            }
            Button("No"){}
        }
    }
    
    
    private func validate() -> Bool {
        enviarEstatus(estatus: estatus, idRecibo: recibo.id)
        enviarComentarios(comentarios: texto, idRecibo: recibo.id)
        return true
    }
}

struct sesionView_Previews: PreviewProvider {
    static var previews: some View {
        @State var cambio:Bool = false
        sesionView(cambio:$cambio, recibo: listaRecibos[0], donante: listaDonantes[0])
    }
    
}
