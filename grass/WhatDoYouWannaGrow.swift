//
//  WhatDoYouWannaGrow.swift
//  grass
//
//  Created by T Krobot on 27/10/22.
//

import SwiftUI

struct WhatDoYouWannaGrow: View {
    var body: some View {
        
        Text("What do you want to grow?")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
        
        
        Button("My plant is not here") {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 87.75)
        .foregroundColor(.white)
        .background(Color(red: -0.123, green: 0.285, blue: 0.225))
        .cornerRadius(22.0)
    }
}


struct WhatDoYouWannaGrow_Previews: PreviewProvider {
    static var previews: some View {
        WhatDoYouWannaGrow()
    }
}
