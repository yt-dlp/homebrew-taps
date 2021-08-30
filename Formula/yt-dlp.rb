class YtDlp < Formula
  include Language::Python::Virtualenv

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://files.pythonhosted.org/packages/ee/72/836432d93dfb518dfe9e930d5e0da354f27ceaa3280157e89d0cadec7c52/yt_dlp-2021.8.10-py2.py3-none-any.whl"
  sha256 "7c12ead6df0744c87b7d78e1cf4678f9e1c6e6cd1517af9b9cec3af4f2aca69a"
  license "Unlicense"

  bottle :unneeded

  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
    man1.install_symlink libexec/"share/man/man1/yt-dlp.1" => "yt-dlp.1"
    bash_completion.install libexec/"etc/bash_completion.d/yt-dlp.bash-completion"
    fish_completion.install libexec/"etc/fish/completions/yt-dlp.fish"
  end

  test do
    # commit history of homebrew-core repo
    system "#{bin}/yt-dlp", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    # homebrew playlist
    system "#{bin}/yt-dlp", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
