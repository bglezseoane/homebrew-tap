class Monoshape < Formula
  include Language::Python::Virtualenv

  desc "Extracts monochromatic shapes"
  homepage "https://github.com/glezseoane/monoshape"
  url "https://github.com/glezseoane/monoshape/archive/v1.2.tar.gz"
  sha256 "0780833c7cae70577906babed094bc0cd1a829f3806c3122b22c5188e0c60e21"
  
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
    man1.install "manpages/monoshape.1"
  end

  test do
    system "python", "-c", "'import monoshape.__main__'"
  end
end

