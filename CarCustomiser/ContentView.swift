//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Leo Hammond on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tyresPackage = false
    @State private var fuelInjectionPackage = false
    @State private var bodyKit = false
    @State private var remainingFunds = 1000
    
    var exhaustPackageDisabled: Bool {
        if remainingFunds < 500 && exhaustPackage == false {
            return true
        } else {
            return false
        }
    }
    
    var tyresPackageDisabled: Bool {
        if remainingFunds < 500 && tyresPackage == false {
            return true
        } else {
            return false
        }
    }
    
    var fuelInjectionPackageDisabled: Bool {
        if remainingFunds < 500 && fuelInjectionPackage == false {
            return true
        } else {
            return false
        }
    }
    
    var bodyKitDisabled: Bool {
        if remainingFunds < 1000 && bodyKit == false {
            return true
        } else {
            return false
        }
    }
    
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set : { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        
        let tyrePackageBinding = Binding<Bool> (
            get : { self.tyresPackage },
            set : { newValue in
                self.tyresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        
        let fuelInjectionPackageBinding = Binding<Bool> (
            get : { self.fuelInjectionPackage },
            set : { newValue in
                self.fuelInjectionPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration += 1.5
                    remainingFunds += 500
                }
            }
        )
        
        let bodyKitBinding = Binding<Bool> (
            get : { self.bodyKit },
            set : { newValue in
                self.bodyKit = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    starterCars.cars[selectedCar].handling += 1
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    starterCars.cars[selectedCar].handling -= 1
                    remainingFunds += 1000
                }
            }
        )
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Next Car", action: {
                        resetStats()
                        selectedCar += 1
                    })
                }
                Section {
                    Toggle("Exhaust Package: 500", isOn: exhaustPackageBinding)
                        .disabled(exhaustPackageDisabled)
                    Toggle("Tyres Package: 500", isOn: tyrePackageBinding)
                        .disabled(tyresPackageDisabled)
                    Toggle("Fuel Injection Package: 500", isOn: fuelInjectionPackageBinding)
                        .disabled(fuelInjectionPackageDisabled)
                    Toggle("Body Kit: 1000", isOn: bodyKitBinding)
                        .disabled(bodyKitDisabled)
                }
            }
            Text("Remaining funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
    func resetStats() {
        if exhaustPackage == true {
            starterCars.cars[selectedCar].topSpeed -= 5
            remainingFunds += 500
            exhaustPackage = false
        }
        
        if tyresPackage == true {
            starterCars.cars[selectedCar].handling -= 2
            remainingFunds += 500
            tyresPackage = false
        }
        
        if fuelInjectionPackage == true {
            starterCars.cars[selectedCar].acceleration += 1.5
            remainingFunds += 500
            fuelInjectionPackage = false
        }
        
        if bodyKit == true {
            starterCars.cars[selectedCar].topSpeed -= 5
            starterCars.cars[selectedCar].handling -= 1
            remainingFunds += 1000
            bodyKit = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

