//
//  SegmentedControlView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 16/12/2024.
//

import SwiftUI

struct SegmentedControlView: View {
    let segments: [String]
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack {
            // Segments
            HStack {
                ForEach(segments.indices, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            selectedIndex = index
                        }
                    }) {
                        Text(segments[index])
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(selectedIndex == index ? .black : .gray)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.bottom, 8)
            
            GeometryReader { geometry in
                let segmentWidth = geometry.size.width / CGFloat(segments.count)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: segmentWidth, height: 3)
                    .offset(x: CGFloat(selectedIndex) * segmentWidth)
                    .animation(.easeInOut, value: selectedIndex)
            }
            .frame(height: 3)
        }
        .padding()
    }
}

#Preview {
    SegmentedControlView(segments: MockData.createMockSegments(), selectedIndex: .constant(0))
}
