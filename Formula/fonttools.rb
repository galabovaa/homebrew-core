class Fonttools < Formula
  include Language::Python::Virtualenv

  desc "Library for manipulating fonts"
  homepage "https://github.com/fonttools/fonttools"
  url "https://files.pythonhosted.org/packages/8b/ca/f4003975840fdd68aafbb45bf04f95f6efdb15002bd330db5e45609d11ff/fonttools-4.22.1.zip"
  sha256 "fea6bb9d1d23a94d5e8fa6238214538a89d4333e340025a95a16b77ddb191e6f"
  license "MIT"
  head "https://github.com/fonttools/fonttools.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "63333b08cf635dad18e495ef7f9b50df5b6e07facc1db33c35240891c41d7959"
    sha256 cellar: :any_skip_relocation, big_sur:       "8d86e60bf07dde1931396a513b3b563bafd8b8212898a4b9757ccb0b960486b4"
    sha256 cellar: :any_skip_relocation, catalina:      "f2a67f1aae824f367d9f6305f0562b337126f21dcbaf47375e5c19e989f1db58"
    sha256 cellar: :any_skip_relocation, mojave:        "49bd7efa6b8345293f7e1ce37361c48a0c3b449934c499323e8593b4cfebadb0"
  end

  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
  end

  test do
    on_macos do
      cp "/System/Library/Fonts/ZapfDingbats.ttf", testpath
      system bin/"ttx", "ZapfDingbats.ttf"
    end
    on_linux do
      assert_match "usage", shell_output("#{bin}/ttx -h")
    end
  end
end
