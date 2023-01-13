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
    
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set : { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
        )
        
        let tyrePackageBinding = Binding<Bool> (
            get : { self.tyresPackage },
            set : { newValue in
                self.tyresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        
        let fuelInjectionPackageBinding = Binding<Bool> (
            get : { self.fuelInjectionPackage },
            set : { newValue in
                self.fuelInjectionPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1.5
                } else {
                    starterCars.cars[selectedCar].acceleration += 1.5
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
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    starterCars.cars[selectedCar].handling -= 1
                }
            }
        )
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text(starterCars.cars[selectedCar].displayStats())
                Button("Next Car", action: {
                    if exhaustPackage == true {
                        starterCars.cars[selectedCar].topSpeed -= 5
                        exhaustPackage = false
                    }
                    
                    if tyresPackage == true {
                        starterCars.cars[selectedCar].handling -= 2
                        tyresPackage = false
                    }
                    
                    if fuelInjectionPackage == true {
                        starterCars.cars[selectedCar].acceleration += 1.5
                        fuelInjectionPackage = false
                    }
                    
                    if bodyKit == true {
                        starterCars.cars[selectedCar].topSpeed -= 5
                        starterCars.cars[selectedCar].handling -= 1
                        bodyKit = false
                    }
                    
                    selectedCar += 1
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Tyres Package", isOn: tyrePackageBinding)
                Toggle("Fuel Injection Package", isOn: fuelInjectionPackageBinding)
                Toggle("Body Kit", isOn: bodyKitBinding)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
