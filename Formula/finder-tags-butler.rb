class FinderTagsButler < Formula
  include Language::Python::Virtualenv

  desc "Synchronize Mac OS Finder tags between several machines"
  homepage "https://github.com/bglezseoane/finder-tags-butler"
  url "https://files.pythonhosted.org/packages/04/1a/919c13b4843938e5c87bfbcc81c32ae685b4a37a98126bf979a9fd57e926/finder-tags-butler-0.1.dev1.tar.gz"
  version "0.1.dev1"
  sha256 "9dcb6215a127583e36c48455c5bab1ff2f90b4ff2b50fd75000d17f631c3c984"

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
