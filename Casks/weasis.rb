cask "weasis" do
  # I am not the author of this software. I just write this recipe
  version "3.7.0"
  sha256 "b67a137621caa0a969dcb16e91c2583a059c654f4dd8c60436d66a137ca7960c"

  url "https://github.com/nroduit/Weasis/releases/download/v3.7.0/Weasis-3.7.0.pkg",
      verified: "https://github.com/nroduit"
  name "Weasis"
  desc "DICOM viewer available as a desktop application or as a web-based application"
  homepage "https://nroduit.github.io/en/"

  pkg "Weasis-3.7.0.pkg"

  uninstall pkgutil: [
    "org.weasis.viewer",
  ]
end
