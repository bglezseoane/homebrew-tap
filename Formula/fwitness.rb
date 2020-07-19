class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/03/6e/b0d0110a4d91f353af02b2402fd0317083885edd8a3ba7fd03b7f07a03fc/fwitness-0.4.dev2.tar.gz"
  sha256 "ad5097ee4ffa053bc914a891b1e9d1513446e7ad41bf2245ad7bb47ecf717fc2"
  version "0.4.dev2"

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
