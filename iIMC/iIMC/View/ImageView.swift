//
//  ImageView.swift
//  iIMC
//
//  Created by Lucas Parreira on 5/07/21.
//

import SwiftUI

struct ImageView: View {
    let resultado: Double?
        var body: some View {
        ZStack{
            Image("body")
                .resizable()
                .frame(width: resultado ?? 0.0 > 25 ? 500 : 200,height: resultado ?? 0.0 > 25 ? 300 : 300)
                
                
            Text("\(resultado ?? 0.0, specifier: "%.1f")")
                .padding(.top,280)
                .font(.system(size: 40))
                .foregroundColor(resultado ?? 0.0 > 25.0  ? .red : .black)
            
            VStack{
                if (resultado ?? 0.0 <= 18.5){
                    Text("Peso inferior ao adequado")
                } else if (resultado ?? 0.0 > 25.0 && resultado ?? 0.0 < 30.0){
                    Text("Peso superior ao adequado")
                } else if (resultado ?? 0.0 > 18.5 && resultado ?? 0.0 < 25.0){
                    Text("Peso considerado adequado")
                } else {
                    Text("Quadro de obesidade. Procure um médico!")
                   }
            }.padding(.top,-140)
       }
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(resultado: 0.0)
    }
}

//    Peso inferior al normal 18.5
//    Normal    18.5 – 24.9
//    Peso superior al normal    25.0 – 29.9
//    Obesidad    Más de 30.0
