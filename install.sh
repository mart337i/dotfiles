git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

git clone https://github.com/iridakos/goto.git
cd goto
sudo ./install
cd ..
rm -rf goto/

curl -LO https://github.com/ClementTsang/bottom/releases/download/0.10.2/bottom_0.10.2-1_amd64.deb
sudo dpkg -i bottom_0.10.2-1_amd64.deb
rm bottom_0.10.2-1_amd64.deb

cat vscode-extensions.txt | xargs -n 1 code --install-extension