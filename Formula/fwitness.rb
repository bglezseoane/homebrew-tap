class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/1c/84/95ba01a1bcdb8b7eebbafdd206fc6394f9fb73bc83faf1e484aa6e0f5b57/fwitness-0.2.dev2.tar.gz"
  sha256 "51aca1a2ce8f323194a2b08e2e7d18685088543cf5ceb53123a4bf9bb6b3f5c1"
  version "0.2.dev2"

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
