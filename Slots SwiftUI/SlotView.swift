//
//  SlotView.swift
//  Slots SwiftUI
//
//  Created by Sergey Antoniuk on 11/17/20.
//

import SwiftUI

struct SlotView: View {
    @Binding var symbol: String
    @Binding var background: Color
    
    var body: some View {
        Image(symbol)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(background.opacity(0.4))
            .cornerRadius(20)
            
    }
}

struct SlotView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView(symbol: Binding.constant("cherry"), background: Binding.constant(Color.green))
    }
}
