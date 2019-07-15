import XCTest
@testable import CV_App


class UserInformationView: XCTestCase, CommonMethods {
    
    var userInformationViewController: UserInfoViewController?

    override func setUp() {
        let storyboard = UIStoryboard.init(name: Storyboard.userInfo.rawValue, bundle: Bundle.main)
        userInformationViewController = storyboard.instantiateViewController(withIdentifier: Controller.cvInformation.rawValue) as? UserInfoViewController
    }

    override func tearDown() {
        userInformationViewController = nil
        super.tearDown()
    }
    
    func testElements() {
        userInformationViewController?.loadViewIfNeeded()
        
        XCTAssertNotNil(userInformationViewController?.userNameLabel)
        XCTAssertNotNil(userInformationViewController?.ageLabel)
        XCTAssertNotNil(userInformationViewController?.emailLabel)
        XCTAssertNotNil(userInformationViewController?.cellphoneLabel)
        XCTAssertNotNil(userInformationViewController?.profileUserImage)
        XCTAssertNotNil(userInformationViewController?.aboutMeLabel)
        XCTAssertNotNil(userInformationViewController?.configureMoreInfoButton(CircleButtonFactory.createCircleButton()))
    }
    
    func testViewDisplayCorrectInformation() {
        let userData = getDataFrom(file: Asset.basicInformation.rawValue)
        guard let model = MockData().getUserInformation(data: userData) else {
            XCTFail(Fail.loadData.rawValue)
            return
        }
        userInformationViewController?.loadViewIfNeeded()
        userInformationViewController?.showUserInfo(with: model)
        guard let user = userInformationViewController?.user else {
            XCTFail(Fail.notDisplayInformation.rawValue)
            return
        }
        XCTAssertEqual(user.userName, "Globant User 8")
        XCTAssertEqual(user.age, 22)
        XCTAssertEqual(user.cellphone, "(044)5596914640")
        XCTAssertEqual(user.email, "globantUser8@globant.com")
        XCTAssertEqual(user.skills, "I'm consider that I have alot of Softskills, and y work very well in a team, I like to have constant communication with my coworkers. I been working on Swift since 2 and half years and I know how to work with Cocoapods and MVC, VIPER and Flow Coordinator patterns design.")
    }
    
    func testAlertView() {
        userInformationViewController?.loadViewIfNeeded()
        userInformationViewController?.showNetworkingError()
        guard let alertView = userInformationViewController?.alertView else {
            XCTFail(Fail.notDisplayInformation.rawValue)
            return
        }
        
        let alertTitle = NSLocalizedString(StringKey.titleError.rawValue, comment: Comment.titleError.rawValue)
        let alertMessage = NSLocalizedString(StringKey.messageError.rawValue, comment: Comment.messageError.rawValue)
        let alertAction = NSLocalizedString(StringKey.refreshAction.rawValue, comment: Comment.refreshAction.rawValue)
        
        XCTAssertEqual(alertView.title , alertTitle)
        XCTAssertEqual(alertView.message , alertMessage)
        XCTAssertEqual(alertView.actions.first?.title , alertAction)
    }
}
