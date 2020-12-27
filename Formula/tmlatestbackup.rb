class Tmlatestbackup < Formula
  desc "Really simple CLI app to obtain the date of the last Mac OS Time Machine backup"
  homepage "https://github.com/bglezseoane/tmlatestbackup"
  url "https://github.com/bglezseoane/tmlatestbackup/releases/latest/download/tmlatestbackup-mac.tar.gz"
  version "0.1.0"
  sha256 "a899c7812233837906cf0cf8a76970df3dfcd9ac156f0658ed55b9cb008127fe"

  def install
    bin.install "tmlatestbackup"
  end
end
