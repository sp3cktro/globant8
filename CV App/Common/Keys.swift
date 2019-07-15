import Foundation

// MARK: - Keys to get a URL from xcconfig
enum URLKey: String {
    case request = "BaseURL"
}

// MARK: - Animation keys
enum AnimationKey: String {
    case transform = "transform.scale"
    case scale = "scale"
    case opacity = "opacity"
}

// MARK: - Keys for localizable strings
enum StringKey: String {
    // MARK: - Alert controller strings
    case titleError = "titleError"
    case messageError = "messageError"
    case refreshAction = "refreshAction"
    
    // MARK: - Title view strings
    case aboutMe = "aboutMe"
    case myCareer = "myCareer"
    case achivements = "achivements"
    
    // MARK: - Labels at user info view
    case age = "labelAge"
    case phone = "labelPhone"
    case email = "labelEmail"
    case skills = "labelAboutMe"
    
    // MARK: - Alert atributes
    case attributedTitle = "attributedTitle"
    case attributedMessage = "attributedMessage"
}
