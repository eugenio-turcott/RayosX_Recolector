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
    @Environment(\.presentationMode) var presentationMode
    @Binding var cambio: Bool
    @State private var estatus: Int = 1
    @State var recibo: RECIBOS
    @State var donante: DONANTES
    @State private var isValid = false
    @State private var texto : String = ""
    
    var body: some View {
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
                    
                    VStack(alignment: .leading){
                        TextField("", text: $usuario)
                            .cornerRadius(10)
                            .submitLabel(.next)
                            .font(.system(size: 22))
                            .textFieldStyle(.roundedBorder)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                            .padding(.horizontal, 40.0)
                            .padding(.top, 50.0)
                        TextField("", text: $contraseña)
                            .cornerRadius(10)
                            .submitLabel(.next)
                            .font(.system(size: 22))
                            .textFieldStyle(.roundedBorder)
                            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                            .padding(.horizontal, 40.0)
                            .padding(.vertical, 20.0)
                    }
                    .padding(.vertical)

                    
                    Button {
                        enviarUsuario(usuario: usuario, idRecolector: UserDefaults.standard.integer(forKey:"idR"))
                        enviarContrasena(contrasena:contraseña, idRecolector: UserDefaults.standard.integer(forKey:"idR"))
                        UserDefaults.standard.setValue(usuario, forKey: "usuario")
                        UserDefaults.standard.setValue(contraseña, forKey: "contraseña")


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
                            .padding(.bottom, 20.0)
                    }
                    
                    PieChartView(slices:[
                        (callRecibosHechos(idR: UserDefaults.standard.integer(forKey:"idR")), Color.red),
                        ((callRecibosTotales(idR: UserDefaults.standard.integer(forKey:"idR")) - callRecibosHechos(idR: UserDefaults.standard.integer(forKey:"idR"))), Color.green)
                        ])
                    
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
