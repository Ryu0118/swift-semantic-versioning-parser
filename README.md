# SemanticVersioningParser
Easy semantic version parsing

# Usage
```Swift
import SemanticVersioningParser

let version1 = try SemanticVersioning.parseFromInfoPlist()
let version2 = try SemanticVersioning.parse(versionString: "1.0.0")
```
