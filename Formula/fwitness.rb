class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/2c/28/48316f7751dc6c7eede1500a8a9c2e7eb2f7eb513e9ccd551e170fa9bf05/fwitness-0.2.dev1.tar.gz"
  sha256 "a02882b8c209c7ba3464c8eda542486c29d474bed0a8e059c0b27d604119b55b"
  version "0.2.dev1"

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
