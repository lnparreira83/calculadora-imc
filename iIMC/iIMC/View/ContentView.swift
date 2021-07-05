//
//  ContentView.swift
//  iIMC
//
//  Created by Lucas Parreira on 5/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var peso = ""
    @State var altura = ""
    @State var resultado = 0.0
    @State var showImage = false
    @State var amount = 0.0
    
    func cleanCalcIMC(){
        peso = ""
        altura = ""
        resultado = 0.0
        showImage = false
    }
    
    func calcIMC() -> Double {
        let pesoCon = Double(peso) ?? 0.0
        let alturaCon = Double(altura) ?? 0.0
        resultado = pesoCon / (alturaCon * alturaCon)
        showImage.toggle()
        return resultado
    }
    
    func buttonCalcIMC() -> some View {
        return
            Button(action:{
                calcIMC()
                hideKeyboard()
            },label:{
                Text("Calcular IMC")
                    .frame(width:250, height: 40)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    
            })
            
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment:.center){
                        TextField("Informe seu peso",text: $peso)
                            .font(.headline)
                            .frame(height:40)
                            .keyboardType(.decimalPad)
                    
                        TextField("Informe a altura",text:$altura)
                            .frame(height:40)
                            .font(.headline)
                            .keyboardType(.decimalPad)
                            
                    
                        if !peso.isEmpty && !altura.isEmpty {
                            buttonCalcIMC()
                        }
                        
                Divider()
//                if resultado > 0.1 {
//                            Text("\(resultado, specifier: "%.2f")")
//                                .foregroundColor(.red)
//                                .font(.system(size: 45))
//                        }
                     Spacer()
                if showImage {
                    ImageView(resultado: resultado)
                        .animation(.linear)
                        
                    }
                  }
                    .padding()
                    .navigationTitle("Calculo IMC")
                .navigationBarItems(trailing: Button(action:{
                    cleanCalcIMC()
                },label:{
                    if showImage {
                        Image(systemName: "xmark")
                                .resizable()
                                .frame(width:15,height: 15)
                    }
                    
                }))
             }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
