class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/5b/52/12218cfe7c5348b5b7b9db81640a0c5b4ae5188f1fe1f10bb79482c80785/fwitness-0.5.dev1.tar.gz"
  sha256 "b95ecee380deab76f66867d5f10167083cd8ccd87d487a25e5edbd1fc1b7ee37"
  version "0.5.dev1"

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
