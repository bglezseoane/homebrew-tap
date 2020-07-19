class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/d8/3a/dc99c1d4d8db68057f3125dd5f6b0dce3986da9250e52ba6bd87f6017779/fwitness-0.4.dev5.tar.gz"
  sha256 "63488c8236c52b2161f5f0598a35abcf196c167e8eb6ff763ecbb43613bca3c7"
  version "0.4.dev5"

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
