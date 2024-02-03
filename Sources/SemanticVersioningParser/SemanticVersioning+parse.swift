import RegexBuilder

public extension SemanticVersioning {
    static func parse(versionString: String) throws -> SemanticVersioning {
        let regex = Regex {
            Capture {
                OneOrMore(.digit)
            }
            "."
            Capture {
                OneOrMore(.digit)
            }
            "."
            Capture {
                OneOrMore(.digit)
            }
        }

        if let match = try regex.firstMatch(in: versionString),
           let major = Int(match.1),
           let minor = Int(match.2),
           let patch = Int(match.3) {
            return SemanticVersioning(major: major, minor: minor, patch: patch)
        } else {
            throw SemanticVersioningParseError.failedToParse
        }
    }
}
