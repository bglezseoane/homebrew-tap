class Cpcalendars < Formula
  desc "CLI app to copy Mac OS Calendar.app calendars sources to other location"
  homepage "https://github.com/bglezseoane/cpcalendars"
  url "https://github.com/bglezseoane/cpcalendars/releases/latest/download/cpcalendars-mac.tar.gz"
  version "0.1.1"
  sha256 "a2113b6e71df8a2133f3c0f493bdaa9017824eff43d41cee68ee8519af5b7851"

  def install
    bin.install "cpcalendars"
  end
end
