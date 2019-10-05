class ScreenshotTools < Formula
  desc "Screenshot tools for take and merge"
  homepage "https://github.com/jerson/screenshot-tools"
  url "https://github.com/jerson/screenshot-tools/archive/v0.2.0.tar.gz"
  sha256 "7143721a7195104740d92a461bb5596df9c18b99b0f4522f9a274cd0139210d1"
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
