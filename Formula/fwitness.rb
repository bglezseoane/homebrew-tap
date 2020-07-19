class Fwitness < Formula
  include Language::Python::Virtualenv

  desc "Consolidate Mac OS Finder metadata between several machines"
  homepage "https://github.com/bglezseoane/fwitness"
  url "https://files.pythonhosted.org/packages/b8/88/3529acd7103b13a33794c992c8830e3134db1ecd01612eaec38ae28dfc6e/fwitness-0.4.dev3.tar.gz"
  sha256 "68b481bb7ea9ff4ba33f580e9dbe897d781b2ac9840b4639e39e29cc46711017"
  version "0.4.dev3"

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
