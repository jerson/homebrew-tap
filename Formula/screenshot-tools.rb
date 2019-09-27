class ScreenshotTools < Formula
  desc "Screenshot tools for take and merge"
  homepage "https://github.com/jerson/screenshot-tools"
  url "https://github.com/jerson/screenshot-tools/archive/v0.1.12.tar.gz"
  sha256 "5af13d019c10f32a62fde33a0f368e48e3d096ddff672ff624249abe3db0967c"
  head "https://github.com/jerson/screenshot-tools.git"

  depends_on "go" => :build
 #depends_on "upx" => :build
 #depends_on "zip" => :build
 #depends_on "make" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    ENV["GO111MODULE"] = "off"
    ENV["GOPATH"] =  ENV["GOPATH"] || "#{ENV["HOME"]}/go"
    system "go", "get", "-u", "github.com/gobuffalo/packr/v2/packr2"
    ENV["GO111MODULE"] = "on"
    ENV["PATH"] = PATH.new( "#{ENV["GOPATH"]}/bin" , ENV["PATH"])
    system "go generate"
    system "packr2"
    system "go", "build", "-o", "screenshot-tools"
    #system "make", "build"
    bin.install "screenshot-tools" 

  end


  test do
    system "#{bin}/screenshot-tools", "--version"
  end

end
