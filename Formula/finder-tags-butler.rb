class FinderTagsButler < Formula
  include Language::Python::Virtualenv

  desc "Synchronize Mac OS Finder tags between several machines"
  homepage "https://github.com/bglezseoane/finder-tags-butler"
  url "https://files.pythonhosted.org/packages/65/35/261dd1ba8634e3373599e9ee9edcf6e8521c16067344eaafe3e0e54d2135/finder-tags-butler-0.1.dev2.tar.gz"
  version "0.1.dev2"
  sha256 "93b2d396d9c13a67e8d7e9a492bb9f4e2d11e443ed061da83bb25aa05e1474b2"

  depends_on "python@3.8"
  depends_on "tag"

  def install
    venv = virtualenv_create(libexec, "python3")
    # TODO: Pending to replace the next two lines with:
    #   system libexec/"bin/pip", "install", "-r", "requirements.txt"
    #   system libexec/"bin/pip", "uninstall", "-y", "finder-tags-butler"
    # ... when the dependencies are well defined in 'requirements.txt'.
    system libexec/"bin/pip", "install", "mac-tag"
    system libexec/"bin/pip", "install", "pyyaml==5.3.1"
    #######################################################
    venv.pip_install_and_link buildpath
  end

  test do
    system "python", "-c", "'import finder-tags-butler'"
  end
end
