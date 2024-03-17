class Jour < Formula
  include Language::Python::Virtualenv

  desc "Utility for a high-level machine maintenance journal"
  homepage "https://github.com/bglezseoane/jour"
  url "https://files.pythonhosted.org/packages/73/d1/be4013de03479d4d574fa83f650f9d62f8bd4a04b531a8df6fc742f91b7c/jour-2.0.0.tar.gz"
  sha256 "9b4d44228bee6b9502be7a2af062ed628e06be54e67a76e3f6f21185725bf163"

  depends_on "python@3.11"

  # Resources obtained with `homebrew-pypi-poet`

  resource "ilock" do
    url "https://files.pythonhosted.org/packages/cd/4d/55dea0808bc53f773baa75dbf501fc4e528cdb4aa4abc3ad4a226674bdb5/ilock-1.0.3.tar.gz"
    sha256 "88010638f4d7c53aa67436ea96dbdc5ff8a96591532a89ffa131b22c3a3ec39c"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0/markdown-it-py-3.0.0.tar.gz"
    sha256 "e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb"
  end

  resource "mdformat" do
    url "https://files.pythonhosted.org/packages/df/86/6374cc48a89862cfc8e350a65d6af47792e83e7684f13e1222afce110a41/mdformat-0.7.17.tar.gz"
    sha256 "a9dbb1838d43bb1e6f03bd5dca9412c552544a9bc42d6abb5dc32adfe8ae7c0d"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "portalocker" do
    url "https://files.pythonhosted.org/packages/35/00/0f230921ba852226275762ea3974b87eeca36e941a13cd691ed296d279e5/portalocker-2.8.2.tar.gz"
    sha256 "2b035aa7828e46c58e9b31390ee1f169b98e1066ab10b9a6a861fe7e25ee4f33"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/jour", "--help"
  end
end
