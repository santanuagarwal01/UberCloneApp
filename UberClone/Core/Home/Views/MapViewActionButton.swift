//
//  MapViewActionButton.swift
//  UberClone
//
//  Created by Santanu Agarwal on 22/11/22.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation {
                actionForState(mapState)
            }
        }
    label: {
        Image(systemName: imageNameForState(mapState))
            .font(.title2)
            .foregroundColor(.black)
            .padding()
            .background(.white)
            .clipShape(Circle())
            .shadow(color: .black, radius: 6)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            print("No Input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedUberLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected, .polylineAdded:
            return "arrow.left"
        }
    }
}


struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
