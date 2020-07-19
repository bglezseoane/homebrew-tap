class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/f8/77/58c8391ee35f9c37eea5d22233b1cfcfaee981d9f14ccadba464d2f25365/fwitness-0.4.dev1.tar.gz"
  sha256 "0754bc6e75c54c81f60f47f319aaac11c54ab424f025930a6f529b938e1b6c92"
  version "0.4.dev1"

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
