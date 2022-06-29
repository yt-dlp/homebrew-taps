class YtDlp < Formula
  include Language::Python::Virtualenv

  desc "A youtube-dl fork with additional features and fixes"
  homepage "https://github.com/yt-dlp/yt-dlp"
  url "https://files.pythonhosted.org/packages/82/7f/e70942522978a962c8c16f0b13053b2fdf4ff63863103c36f9bbd29a30df/yt-dlp-2022.6.29.tar.gz"
  sha256 "5fbfac72fd035d11bc2693e5d1cd6933b1bc0712f742f5082a261703810bb5c9"
  license "Unlicense"

  depends_on "python@3.9"

  resource "Brotli" do
    url "https://files.pythonhosted.org/packages/82/7f/e70942522978a962c8c16f0b13053b2fdf4ff63863103c36f9bbd29a30df/yt-dlp-2022.6.29.tar.gz"
    sha256 "5fbfac72fd035d11bc2693e5d1cd6933b1bc0712f742f5082a261703810bb5c9"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/82/7f/e70942522978a962c8c16f0b13053b2fdf4ff63863103c36f9bbd29a30df/yt-dlp-2022.6.29.tar.gz"
    sha256 "5fbfac72fd035d11bc2693e5d1cd6933b1bc0712f742f5082a261703810bb5c9"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/82/7f/e70942522978a962c8c16f0b13053b2fdf4ff63863103c36f9bbd29a30df/yt-dlp-2022.6.29.tar.gz"
    sha256 "5fbfac72fd035d11bc2693e5d1cd6933b1bc0712f742f5082a261703810bb5c9"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/82/7f/e70942522978a962c8c16f0b13053b2fdf4ff63863103c36f9bbd29a30df/yt-dlp-2022.6.29.tar.gz"
    sha256 "5fbfac72fd035d11bc2693e5d1cd6933b1bc0712f742f5082a261703810bb5c9"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/82/7f/e70942522978a962c8c16f0b13053b2fdf4ff63863103c36f9bbd29a30df/yt-dlp-2022.6.29.tar.gz"
    sha256 "5fbfac72fd035d11bc2693e5d1cd6933b1bc0712f742f5082a261703810bb5c9"
  end

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
