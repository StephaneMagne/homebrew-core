require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.0.14.tgz"
  sha256 "fd1c298a6099339002c29171171aac70e55312074d4fda2d7385dc2b177c865e"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "d99a767c011d3f75e77038eca298796e960a01e524dd61ed6c484f3a7326280b"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
