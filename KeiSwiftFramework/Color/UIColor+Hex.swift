//
//  UIColor+Hex.swift
//
//  Copyright (c) 2016 Keun young Kim <app@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public extension UIColor {
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - Initializing a UIColor Object
    
    /**
     Initializes and returns a color object using the hexadecimal color string.
     
     - Parameter hexString: the hexadecimal color string.
     
     - Returns: An initialized color object. If *hexString* is not a valid hexadecimal color string, returns a color object whose grayscale value is 1.0 and whose alpha value is 1.0.
     */
    public convenience init(hexString: String) {
        var red: CGFloat    = 1.0
        var green: CGFloat  = 1.0
        var blue: CGFloat   = 1.0
        var alpha: CGFloat  = 1.0
        
        if let color = hexString.parseHexColorString() {
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        }
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }    
}