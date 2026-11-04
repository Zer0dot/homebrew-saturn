class Saturn < Formula
  desc "Run the Saturn agent visualizer as a local libkrun microVM"
  homepage "https://github.com/Zer0dot/saturn-selfhost"
  url "https://github.com/Zer0dot/saturn-selfhost/releases/download/selfhost-v0.2.46/saturn-aarch64-apple.tar.gz"
  version "0.2.46"
  sha256 "51600fd78567dd6b90a8f5379e184223c1f84cbb8fd8fdbc003381d0271c90cd"
  license "GPL-2.0-only"

  depends_on :macos
  depends_on arch: :arm64

  def install
    # The tarball root (after Homebrew strips the top dir) is bin/ lib/ libexec/
    # sbin/ share/, so the binary lands at libexec/bin/saturn.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/saturn"
  end

  test do
    system bin/"saturn", "--version"
  end
end
