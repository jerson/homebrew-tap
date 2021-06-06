# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pgrok < Formula
  desc "Introspected tunnels to localhost a fork from pgrok."
  homepage "https://github.com/jerson/pgrok"
  version "3.2.3"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/jerson/pgrok/releases/download/v3.2.3/pgrok_3.2.3_MacOS_x86_64.tar.gz"
      sha256 "429ca2f4dc3d985501f73f16c889f9294733336c59520d518d38bbe495ed4af1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/jerson/pgrok/releases/download/v3.2.3/pgrok_3.2.3_MacOS_arm64.tar.gz"
      sha256 "1aef9b0d1328fd410a987535258b2a9bb83506bb991ed408725d6519acbe89eb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jerson/pgrok/releases/download/v3.2.3/pgrok_3.2.3_Linux_x86_64.tar.gz"
      sha256 "d8adbad9f8d160dace11d5a1e49ebad884f476e74165c9d068528da32c19cd86"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/jerson/pgrok/releases/download/v3.2.3/pgrok_3.2.3_Linux_arm64.tar.gz"
      sha256 "472cf5a1229fa86e12f85a2df849d08c7617ac59f2c2ea84bbe803f88847b1fd"
    end
  end

  def install
    bin.install "pgrok"
  end

  test do
    system "#{bin}/pgrok", "-v"
  end
end
