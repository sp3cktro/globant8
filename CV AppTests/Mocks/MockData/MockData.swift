
import Foundation
@testable import CV_App

class MockData {
    func getBasicInformationData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: Asset.basicInformation.rawValue, ofType: ExtensionFile.json.rawValue) else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        return data
    }
    
    func getInvalidInformationData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: Asset.failBasicInformation.rawValue, ofType: ExtensionFile.json.rawValue) else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        return data
    }
    
    func getUserInformation(data: Data) -> UserInfo? {
        let model = try? JSONDecoder().decode(UserInfo.self, from: data)
        return model
    }
    
    func getCareerInformation(data: Data) -> MyCareer? {
        let model = try? JSONDecoder().decode(MyCareer.self, from: data)
        return model
    }

    func getCareerInformationData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: Asset.careerInformation.rawValue, ofType: ExtensionFile.json.rawValue) else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        return data
    }
    
    func getCareerInvalidInformationData() -> Data? {
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: Asset.failCareerInformation.rawValue, ofType: ExtensionFile.json.rawValue) else {
            return nil
        }
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        return data
    }
}
