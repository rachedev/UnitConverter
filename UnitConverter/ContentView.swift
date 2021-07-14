//
//  ContentView.swift
//  UnitConverter
//
import SwiftUI

struct ContentView: View {
    @State private var length = ""
    @State private var fromUnit = 0
    @State private var toUnit = 0
    
    let fromUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    let toUnits = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var inputLength: Measurement<UnitLength> {
        let numberLength = Double(length) ?? 0
        let selectedFromUnit = "\(fromUnits[fromUnit])"
        
        switch selectedFromUnit {
        case "meters":
            let lengthOrig = Measurement(value: numberLength, unit: UnitLength.meters)
            return lengthOrig
        case "kilometers":
            let lengthOrig = Measurement(value: numberLength, unit: UnitLength.kilometers)
            return lengthOrig
        case "feet":
            let lengthOrig = Measurement(value: numberLength, unit: UnitLength.feet)
            return lengthOrig
        case "yards":
            let lengthOrig = Measurement(value: numberLength, unit: UnitLength.yards)
            return lengthOrig
        default:
            let lengthOrig = Measurement(value: numberLength, unit: UnitLength.miles)
            return lengthOrig
        }
    }
      
    var outputLength: Measurement<UnitLength> {
        let selectedToUnit = "\(toUnits[toUnit])"
        
        switch selectedToUnit {
        case "meters":
            let lengthOutput = inputLength.converted(to: UnitLength.meters)
            return lengthOutput
        case "kilometers":
            let lengthOutput = inputLength.converted(to: UnitLength.kilometers)
            return lengthOutput
        case "feet":
            let lengthOutput = inputLength.converted(to: UnitLength.feet)
            return lengthOutput
        case "yards":
            let lengthOutput = inputLength.converted(to: UnitLength.yards)
            return lengthOutput
        default:
            let lengthOutput = inputLength.converted(to: UnitLength.miles)
            return lengthOutput
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter length to be converted", text: $length)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Original unit of length")) {
                    Picker("From Unit", selection: $fromUnit) {
                        ForEach(0 ..< fromUnits.count) {
                            Text("\(self.fromUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Desired unit of length")) {
                    Picker("To Unit", selection: $toUnit) {
                        ForEach(0 ..< toUnits.count) {
                            Text("\(self.toUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Length in desired unit")) {
                    Text("\(outputLength)")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
