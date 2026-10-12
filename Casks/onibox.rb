cask "onibox" do
  version "1.0.42-1.14.3"
  sha256 "1c1d8a3a7ac4d606b956141ff47aa0ed594257b2f85e8ed850773a78fd7848cc"

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
