# This file was generated by GoReleaser. DO NOT EDIT.
class Pgrokd < Formula
  desc "Server introspected tunnels to localhost a fork from pgrok."
  homepage "https://github.com/jerson/pgrok"
  version "3.0.10"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/jerson/pgrok/releases/download/v3.0.10/pgrokd_3.0.10_Darwin_x86_64.tar.gz"
    sha256 "662d0babffa4bab2c72aa73c70fa1460d5397d16652abe65d4cf15958dbfffc0"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/jerson/pgrok/releases/download/v3.0.10/pgrokd_3.0.10_Linux_x86_64.tar.gz"
      sha256 "2b7e991688bbe767fc0429dba6c269533e6d05b3a30d9ac90ef04cc1adbb6319"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jerson/pgrok/releases/download/v3.0.10/pgrokd_3.0.10_Linux_arm64.tar.gz"
        sha256 "72d66dad711935425d9b58d934d01b28469e3ea6f0713f4517eb70f6ec71aafb"
      else
        url "https://github.com/jerson/pgrok/releases/download/v3.0.10/pgrokd_3.0.10_Linux_armv6.tar.gz"
        sha256 "b06f8877677f04a6a2b96681b8a89163012f4e6625b1d7780e29fc4a48b9fe6c"
      end
    end
  end

  def install
    bin.install "pgrokd"
  end

  test do
    system "#{bin}/pgrokd -v"
  end
end
