sudo apt install exa bat fd-find ripgrep pandoc poppler-utils ffmpeg fzf inxi neovim curl ripgrep

# get ripgrep-all
URL="https://api.github.com/repos/phiresky/ripgrep-all/releases/latest"
curl -s $URL | awk -F\" '/browser_download_url.*-x86_64-unknown-linux-musl.tar.gz/{system("curl -OL " $(NF-1))}'
tar -xf ripgrep_all-v*-x86_64-unknown-linux-musl.tar.gz
sudo mv ripgrep_all-v*-x86_64-unknown-linux-musl/rga /bin/
rm ripgrep_all-v*-x86_64-unknown-linux-musl*
