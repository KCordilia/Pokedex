//
//  SegmentedControlView.swift
//  Pokedex
//
//  Created by Karim Cordilia on 16/12/2024.
//

import SwiftUI

struct SegmentedControlView: View {
    @State private var selectedIndex: Int = 0
    let segments: [String]
    
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
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(selectedIndex == index ? .primary : .secondary)
                            .frame(maxWidth: .infinity) // Equal spacing for all segments
                    }
                }
            }
            .padding(.bottom, 8)
            
            // Highlight Bar
            GeometryReader { geometry in
                let segmentWidth = geometry.size.width / CGFloat(segments.count)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: segmentWidth / 2, height: 3)
                    .offset(x: CGFloat(selectedIndex) * segmentWidth + segmentWidth / 4)
                    .animation(.easeInOut, value: selectedIndex)
            }
            .frame(height: 3) // Fixed height for the bar
        }
        .padding()
    }
}

#Preview {
    SegmentedControlView(segments: MockData.createMockSegments())
}
