//
//  CollapsibleView.swift
//  RayosXCordinador
//
//  Created by Alumno on 26/09/23.
//

import SwiftUI

struct CollapsibleView: View {
    
    @State var label: () -> Text
    @State var content: () -> Content
        
    @State private var collapsed: Bool = true
    
    
    var body: some View {
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
                    
                    VStack {
                        self.content()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
                    .clipped()
                    .animation(.easeOut)
                    .transition(.slide)
    }
}

struct CollapsibleView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsibleView()
    }
}
