class Gitcher < Formula
  include Language::Python::Virtualenv

  desc "The git profile switcher"
  homepage "https://github.com/glezseoane/gitcher"
  url "https://github.com/glezseoane/gitcher/archive/v3.0.tar.gz"
  sha256 "4513a2c875801b4251f9b698d1cf58a10eadd7d42c72b04b1a5440ed8293a1d6"
  
  depends_on "python"

  resource "prettytable" do
    url "https://files.pythonhosted.org/packages/e0/a1/36203205f77ccf98f3c6cf17cf068c972e6458d7e58509ca66da949ca347/prettytable-0.7.2.tar.gz#sha256=2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9"
    sha256 "2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9"
  end
  resource "validate_email" do
    url "https://files.pythonhosted.org/packages/84/a0/cb53fb64b52123513d04f9b913b905f3eb6fda7264e639b4573cc715c29f/validate_email-1.3.tar.gz#sha256=784719dc5f780be319cdd185dc85dd93afebdb6ebb943811bc4c7c5f9c72aeaf"
    sha256 "784719dc5f780be319cdd185dc85dd93afebdb6ebb943811bc4c7c5f9c72aeaf"
  end

  def install
    virtualenv_install_with_resources
    man1.install "manpages/gitcher.1"
  end

  test do
    system "python", "-c", "'import gitcher'"
  end
end
