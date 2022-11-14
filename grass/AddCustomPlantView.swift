//
//  AddCustomPlantView.swift
//  grass
//
//  Created by James Kuang on 29/10/22.
//

import SwiftUI

struct AddCustomPlantView: View {
    
    @State var plantName: String = ""
    @State var plantNickname: String = ""
    @State var pickerVisible = false
    
    var body: some View {
            VStack{
                List {
                    Section(header: Text("Basic Details")) {
                        TextField(
                        "Plant Name",
                        text: $plantName
                        )
                        TextField(
                        "Nickname",
                        text: $plantNickname
                        )
                    }
                    Section(header: Text("Plant Care")) {
                        Text("Maximum Temperature") // placeholder -> user adds max temperature here
                        Text("Minimum Temperature") // placeholder -> user adds min temperature here
                        Text("Watering Frequency") // placeholder -> user adds watering frequency here
                        Text("Fertilisation Frequency") // placeholder -> user adds fertilisation frequency here
                    }
                    Text("Add Plant")
                }
            }
            .foregroundColor(Color("Swamp Green"))
            .navigationTitle("Add Custom Plant")
        
    }
}

struct AddCustomPlantView_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomPlantView()
    }
}
