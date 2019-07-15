import Foundation
import CoreGraphics

// MARK: - Storyboard name
enum Storyboard: String {
    case userInfo = "UserInfo"
    case cvMyCareer = "CVMyCareer"
}

// MARK: - Controller name
enum Controller: String {
    case cvInformation = "UserInfoViewController"
    case cvMyCareer = "MyCareerTableViewController"
    case alert = "AlertView"
}

// MARK: - Get URL base from xcconfig
enum Configuration {
    static func getUrl(for key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)
    }
}

// MARK: - Endpoint URLs
enum EndPoint: String {
    case userInfo = "rhgb7"
    case myCareer = "e5unb"
}

// MARK: - Default values
enum Default: String {
    case empty = ""
    case breakLine = "\n"
}

// MARK: - HTTP Methods
enum HTTP: String {
    case get = "GET"
}

// MARK: - Cell identifier
enum Cell: String {
    case cell = "UITableViewCell"
}

// MARK: - Comments
enum Comment: String {
    // MARK: - Alert controller comments
    case titleError = "Title error!"
    case messageError = "Message error!"
    case refreshAction = "Refresh action!"
    
    // MARK: - Viewcontroller comments
    case aboutMe = "About me view"
    case myCareer = "My Career view"
    case achivements = "Achivements view"
    
    // MARK: - Labels UserInfoView comments
    case labelAge = "Label Age"
    case labelPhone = "Label Phone"
    case labelEmail = "Label Email"
}

// MARK: - Values number type
enum NumberF: Float {
    case zero = 0.0
    case half = 2.0
    case duration = 6.6
    case toValue = 1.4
}

enum NumberI: Int {
    case empty = 0
}

// MARK: - NetworkErrors
enum NetworkingErrors: Error{
    case netWorkError
    case invalidData
    case invalidRequest
}

// MARK: - Accessibilit yIdentifiers
enum AccessibilityIdentifiers: String {
    case moreInfo = "moreInfoButton"
    case myCareerNavBar = "myCareerNavigationBar"
}
  
// MARK: - Transition Animation Duration
enum TransitionAnimationDuration {
    static let hideDuration = 0.5
    static let showDuration = 0.6
}

// MARK: - Define metrics
enum Metrics {
    static let defaultSpace: CGFloat = 8.0
    static let circleMultiplier: CGFloat = 0.1
}

// MARK: - Size fonts
enum FontSize {
    static let alertTile: CGFloat = 22.0
    static let alertMessage: CGFloat = 16.0
    static let circleButton: CGFloat = 32.0
}

// MARK: - More information button
enum Button: String {
    case plus = "+"
}
