//
//  AccordionView.swift
//  CaritasRayosX
//
//  Created by Alumno on 22/09/23.
//

import SwiftUI

struct AccordionView<Content: View>: View {
    var body: some View {
        VStack {
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label()
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct AccordionView_Previews: PreviewProvider {
    static var previews: some View {
        AccordionView()
    }
}
