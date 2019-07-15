import Foundation

// MARK: - MyCareer
struct MyCareer: Codable {
    let studies: Studies
    let currentJob: CurrentJob
    let lastJob: LastJob
    let sections: Int
}

// MARK: - CurrentJob
struct CurrentJob: Codable {
    let titleSection: String
    let text: String
    let rowsInSection: Int
}

// MARK: - LastJob
struct LastJob: Codable {
    let titleSection: String
    let resume: String
    let rowsInSection: Int
}

// MARK: - Studies
struct Studies: Codable {
    let titleSection: String
    let studie: String
    let rowsInSection: Int
}
