import Foundation

/**
 A value that represents success or failure including an associated value.
 */
public enum Result<Success, Failure> where Failure: Error{
    case success(Success)
    case failure(Failure)
}
