//
//  ContentView.swift
//  WeSplit
//
//  Created by yaelahbro on 04/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 0
    @State private var textmod = true
    
    
    let tipPercentages = [0,10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tip = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tip
        let amounPerPerson = grandTotal / peopleCount
        
        return amounPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tip = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tip
        
        return grandTotal
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    TextField("Harga" , text:$checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Jumlah Orang", text:$numberOfPeople)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("Tip Percentage")){
                    Picker("Tip Percentage", selection:$tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                }
                
                Section(header: Text("Total Pembayaran")){
                    Text("Rp \(grandTotal,specifier: "%.2f")")
                        .foregroundColor(self.textmod ? .blue : .red)
                }
                
                Section(header: Text("Harga Per Orang")){
                    Text("Rp \(totalPerPerson,specifier: "%.2f")")
                }
                
                
            } .navigationBarTitle("PtPt App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
