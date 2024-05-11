import UIKit

public enum FontName: String {
    case urbanistRegular = "Urbanist-Regular"
//    case spaceGroteskLight = "SpaceGrotesk-Light"
//    case spaceGroteskMedium = "SpaceGrotesk-Medium"
//    case spaceGroteskSemiBold = "SpaceGrotesk-SemiBold"
    case urbanistBold = "Urbanist-Bold"
}

public extension UIFont {

    static var title: UIFont {
        font(with: .urbanistBold, and: 28)
    }

    static var heading: UIFont {
        font(with: .urbanistBold, and: 18)
    }

    static var subheading: UIFont {
        font(with: .urbanistRegular, and: 14)
    }
    
    static var headline: UIFont {
        font(with: .urbanistBold, and: 16)
    }
//
//    static var subheadlineBold: UIFont {
//        font(with: .publicSansSemiBold, and: 15)
//    }
//
//    static var privacyLabel: UIFont {
//        font(with: .publicSansRegular, and: 15)
//    }
//    
//    static var body: UIFont {
//        font(with: .publicSansRegular, and: 17)
//    }

    internal static func font(with name: FontName, and size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name.rawValue, size: size) else {
            fatalError("""
                Failed to load the "\(name.rawValue)" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }

        return font
    }
}
