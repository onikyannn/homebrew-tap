cask "onibox" do
  version "1.0.43-1.14.3"
  sha256 "c5b2ab228dd25f0bcec4ae8e0c7e8467011f33f7cc0ddd1f856d5f77b0031dd9"

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
