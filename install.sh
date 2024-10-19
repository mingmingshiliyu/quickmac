function installSDKMAN(){
  # sdkman 
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sdk list java
echo "请输入Identifier下的版本"
read param
sdk install java $param
sdk default java $param
#只在当前窗口生效
#sdk use java <version>
sdk current java
cd ~/.sdkman
ls .
echo "it is where java installed,sdk list java and then sdk use java <version> to use java specified version temporary in current terminal"
}
function installhomebrew(){
#homebrew
/bin/zsh -c”$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)”
}

function installgit(){
# git
brew install git
}

function installpyenv(){
#pyenv
brew install pyenv
}

function installNode(){
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

echo "if below Catalina,try run : export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
os_version=$(sw_vers -productVersion)
if [[ $os_version < "10.15" ]]; then
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  source ~/.bash_profile
elif [[ $os_version >= "10.15" ]]; then
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  source ~/.zshrc
fi
nvm ls-remote
echo "请输入node的版本"
read version
nvm install $version
nvm use $version
node -v

}

installSDKMAN
installhomebrew
installgit
installpyenv
installNode
