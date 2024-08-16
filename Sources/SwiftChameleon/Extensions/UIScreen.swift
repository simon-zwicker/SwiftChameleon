//  File.swift
//  
//
//  Created by Nico on 16.05.24.
//  
//

import Foundation
#if canImport(SwiftUI)
import SwiftUI

#if canImport(UIKit)
public extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
#endif
#endif
