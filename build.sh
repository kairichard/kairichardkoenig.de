yum install -y wget
wget https://github.com/gohugoio/hugo/releases/download/v0.58.3/hugo_extended_0.58.3_Linux-64bit.tar.gz
tar -xzf hugo_0.58.3_Linux-64bit.tar.gz

git clone https://github.com/jugglerx/hugo-whisper-theme.git themes/hugo-whisper-theme

./hugo