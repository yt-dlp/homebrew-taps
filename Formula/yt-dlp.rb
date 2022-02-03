class YtDlp < Formula
  include Language::Python::Virtualenv

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://files.pythonhosted.org/packages/d8/6f/e7f7918b29bb3a4da8d1f548a8a3c5e8446acb02fb4bcb1254a225a9c407/yt-dlp-2022.2.3.tar.gz"
  sha256 "955dd1814abd178baff2383d1542efee48adfc9de9e2f5c86784b09cd6f5a262"
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
