class YtDlp < Formula
  include Language::Python::Virtualenv

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://files.pythonhosted.org/packages/97/0b/1008dffd196cf6a1f143005b566397f71fb1e767c8e788ea230ae35457b7/yt-dlp-2021.10.22.tar.gz"
  sha256 "a24b9666bd2234149e4da8c4f16bb8e5f746c29428d12ee04fc1c11b5247a307"
  license "Unlicense"

  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
    bash_completion.install "completions/bash/yt-dlp"
    fish_completion.install "completions/fish/yt-dlp.fish"
    zsh_completion.install "completions/zsh/_yt-dlp"
  end

  test do
    # commit history of homebrew-core repo
    system "#{bin}/yt-dlp", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    # homebrew playlist
    system "#{bin}/yt-dlp", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
