cask "onibox" do
  version "1.0.45-1.14.3"
  sha256 "0ebd96bf0c266d456345db7a2704d1d88c617a5d44d2205fc02d80ad1d50f16a"

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
