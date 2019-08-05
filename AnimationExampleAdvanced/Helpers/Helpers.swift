/*
 * Copyright (c) Francisco Obarrio - fobarrio@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *
 *
 * Basically ... Feel Free to use this code as you want :)
 */


import UIKit

protocol animTransitionable {
    var profileImageView: UIImageView { get }
    var backgroundImageView: UIImageView { get }    
    var plusImageView: UIImageView { get }
    var playImageView: UIImageView { get }
    var likeImageView: UIImageView { get }
    var cancelImageView: UIImageView { get }
    var backgroundColor: UIView { get }
    var cellBackground: UIView { get }
    var bigTitle: UILabel { get }
    var albumLbl: UILabel { get }
    var yearLbl: UILabel { get }
}




// Creates a UIColor from a Hex string.
extension String {
    var hexColor: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return .clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

func attributedString(from string: String, lineSpacing: CGFloat = 1.0, font: UIFont, fontColor: UIColor = UIColor.black, alignment: NSTextAlignment = .natural, kerning: CGFloat = 1.0) -> NSMutableAttributedString {
    
    let style = NSMutableParagraphStyle()
    style.lineSpacing = lineSpacing
    style.alignment = alignment
    
    let attrs = [
        NSAttributedStringKey.font: font,
        NSAttributedStringKey.foregroundColor: fontColor,
        NSAttributedStringKey.paragraphStyle: style,
        NSAttributedStringKey.kern: kerning
        ] as [NSAttributedStringKey : Any]
    
    let attrStr = NSMutableAttributedString(string: string, attributes: attrs)
    
    return attrStr
}

func addParabolaWithMax(maxPoint: CGPoint, inRect boundingRect: CGRect) -> UIBezierPath {
    
    func halfPoint1D(p0: CGFloat, p2: CGFloat, control: CGFloat) -> CGFloat {
        return 2 * control - p0 / 2 - p2 / 2
    }
    
    let path = UIBezierPath()
    
    let p0 = CGPoint(x: 0, y: boundingRect.maxY)
    let p2 = CGPoint(x: boundingRect.maxX, y: boundingRect.maxY)
    
    let p1 = CGPoint(x: halfPoint1D(p0: p0.x, p2: p2.x, control: maxPoint.x),
                     y: halfPoint1D(p0: p0.y, p2: p2.y, control: maxPoint.y))
    
    path.move(to: p0)
    path.addQuadCurve(to: p2, controlPoint: p1)
    return path
}

func duplicateLabel(label: UILabel) -> UILabel {
    let newLabel = UILabel(frame: label.frame)
    newLabel.font = label.font
    newLabel.textAlignment = label.textAlignment
    newLabel.textColor = label.textColor
    newLabel.backgroundColor = label.backgroundColor
    
    //newLabel.adjustsFontSizeToFitWidth = true
    
    return newLabel
}

extension UIFont {
    
    /**
     Will return the best font conforming to the descriptor which will fit in the provided bounds.
     */
    static func bestFittingFontSize(for text: String, in bounds: CGRect, fontDescriptor: UIFontDescriptor, additionalAttributes: [NSAttributedStringKey: Any]? = nil) -> CGFloat {
        let constrainingDimension = min(bounds.width, bounds.height)
        let properBounds = CGRect(origin: .zero, size: bounds.size)
        var attributes = additionalAttributes ?? [:]
        
        let infiniteBounds = CGSize(width: CGFloat.infinity, height: CGFloat.infinity)
        var bestFontSize: CGFloat = constrainingDimension
        
        for fontSize in stride(from: bestFontSize, through: 0, by: -1) {
            let newFont = UIFont(descriptor: fontDescriptor, size: fontSize)
            attributes[.font] = newFont
            
            let currentFrame = text.boundingRect(with: infiniteBounds, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attributes, context: nil)
            
            if properBounds.contains(currentFrame) {
                bestFontSize = fontSize
                break
            }
        }
        return bestFontSize
    }
    
    static func bestFittingFont(for text: String, in bounds: CGRect, fontDescriptor: UIFontDescriptor, additionalAttributes: [NSAttributedStringKey: Any]? = nil) -> UIFont {
        let bestSize = bestFittingFontSize(for: text, in: bounds, fontDescriptor: fontDescriptor, additionalAttributes: additionalAttributes)
        return UIFont(descriptor: fontDescriptor, size: bestSize)
    }
}

extension UILabel {
    
    /// Will auto resize the contained text to a font size which fits the frames bounds.
    /// Uses the pre-set font to dynamically determine the proper sizing
    func fitTextToBounds() {
        guard let text = text, let currentFont = font else { return }
        
        let bestFittingFont = UIFont.bestFittingFont(for: text, in: bounds, fontDescriptor: currentFont.fontDescriptor, additionalAttributes: basicStringAttributes)
        font = bestFittingFont
    }
    
    private var basicStringAttributes: [NSAttributedStringKey: Any] {
        var attribs = [NSAttributedStringKey: Any]()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        paragraphStyle.lineBreakMode = self.lineBreakMode
        attribs[.paragraphStyle] = paragraphStyle
        
        return attribs
    }
}

