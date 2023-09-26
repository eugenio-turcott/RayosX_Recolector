import SwiftUI

struct ListaDeRecolectores: View {
    //var listaRecolectores = callRecibos(idEnCall: idR)
    
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
                        
                        HStack{
                            Image("Persona")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Capsule())
                                .bold()
                                .padding(.trailing, 10.0)
                                .padding(.vertical, 5.0)
                                .foregroundColor(.black)
                            Text("Marcelo Rivas")
                                .multilineTextAlignment(.leading)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                .padding(.vertical, 10.0)
                            Spacer()
                            Text("0/4")
                                .multilineTextAlignment(.trailing)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(Color("Rojo"))
                        .frame(maxWidth: .infinity)
                        .overlay( RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("RojoOpaco"), lineWidth: 5))
                        .cornerRadius(20)
                        .padding(.vertical, 10.0)
                        
                        
                        
                        Spacer()
                    }
                    
                    
                    
                    
                    
                    HStack{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Capsule())
                            .bold()
                            .padding(.trailing, 10.0)
                            .padding(.vertical, 5.0)
                            .foregroundColor(.black)
                        Text("Marcelo Rivas")
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 10.0)
                        Spacer()
                        Text("2/4")
                            .multilineTextAlignment(.trailing)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(Color("Amarillo"))
                    .overlay( RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("AmarilloOpaco"), lineWidth: 5))
                    .cornerRadius(20)
                    .padding(.vertical, 10.0)
                    
                    
                    
                    HStack{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Capsule())
                            .bold()
                            .padding(.trailing, 10.0)
                            .padding(.vertical, 5.0)
                            .foregroundColor(.black)
                        Text("Marcelo Rivas")
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 10.0)
                        Spacer()
                        Text("4/4")
                            .multilineTextAlignment(.trailing)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(Color("Verde"))
                    .overlay( RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("VerdeOpaco"), lineWidth: 5))
                    .cornerRadius(20)
                    .padding(.vertical, 10.0)
                    
                    
                    
                    
                    HStack{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Capsule())
                            .bold()
                            .padding(.trailing, 10.0)
                            .padding(.vertical, 5.0)
                            .foregroundColor(.black)
                        Text("Marcelo Rivas")
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 10.0)
                        Spacer()
                        Text("0/4")
                            .multilineTextAlignment(.trailing)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .overlay( RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("Gris"), lineWidth: 5))
                    .cornerRadius(20)
                    .padding(.vertical, 10.0)
                    
                    
                    
                    HStack{
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Capsule())
                            .bold()
                            .padding(.trailing, 10.0)
                            .padding(.vertical, 5.0)
                            .foregroundColor(.black)
                        Text("Marcelo Rivas")
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 10.0)
                        Spacer()
                        Text("0/4")
                            .multilineTextAlignment(.trailing)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .overlay( RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("Gris"), lineWidth: 5))
                    .cornerRadius(20)
                    .padding(.vertical, 10.0)

                    
                    
                    
                    
                    
                    Spacer()
                    
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
