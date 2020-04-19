yum install -y wget
wget https://github.com/gohugoio/hugo/releases/download/v0.58.3/hugo_extended_0.58.3_Linux-64bit.tar.gz
tar -xzf hugo_extended_0.58.3_Linux-64bit.tar.gz

./hugo --gc --minify --i18n-warnings --log
