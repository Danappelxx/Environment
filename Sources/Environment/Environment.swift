#if os(Linux)
import Glibc
#else
import Darwin
#endif

public struct Environment {

    public init() { }

    public func getVar(name: String) -> String? {
        let out = getenv(name)
        return String.fromCString(out)
    }

    public func removeVar(name: String) {
        unsetenv(name)
    }

    public func setVar(name: String, value: String, replace: Bool = true) {
        setenv(name, value, replace ? 1 : 0)
    }
}

