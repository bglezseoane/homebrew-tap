class Tmlatestbackup < Formula
  desc "Really simple CLI app to obtain the date of the last Mac OS Time Machine backup"
  homepage "https://github.com/bglezseoane/tmlatestbackup"
  url "https://github.com/bglezseoane/tmlatestbackup/releases/latest/download/tmlatestbackup-mac.tar.gz"
  version "0.1.1"
  sha256 "37ae5732fbe23a7448353239a4fbd42d915af3f6fee5d857c94ce9fa955f60f7"

  def install
    bin.install "tmlatestbackup"
  end
end
