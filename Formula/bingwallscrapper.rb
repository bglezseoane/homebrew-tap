class Bingwallscrapper < Formula
  desc "Bing.com wallpaper scrapper"
  homepage "https://github.com/bglezseoane/bingwallscrapper"
  url "https://github.com/bglezseoane/bingwallscrapper/archive/1.0.0.tar.gz"
  sha256 "f398fe3d83a9e4b6a02f7f73ab97a7bb36d5bfc96f42fe86b9cd6d1fd80abd58"

  def install
    bin.install "bingwallscrapper.sh" => "bingwallscrapper"
  end

  test do
    system "bingwallscrapper", "--version"
  end
end
