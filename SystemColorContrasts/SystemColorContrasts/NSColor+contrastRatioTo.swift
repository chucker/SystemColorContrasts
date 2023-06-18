//
//  NSColor+contrastRatioTo.swift
//  SystemColorContrasts
//
//  Created by Sören Kuklau on 18.06.23.
//

import AppKit
import Foundation

extension NSColor {
    private static func clampComponent(component: CGFloat) -> Double {
        let _component = Double(component)

        if _component <= 0.03928 {
            return _component / 12.92
        }

        return pow((_component + 0.055) / 1.055, 2.4)
    }

    private func relativeSRGBLuminance() -> Double {
        return
            0.2126 * Self.clampComponent(component: redComponent) +
            0.7152 * Self.clampComponent(component: greenComponent) +
            0.0722 * Self.clampComponent(component: blueComponent)
    }

    func contrastRatio(to otherColor: NSColor) -> Double {
        let l1 = self.relativeSRGBLuminance()
        let l2 = otherColor.relativeSRGBLuminance()
        
        let lHi = max(l1, l2)
        let lLo = min(l1, l2)

        return (lHi + 0.05) / (lLo + 0.05)
    }
}
