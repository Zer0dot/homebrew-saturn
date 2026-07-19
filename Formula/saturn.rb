class Saturn < Formula
  desc "Run the Saturn agent visualizer as a local libkrun microVM"
  homepage "https://github.com/Zer0dot/saturn-selfhost"
  url "https://github.com/Zer0dot/saturn-selfhost/releases/download/selfhost-v0.2.1/saturn-aarch64-apple.tar.gz"
  version "0.2.1"
  sha256 "5332958df2f02759936139e9f1e9a9298d6a08e569208329570d079ee53dd2f2"
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
