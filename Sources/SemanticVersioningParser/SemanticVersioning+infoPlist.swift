import Foundation

public extension SemanticVersioning {
    static func parseFromInfoPlist() throws -> SemanticVersioning {
        guard let versionString = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            throw SemanticVersioningParseError.cannotReadInfoPlist
        }
        return try SemanticVersioning.parse(versionString: versionString)
    }
}
