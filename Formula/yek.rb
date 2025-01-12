class Yek < Formula
    desc "A tool to chunk and serialize repository content for LLM consumption"
    homepage "https://github.com/mohsen1/yek"
    version = :latest
    url "https://api.github.com/repos/mohsen1/yek/releases/latest"
    strategy :github_latest
    head "https://github.com/mohsen1/yek.git", branch: "main"
  
    on_macos do
      if Hardware::CPU.arm?
        url do
          {
            url: "https://github.com/mohsen1/yek/releases/latest/download/yek-aarch64-apple-darwin.tar.gz",
            strategy: :github_latest
          }
        end
      else
        url do
          {
            url: "https://github.com/mohsen1/yek/releases/latest/download/yek-x86_64-apple-darwin.tar.gz",
            strategy: :github_latest
          }
        end
      end
    end
  
    on_linux do
      url do
        {
          url: "https://github.com/mohsen1/yek/releases/latest/download/yek-x86_64-unknown-linux-gnu.tar.gz",
          strategy: :github_latest
        }
      end
    end
  
    def install
      if OS.mac?
        if Hardware::CPU.arm?
          bin.install "yek-aarch64-apple-darwin/yek"
        else
          bin.install "yek-x86_64-apple-darwin/yek"
        end
      else
        bin.install "yek-x86_64-unknown-linux-gnu/yek"
      end
    end
  
    test do
      system "#{bin}/yek", "--version"
    end
  end 