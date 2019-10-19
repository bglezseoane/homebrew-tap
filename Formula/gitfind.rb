class Gitfind < Formula
  desc "Find local git repositories"
  homepage "https://github.com/glezseoane/gitfind"
  url "https://github.com/glezseoane/gitfind/archive/v1.5.tar.gz"
  sha256 "923f1f3824f739e9207059cb70de819ed20b7a92efad637abf4c3408a62656ed"

  def install
    bin.install "gitfind"
    man1.install "docs/gitfind.1"
  end

  test do
    system "gitfind"
  end
end
