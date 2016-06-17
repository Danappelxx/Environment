#if os(Linux)
import Glibc
#else
import Darwin
#endif

public struct Environment {
    public static func getVar(_ name: String) -> String? {
        guard let out = getenv(name) else { return nil }
        return String(validatingUTF8: out)
    }

    public static func removeVar(_ name: String) {
        unsetenv(name)
    }

    public static func setVar(_ name: String, value: String, replace: Bool = true) {
        setenv(name, value, replace ? 1 : 0)
    }
}
