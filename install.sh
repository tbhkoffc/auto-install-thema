#!/bin/bash

BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

display_welcome() {
  echo -e ""
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]                                                 [+]${NC}"
  echo -e "${YELLOW}[+]      AUTO INSTALLER THEMA PTERODACTYL           [+]${NC}"
  echo -e "${YELLOW}[+]                © TBHKOFFC                       [+]${NC}"
  echo -e "${YELLOW}[+]                                                 [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "This Installation Is Free To Use By Everyone"
  echo -e "It is strictly forbidden to sell tokens, installation scripts, or theme files contained in this script. If anyone is selling, please report to the telegram below"
  echo -e ""
  echo -e "𝗧𝗘𝗟𝗘𝗚𝗥𝗔𝗠 :"
  echo -e "@jayaeditz_26"
  echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :"
  echo -e "@foxstore"
  sleep 4
  clear
}

install_jq() {
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]                UPDATE & INSTALL JQ              [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]              JQ SUCCESSFULLY INSTALLED          [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] ================================================ [+]${NC}"
    echo -e "${RED}[+]                JQ INSTALLATION FAILED            [+]${NC}"
    echo -e "${RED}[+] ================================================ [+]${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}
check_token() {
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]               LICENSE ISSUED BY TBHK            [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${RED}Please Enter Access Token :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "tbhkoffc" ]; then
    echo -e "${GREEN}ACCESS GRANTED${NC}}"
  else
    echo -e "${RED}WRONG TOKEN. PLEASE RE-ENTER THE TOKEN${NC}"
    echo -e "${YELLOW}TOKEN: tbhkoffc${NC}"
    exit 1
  fi
  clear
}

install_theme() {
  while true; do
    echo -e "                                                       "
    echo -e "${YELLOW}[+] =============================================== [+]${NC}"
    echo -e "${YELLOW}[+]          PLEASE SELECT INSTALLATION METHOD      [+]${NC}"
    echo -e "${YELLOW}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    echo -e "Choose Theme You Want To Install"
    echo "1. stellar"
    echo "2. billing"
    echo "3. enigma"
    echo "x. kembali"
    echo -e "Input Options (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL=$(echo -e "https://github.com/tbhkoffc/auto-install-thema/raw/main/stellar.zip")        
        break
        ;;
      2)
        THEME_URL=$(echo -e "https://github.com/tbhkoffc/auto-install-thema/raw/main/billing.zip")
        break
        ;;
      3)
        THEME_URL=$(echo -e "https://github.com/tbhkoffc/auto-install-thema/raw/main/enigma.zip")
        break
        ;; 
      x)
        return
        ;;
      *)
        echo -e "${RED}INVALID SELECTION. PLEASE RE-SETTLE THE SELECTION${NC}"
        ;;
    esac
  done
  
if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
  
if [ "$SELECT_THEME" -eq 1 ]; then
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]      STARTING THE STELLAR THEME INSTALLATION    [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install 16
  nvm alias default 16
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/stellar.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]             INSTALLATION SUCCESSFUL             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 2
  clear
  exit 0

elif [ "$SELECT_THEME" -eq 2 ]; then
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]      STARTING THE BILLING THEME INSTALLATION    [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install 16
  nvm alias default 16
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan billing:install stable
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/billing.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]             INSTALLATION SUCCESSFUL             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  return

elif [ "$SELECT_THEME" -eq 3 ]; then
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]      STARTING THE ENIGMA THEME INSTALLATION     [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                                   "

    echo -e "${YELLOW}Enter the WA link (https://wa.me...) : ${NC}"
    read LINK_WA
    echo -e "${YELLOW}Enter group link (https://chat.whatsapp.com/.....) : ${NC}"
    read LINK_GROUP
    echo -e "${YELLOW}Enter channel link (https://...) : ${NC}"
    read LINK_CHNL

    sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    

  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install 16
  nvm alias default 16
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/enigma.zip
  sudo rm -rf /root/pterodactyl

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]              INSTALLATION SUCCESSFUL            [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e ""
  sleep 5
else
  echo ""
  echo "Invalid selection. Please select 1/2/3."
fi
}

uninstall_theme() {
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]                  UNISTALL THEME                 [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/tbhkoffc/auto-install-thema/main/repair.sh)
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]             UNISTALL THEME SUCCESSFUL           [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}
install_themeSteeler() {
echo -e "                                                       "
echo -e "${YELLOW}[+] =============================================== [+]${NC}"
echo -e "${YELLOW}[+]      STARTING THE STELLAR THEME INSTALLATION    [+]${NC}"
echo -e "${YELLOW}[+] =============================================== [+]${NC}"
echo -e "                                                                   "

wget -O /root/stellar.zip https://github.com/tbhkoffc/auto-install-thema/raw/main/stellar.zip
unzip /root/stellar.zip -d /root/pterodactyl
sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 16
nvm alias default 16
sudo apt install -y nodejs
sudo npm i -g yarn
cd /var/www/pterodactyl
yarn add react-feather
php artisan migrate
yarn build:production
php artisan view:clear
sudo rm /root/stellar.zip
sudo rm -rf /root/pterodactyl

echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]              INSTALLATION SUCCESSFUL            [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "                                                       "
sleep 2
clear
exit 0

}
create_node() {
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]                    CREATE NODE                  [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/tbhkoffc/auto-install-thema/main/createnode.sh)
  echo -e "                                                       "                                     "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]        ALL NODE INSTALLATIONS SUCCESSFUL        [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
uninstall_panel() {
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]           STARTING UNISTALL PTERODACTYL         [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                       "


bash <(curl -s https://pterodactyl-installer.se) <<EOF
y
y
y
y
EOF


  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]          UNINSTALL PTERODACTYL SUCCESSFUL       [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
configure_wings() {
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]                 CONFIGURE WINGS                 [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                       "

read -p "Enter token Configure running wings: " wings

eval "$wings"

sudo systemctl start wings

  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]              CONFIGURE WINGS SUKSES             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
  exit 0
}
hackback_panel() {
  echo -e "                                                       "
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "${YELLOW}[+]                 HACK BACK PANEL                 [+]${NC}"
  echo -e "${YELLOW}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
read -p "Enter Panel Username: " user
read -p "Login Password: " psswdhb
cd /var/www/pterodactyl || { echo "Directory not found"; exit 1; }
php artisan p:user:make <<EOF
yes
panelsupport@pterodactyl.io
$user
$user
$user
$psswdhb
EOF
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]              ACCOUNT HAS BEEN ADDED             [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
ubahpw_vps() {
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                CHANGE VPS PASSWORD              [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
read -p "Enter New Password: " pw
read -p "Re-enter New Password: " pw

passwd <<EOF
$pw
$pw

EOF


  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]          CHANGE VPS PASSWORD SUCCESSFUL         [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  
  exit 0
}
display_welcome
install_jq
check_token

while true; do
  clear
  echo -e "                                                                     "
  echo -e "${RED}        _,gggggggggg.                                     ${NC}"
  echo -e "${RED}    ,ggggggggggggggggg.                                   ${NC}"
  echo -e "${RED}  ,ggggg        gggggggg.                                 ${NC}"
  echo -e "${RED} ,ggg'               'ggg.                                ${NC}"
  echo -e "${RED}',gg       ,ggg.      'ggg:                               ${NC}"
  echo -e "${RED}'ggg      ,gg'''  .    ggg       Auto Installer Tbhk      ${NC}"
  echo -e "${RED}gggg      gg     ,     ggg      ------------------------  ${NC}"
  echo -e "${RED}ggg:     gg.     -   ,ggg       • Telegram : jayaeditz_26 ${NC}"
  echo -e "${RED} ggg:     ggg._    _,ggg        • Credit  : TbhkOffc      ${NC}"
  echo -e "${RED} ggg.    '.'''ggggggp           • Support by Tbhk         ${NC}"
  echo -e "${RED}  'ggg    '-.__                                           ${NC}"
  echo -e "${RED}    ggg                                                   ${NC}"
  echo -e "${RED}      ggg                                                 ${NC}"
  echo -e "${RED}        ggg.                                              ${NC}"
  echo -e "${RED}          ggg.                                            ${NC}"
  echo -e "${RED}             b.                                           ${NC}"
  echo -e "                                                                     "
  echo -e "HERE IS THE INSTALL LIST :"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "3. Configure Wings"
  echo "4. Create Node"
  echo "5. Uninstall Panel"
  echo "6. Stellar Theme"
  echo "7. Hack Back Panel"
  echo "8. Change Vps Password"
  echo "x. Exit"
  echo -e "Enter your choice 1/2/x:"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
      3)
      configure_wings
      ;;
      4)
      create_node
      ;;
      5)
      uninstall_panel
      ;;
      6)
      install_themeSteeler
      ;;
      7)
      hackback_panel
      ;;
      8)
      ubahpw_vps
      ;;
    x)
      echo "Thank you for using this script!"
      exit 0
      ;;
    *)
      echo "Invalid selection, please try again."
      ;;
  esac
done
