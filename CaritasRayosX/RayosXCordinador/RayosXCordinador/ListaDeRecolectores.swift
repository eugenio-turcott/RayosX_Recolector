import SwiftUI

struct ListaDeRecolectores: View {
    //var listaRecolectores = callRecibos(idEnCall: idR)
    @State private var listaRecolectores: Array<RECOLECTOR> = []

    var body: some View {
        
        ZStack{
            BackgroundView()
            VStack(alignment: .center) {
                HStack(alignment: .top){
                    
                }
                Spacer()
               
                VStack(alignment: .center) {
                    HStack {
                        Text("Recolectores")
                            .font(.system(size: 40))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("AzulOscuro"))
                    }

                    ZStack{
                        
                        VStack {
                            
                            List(listaRecolectores){
                                recolectoresItem in
                                NavigationLink(){
                                    ComentariosRecibosView(listaRecibos: callComentariosNoCobrados(idR: recolectoresItem.id))
                                }label:{
                                ZStack {
                                        HStack {
                                            if (callRecibosHechos(idR: recolectoresItem.id) == callRecibosTotales(idR: recolectoresItem.id) ) {
                                                Color("VerdeOpaco")
                                            } else if (callRecibosHechos(idR: recolectoresItem.id) == 0) {
                                                Color("RojoOpaco")
                                            }
                                            else if (callRecibosHechos(idR: recolectoresItem.id) < callRecibosTotales(idR: recolectoresItem.id) ) {
                                                Color("Amarillo")
                                            }
                                            
                                        }
                                        .frame(width: 250.0, height: 50.0)
                                        .cornerRadius(20)
                                        .offset(y: 8)
                                        
                                        HStack{
                                            Text(recolectoresItem.NOMBRE)
                                                .multilineTextAlignment(.leading)
                                                .font(.system(size:20))
                                                .fontWeight(.heavy)
                                                .foregroundColor(.black)
                                                .padding(.vertical, 10.0)
                                            Spacer()
                                            Text("\(callRecibosHechos(idR: recolectoresItem.id))/\(callRecibosTotales(idR: recolectoresItem.id))")
                                                .multilineTextAlignment(.trailing)
                                                .font(.system(size:20))
                                                .fontWeight(.heavy)
                                                .foregroundColor(.black)
                                            
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                        .frame(maxWidth: .infinity)
                                        .overlay( RoundedRectangle(cornerRadius: 20)
                                            .stroke(.black, lineWidth: 5))
                                        .cornerRadius(20)
                                        .padding(.vertical, 10.0)
                                    }
                                }
                                
                            }
                            .listStyle(.inset)
                            
                        
                        }
                        .onAppear(){
                            listaRecolectores = callRecolectores()
                            

                        }
                        
                    }
                }
                .padding(.all, 10.0)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationDestination(for: Bool.self) { isAuth in
                }
                                
                
                
                VStack{
                    NavigationLink(){
                                            CambiarRecibosView(listaRecolectoresV: listaRecolectores)
                                        }label:{
                                            Text("Cambiar recibo")
                                                .padding(20)
                                                .frame(width: 250, height: 60)
                                                .font(.headline)
                                                .background(Color("AzulOscuro"))
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        }
                }
                
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

    
}







struct ListaDeRecolectores_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeRecolectores()
    }
}
