cask "onibox" do
  version "1.0.53-1.14.5"
  sha256 "5fc0dafef7a268b7270da178cfe90e9fa6d6f633d629d4a8c261e4eb16913883"

  url "https://github.com/onikyannn/homebrew-tap/releases/download/v#{version}/Onibox-#{version}-macOS-arm64.pkg"

  depends_on arch: :arm64

  installer script: {
    executable: "/usr/sbin/installer",
    args:       ["-allowUntrusted", "-pkg", "#{staged_path}/Onibox-#{version}-macOS-arm64.pkg", "-target", "/"],
    sudo:       true,
  }

  uninstall launchctl: "com.onibox.daemon",
            quit:      "com.onibox.app",
            pkgutil:   "com.onibox.pkg"
end
