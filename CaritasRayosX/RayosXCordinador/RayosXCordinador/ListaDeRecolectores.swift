import SwiftUI

struct ListaDeRecolectores: View {
    //var listaRecolectores = callRecibos(idEnCall: idR)
    @State private var listaRecolectores: Array<RECOLECTOR> = []
 

    @State private var colores1: [String] = []
    @State private var recibosHechos: Int = 0
    @State private var recibosTotales: Int = 0
    @State private var color1: String = ""
    @State private var color2: String = ""
    @State private var cont: Int = 0

    var body: some View {
        
        ZStack{
            BackgroundView()
            VStack(alignment: .center) {
                HStack(alignment: .top){
                    
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    ZStack{
                        NavigationView {
                            DisclosureGroup {
                                ForEach(0..<4) { _ in
                                    Text("Roberto Luz")
                                }
                            } label: {
                                HStack(alignment: .center) {
                                    Spacer()
                                }
                            }
                        }
                        // Inicio de lista de muestra
                        VStack {

                            List(listaRecolectores){
                                recolectoresItem in
                                HStack{
                                    Image("Persona")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Capsule())
                                        .bold()
                                        .padding(.trailing, 10.0)
                                        .padding(.vertical, 5.0)
                                        .foregroundColor(.black)
                                    Text(recolectoresItem.NOMBRE)
                                        .multilineTextAlignment(.leading)
                                        .font(.headline)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                        .padding(.vertical, 10.0)
                                    Spacer()
                                    Text("\(callRecibosHechos(idR: recolectoresItem.id))/\(callRecibosTotales(idR: recolectoresItem.id))")
                                        .multilineTextAlignment(.trailing)
                                        .font(.headline)
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
                            .listStyle(.inset)
                        }
                        .onAppear(){
                            listaRecolectores = callRecolectores()
                            

                        }
                        
                    }
                }
                .padding(.all, 30.0)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
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
                    .toolbar(.hidden)
                    .background(Color("Azul oscuro"))
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
