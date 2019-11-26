class Deventory < Formula
  include Language::Python::Virtualenv

  desc "The development project inventory manager"
  homepage "https://github.com/bglezseoane/deventory"
  url "https://github.com/bglezseoane/deventory/archive/v0.1dev0.tar.gz"
  sha256 "d942a2b51f4fe717accffb54a759aaa673ec8c3ba0faab1dba20554d56be9639"

  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "python", "-c", "'import deventory'"
  end
end
