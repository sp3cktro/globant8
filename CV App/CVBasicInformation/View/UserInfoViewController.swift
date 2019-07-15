import UIKit

class UserInfoViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var userNameLabel: UILabel?
    @IBOutlet weak var ageLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?
    @IBOutlet weak var cellphoneLabel: UILabel?
    @IBOutlet weak var profileUserImage: UIImageView?
    @IBOutlet weak var aboutMeLabel: UILabel?
    
    // MARK: - Properties
    var presenter: MainPresenterProtocol?
    var user: UserInfo?
    var linkedInUrl: String?
    var pulseLayers = [CAShapeLayer]()
    var moreInfoButton: UIButton?
    var navigationDelegate: NavigationDelegate?
    var alertView: AlertView?
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    //MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.updateView()
        
        configureMoreInfoButton(CircleButtonFactory.createCircleButton())
        
        if let navigationController = self.navigationController {
            navigationDelegate = NavigationDelegate()
            navigationController.delegate = navigationDelegate
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        animatePulse()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moreInfoButton?.circled()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func configureMoreInfoButton(_ button: UIButton?) {
        moreInfoButton = button
        moreInfoButton?.accessibilityIdentifier = AccessibilityIdentifiers.moreInfo.rawValue
        guard let button = button else {
            return
        }
        
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: Metrics.circleMultiplier),
            button.heightAnchor.constraint(equalTo: button.widthAnchor),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -Metrics.defaultSpace),
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.defaultSpace)
            ])
        
        button.addTarget(self, action: #selector(didTapMoreInfoButton), for: .touchUpInside)
    }
    
    @objc func didTapMoreInfoButton() {
        presenter?.myCareerPressed()
    }
    
    @objc func willEnterForeground() {
        animatePulse()
    }
    
    func animatePulse() {
        guard let profileImage = profileUserImage else {
            return
        }
        
        PulseScaleAnimation(forView: profileImage).animatePulse()
    }
}
