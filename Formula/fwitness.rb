class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/f0/c1/3f9eeeb7d17c76ace033827e71a8c04dc6d46dc8994bc3c1b045a61b4c7c/fwitness-0.2.dev3.tar.gz"
  sha256 "cf25e9cdbc28baf53a546001c18644f7ddf72063850aafc322be218d5af44b80"
  version "0.2.dev3"

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
