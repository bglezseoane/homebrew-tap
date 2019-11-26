class Gitfind < Formula
  desc "Find local git repositories"
  homepage "https://github.com/bglezseoane/gitfind"
  url "https://github.com/bglezseoane/gitfind/archive/v2.0.tar.gz"
  sha256 "626b54b0441e1af7f61ca2e94ea30fa120a061c55e5fb700d855b918cf62de7d"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "gitfind"
  end
end
