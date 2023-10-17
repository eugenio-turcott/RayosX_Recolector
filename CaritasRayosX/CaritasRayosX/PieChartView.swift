//
//  PieChartView.swift
//  Basado de: https://medium.com/@iOSchandra0/how-to-create-a-pie-chart-in-swiftui-c7f056d54c81
//  Modificado y ajustado por: Cristina Gonzalez Cordova
//

import SwiftUI

struct PieChartView: View {
    @State var slices: [(Double, Color)] = []
    @State var isDonut = false
    @State var hasGap = false
    
    var body: some View {
        if slices.count > 0 {
            Canvas { context, size in
                //Empieza modo Dona
                if (isDonut){
                    let donut = Path { p in
                        p.addEllipse(in: CGRect(origin: .zero, size: size))
                        p.addEllipse(in: CGRect(x: size.width * 0.25, y: size.height * 0.25, width: size.width * 0.5, height: size.height * 0.5))
                    }
                    context.clip(to: donut, style: .init(eoFill: true))
                }
                //End modo dona
                
                let total = slices.reduce(0) { $0 + $1.0 }
                context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
                var pieContext = context
                pieContext.rotate(by: .degrees(-90))
                let radius = min(size.width, size.height) * 0.48
                var startAngle = Angle.zero
                //Separación entre secciones 5 grados
                let gapSize = Angle(degrees: 5)
                for (value, color) in slices {
                    let angle = Angle(degrees: 360 * (value / total))
                    let endAngle = startAngle + angle
                    let path = Path { p in
                        p.move(to: .zero)
                        if (hasGap){
                            p.addArc(center: .zero, radius: radius, startAngle: startAngle + gapSize / 2, endAngle: endAngle, clockwise: false)
                        }else{
                            p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                        }
                        p.closeSubpath()
                    }
                    pieContext.fill(path, with: .color(color))
                    startAngle = endAngle
                }
            }
            .aspectRatio(1, contentMode: .fit)
        }else{
            //Contenido que aparece cuando no hay datos
            Image(systemName: "chart.pie.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
        }
        
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
