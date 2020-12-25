class Cpcalendars < Formula
  desc "CLI app to copy Mac OS Calendar.app calendars sources to other location"
  homepage "https://github.com/bglezseoane/cpcalendars"
  url "https://github.com/bglezseoane/cpcalendars/releases/latest/download/cpcalendars-mac.tar.gz"
  version "0.1.0"
  sha256 "b20a3217bd6848404362dc6790bdbc69fcd701cb7175c29f91fb2d768639ced2"

  def install
    bin.install "cpcalendars"
  end
end
