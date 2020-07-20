class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/a1/ec/a432a020690949429b3491a208b905a1fd9e2953656fb5fb713b95794de1/fwitness-0.4.dev6.tar.gz"
  sha256 "578d7aedc187aa641d417f95cd81075d8a664213c8db0fc777c22416886d1d44"
  version "0.4.dev6"

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
