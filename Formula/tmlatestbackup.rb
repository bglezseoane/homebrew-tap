class Tmlatestbackup < Formula
  desc "Really simple CLI app to obtain the date of the last Mac OS Time Machine backup"
  homepage "https://github.com/bglezseoane/tmlatestbackup"
  url "https://github.com/bglezseoane/tmlatestbackup/releases/latest/download/tmlatestbackup-mac.tar.gz"
  version "0.1.2"
  sha256 "cdc9ab7a53f021751ca5191d4a2838e938f03391ab2904c7a9f5038eaf67df79"

  def install
    bin.install "tmlatestbackup"
  end
end
