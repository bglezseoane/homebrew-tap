class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "A program to consolidate Mac OS Finder and Spotlight metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/9e/67/f2316c5d1a34b1a9f6d94f2215489da76c31209e6b357330e121aadf29c1/fwitness-0.1.dev2.tar.gz"
  sha256 "36c632f97b256b3ea250642de7aecb2b7fe93be99f727a16d9f7cdb0d0652425"

  depends_on "python@3.8"
  depends_on "tag"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/python3", "setup.py", "install"
    system libexec/"bin/pip", "uninstall", "-y", "fwitness"
    venv.pip_install_and_link buildpath
  end

  test do
    system "python", "-c", "'import finder_witness'"
  end
end
