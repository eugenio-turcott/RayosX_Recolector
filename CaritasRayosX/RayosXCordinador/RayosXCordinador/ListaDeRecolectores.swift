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
                
                VStack(alignment: .leading) {
                    ZStack{
                        // Inicio de lista de muestra
                        VStack {
                            List(listaRecolectores){
                                recolectoresItem in
                                Text( "Id: \(recolectoresItem.id), Nombre: \(recolectoresItem.NOMBRE)")
                            
                            }
                            .listStyle(.inset)
                        }
                        .onAppear(){
                            
                            
                            listaRecolectores = callRecolectores()
                        }
                        // Termino de lista de muestra
                        
                        NavigationStack{
                            NavigationLink("Cambiar recibo"){
                                CambiarRecibosView(listaRecolectoresV: listaRecolectores)
                                    .toolbar(.hidden)
                            }
                            .navigationBarTitle("Volver")
                            .toolbar(.hidden)
                            .padding(.top, 15.0)
                            .buttonStyle(.borderedProminent)
                                .tint(.purple)
                        }
                        
                    }
                    
                    Spacer()
                    
                }
                .padding(.all, 30.0)
                //.navigationBarHidden(true)
                //.navigationBarBackButtonHidden(true)
                .navigationDestination(for: Bool.self) { isAuth in
                }
                
                Spacer()
                    
                VStack{
                    Button("Asignar Recolecciones") {
                    }
                    .padding(20)
                    .frame(maxWidth:.infinity)
                    .font(.headline)
                    //.fontWeight(.bold)
                    .navigationBarTitle("Volver")
                    //.toolbar(.hidden)
                    .background(Color("Azul Oscuro"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 5.0)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 20.0)
                }
                
                
                
                
                
            }
            .background(.white)
            .cornerRadius(30)
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
