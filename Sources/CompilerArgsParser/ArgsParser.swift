import Foundation
import SwifterRe

public struct Component {
    public let name: String
    public let compilerArguments: [String]
}

enum Parser {
    static func parse(output: String) -> [Component] {
        let matches = output.matching(pattern: #"swiftc.*-module-name\s(\w*\b)\s(.*)"#)
        return matches
            .map {
                Component(
                    name: $0.groups.first!.value,
                    compilerArguments: $0.groups[1].value
                        .replacingOccurrences(of: "=", with: " ")
                        .replacingOccurrences(of: "\\", with: "")
                        .split(separator: " ")
                        .map { String($0) }
                )
            }
    }
}
