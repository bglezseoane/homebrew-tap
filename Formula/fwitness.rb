class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/db/37/5509e16a97857fa0f0a545afc26083a321e22e44a31fd5f47b478d8d5d29/fwitness-0.4.dev4.tar.gz"
  sha256 "6cf809dfea9767a1089fcd840953dc6effbfa5e648193a519c62f070c10ba311"
  version "0.4.dev4"

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
