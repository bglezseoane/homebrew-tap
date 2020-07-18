class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/8b/ec/95e18ac485279b9cf790f0d34426d0416a03df5b27360f00cf69471d8154/fwitness-0.3.dev1.tar.gz"
  sha256 "7c8c12f918e76073322e9337df762af2dd10875db033b8a8f1595910eb30b88a"
  version "0.3.dev1"

  depends_on "python@3.8"
  depends_on "tag"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip", "install", "-r", "requirements.txt"
    system libexec/"bin/pip", "uninstall", "-y", "fwitness"
    venv.pip_install_and_link buildpath
  end

  test do
    system "python", "-c", "'import finder_witness'"
  end
end
