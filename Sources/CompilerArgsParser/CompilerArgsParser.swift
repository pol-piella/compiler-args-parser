public enum CompilerArgsParser {
    public static func parseArguments(forProject project: XCodeProject) throws -> [Component] {
        let buildLog = try Shell.execute(command: "/usr/bin/xcodebuild", args: ["-workspace", project.path, "-scheme", project.scheme, "-sdk", project.sdk, "clean", "build"])
        return Parser.parse(output: buildLog)
    }
}
