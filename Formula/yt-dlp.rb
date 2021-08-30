class YtDlp < Formula
  include Language::Python::Virtualenv

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://files.pythonhosted.org/packages/ee/59/d763a51fa975639946c327ffbf85e109dbaa87f8aa5cae54a4ee5d09593c/yt-dlp-2021.8.10.tar.gz"
  sha256 "8da1bf4dc4641d37d137443c4783109ee8393caad5e0d270d9d1d534e8f25240"
  license "Unlicense"

  bottle :unneeded

  depends_on "python@3.9"

  def install
    virtualenv_install_with_resources
    bash_completion.install libexec/"completions/bash/yt-dlp"
    fish_completion.install libexec/"completions/fish/yt-dlp.fish"
    zsh_completion.install libexec/"completions/zsh/_yt-dlp"
  end

  test do
    # commit history of homebrew-core repo
    system "#{bin}/yt-dlp", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    # homebrew playlist
    system "#{bin}/yt-dlp", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
