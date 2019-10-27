class Folstamp < Formula
  include Language::Python::Virtualenv

  desc "Generate custom macOS folder icons"
  homepage "https://github.com/glezseoane/folder-stamp"
  url "https://github.com/glezseoane/folder-stamp/archive/v1.1.tar.gz"
  sha256 "82cc1a3a45d37cbb40beac6a64e4830de46a447e74f2452172783aee0ba160d0"
  
  depends_on "jpeg" => :build
  depends_on "librsvg"
  depends_on "python"

  resource "Pillow" do
    url "https://github.com/python-pillow/Pillow/archive/6.2.0.tar.gz"
    sha256 "5d8c0d6fc1e4b662f0e7c40ed83e06367a90e8b11b227d5141b51badae56248e"
  end
  resource "filetype" do
    url "https://files.pythonhosted.org/packages/e8/53/298887541ae479f8467d4d23e028c6d15f9811da25c582297fd3869666b7/filetype-1.0.5.tar.gz"
    sha256 "17a3b885f19034da29640b083d767e0f13c2dcb5dcc267945c8b6e5a5a9013c7"
  end
    resource "monoshape" do
    url "https://files.pythonhosted.org/packages/ac/5e/b0c25f186bde2d579ef1bb323fbd80b950c30d156f39f90b53b967dcecbb/monoshape-1.1.tar.gz"
    sha256 "fb48231c1ce1014f7aeda3959afbcd72f0f48e016217cab628bff148061378c0"
  end

  def install
    venv = virtualenv_create(libexec, "python3")

    resource("Pillow").stage do
      inreplace "setup.py" do |s|
        sdkprefix = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
        s.gsub! "openjpeg.h", "probably_not_a_header_called_this_eh.h"
        s.gsub! "ZLIB_ROOT = None", "ZLIB_ROOT = ('#{sdkprefix}/usr/lib', '#{sdkprefix}/usr/include')"
        s.gsub! "JPEG_ROOT = None", "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', '#{Formula["jpeg"].opt_prefix}/include')"
        s.gsub! "FREETYPE_ROOT = None", "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', '#{Formula["freetype"].opt_prefix}/include')"
      end

      ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers" unless MacOS::CLT.installed?
      venv.pip_install Pathname.pwd
    end

    res = resources.map(&:name).to_set - ["Pillow"]
    res.each do |r|
      venv.pip_install resource(r)
    end

    venv.pip_install_and_link buildpath
    man1.install "manpages/folstamp.1"
  end

  test do
    system "python", "-c", "'import monoshape.__main__'"
  end
end
