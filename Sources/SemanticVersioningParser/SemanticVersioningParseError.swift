import Foundation

public enum SemanticVersioningParseError: Error {
    case failedToParse
    case cannotReadInfoPlist
}
