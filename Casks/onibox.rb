cask "onibox" do
  version "1.0.47-1.14.3"
  sha256 "472515dae53dae21ef59d688c36e05f224085750b23f95d6c57c68f45f83a5dc"

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
