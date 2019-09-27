class ScreenshotTools < Formula
  desc "Screenshot tools for take and merge"
  homepage "https://github.com/jerson/screenshot-tools"
  url "https://github.com/jerson/screenshot-tools/archive/v0.1.5.tar.gz"
  sha256 "d51098bbbd43e0c74d196fc7f7a44762c4f5b2d53fbc41788e35db53887c86be"
  head "https://github.com/jerson/screenshot-tools.git"

  depends_on "go" => :build

  def install
    ENV["GO111MODULE"] = "on"
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go get -u github.com/gobuffalo/packr/v2/packr2"
    system "packr2", "build", "-o", bin/"screenshot-tools"
    #bin.install bin/"screenshot-tools"

  end

  test do
    ENV["GOPATH"] = testpath
    dir = testpath/"jerson/screenshot-tools"
    mkdir dir
    system "git", "clone", "https://github.com/jerson/screenshot-tools.git", dir
    system "go", "test", "./..."
  end
end
