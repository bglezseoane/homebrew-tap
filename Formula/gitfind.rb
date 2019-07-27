class Gitfind < Formula
  desc "Find local git repositories"
  homepage "https://gitlab.com/GlezSeoane/gitfind"
  url "https://gitlab.com/GlezSeoane/gitfind/-/archive/v1.4/gitfind-v1.4.tar.gz"
  sha256 "3471c8844b91330c29d6eb48c5e62ac4e54a702c7d3d72404e7c6f72bb846db1"

  def install
    bin.install "gitfind"
    man1.install "docs/gitfind.1"
  end

  test do
    system "gitfind"
  end
end
