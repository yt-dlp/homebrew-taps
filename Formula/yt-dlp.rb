class YtDlp < Formula
  include Language::Python::Virtualenv

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://files.pythonhosted.org/packages/06/60/c4146cecfe7f480fc3cb1a8608ba123b7c1e0b74813db77b8f04fd7a7280/yt-dlp-2022.5.18.tar.gz"
  sha256 "3a7b59d2fb4b39ce8ba8e0b9c5a37fe20e5624f46a2346b4ae66ab1320e35134"
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
