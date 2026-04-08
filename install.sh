#!/bin/bash
# ================================================
# 全网最强代理中转管理脚本 - 铭泽跨境版
# Copyright © 2025 铭泽跨境. All rights reserved.
# 技术支持: 微信 a114447773
# ================================================

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# 显示横幅
show_banner() {
    echo -e "${BLUE}=========================================${NC}"
    echo -e "${GREEN}    铭泽跨境代理管理脚本 v5.0        ${NC}"
    echo -e "${BLUE}=========================================${NC}"
}

# 安装基础依赖
install_dependencies() {
    echo -e "${YELLOW}正在安装基础依赖...${NC}"
    if command -v apt &> /dev/null; then
        apt update
        apt install -y wget curl jq tar gzip net-tools
    elif command -v yum &> /dev/null; then
        yum install -y wget curl jq tar gzip net-tools
    fi
    echo -e "${GREEN}基础依赖安装完成！${NC}"
}

# 安装 BBR
install_bbr() {
    echo -e "${YELLOW}正在安装 BBR 加速...${NC}"
    wget -O tcp.sh https://github.com/cx9208/Linux-NetSpeed/raw/master/tcp.sh
    chmod +x tcp.sh
    ./tcp.sh
}

# 安装 X-UI
install_xui() {
    echo -e "${YELLOW}正在安装 X-UI 面板...${NC}"
    bash <(curl -Ls https://raw.githubusercontent.com/yonggekkk/x-ui-yg/main/install.sh)
}

# 主菜单
main_menu() {
    clear
    show_banner
    echo "请选择功能："
    echo "1. 一键安装所有组件"
    echo "2. 安装 BBR 加速"
    echo "3. 安装 X-UI 面板"
    echo "4. 安装 GOST 工具"
    echo "5. 退出"
    echo ""
    read -p "请输入数字 [1-5]: " choice
    
    case $choice in
        1) 
            install_dependencies
            install_bbr
            install_xui
            echo -e "${GREEN}所有组件安装完成！${NC}"
            ;;
        2) install_bbr ;;
        3) install_xui ;;
        4) echo "GOST 安装功能待实现" ;;
        5) exit 0 ;;
        *) echo -e "${RED}无效选择！${NC}" ;;
    esac
    
    echo ""
    read -p "按回车键返回菜单..."
    main_menu
}

# 主程序入口
main() {
    main_menu
}

main "$@"
