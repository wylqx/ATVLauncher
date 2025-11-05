#!/system/bin/sh

##############################################################################
# 核心配置区：补充所有节点（IP尾数10-40对应所有节点，默认节点为香港-01）
# 格式："IP尾数|节点名称|完整YAML配置行"（IP为空项为默认节点）
##############################################################################
NODE_IP_MAP=(
"09|香港 01| - { name: '香港 01 | IEPL 1.7X | CM', type: trojan, server: mix.cyberguard.games, port: 9900, password: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, sni: cghk.hysality.com }"
"10|台湾 01| - { name: '台湾 01 | IEPL 1.7X | CM', type: vless, server: mix.cyberguard.games, port: 35000, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgtw.hysality.com }"
"11|香港 03| - { name: '香港 03 | IEPL + UDP 3.1X | CM', type: trojan, server: mix.cyberguard.games, port: 35000, password: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, sni: cghk.hysality.com }"
"12|香港 02| - { name: '香港 02 | IEPL + UDP 3.1X | CM', type: trojan, server: mix.cyberguard.games, port: 35000, password: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, sni: cghk.hysality.com }"
"13|迪拜 02|  - { name: '迪拜 02 | IEPL 0.5X | CM', type: vless, server: zf.hysality.cc, port: 443, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgae.hysality.com }"
"14|新加坡 02| - { name: '新加坡 02 | IEPL + UDP 3.1X | CM', type: trojan, server: mix.cyberguard.games, port: 35000, password: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, sni: cgsg2.hysality.com }"
"15|新加坡 01| - { name: '新加坡 01 | IEPL + UDP 3.1X | CM', type: trojan, server: mix.cyberguard.games, port: 35000, password: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, sni: cgsg2.hysality.com }"
"16|日本 01|  - { name: '日本 01 | IEPL + UDP 1.7X | CM', type: trojan, server: mix.cyberguard.games, port: 35000, password: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, sni: cgjp.hysality.com }"
"17|日本 02|  - { name: '日本 02 | IEPL + UDP 3X | CM', type: trojan, server: mix.cyberguard.games, port: 35000, password: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, sni: cgjp.hysality.com }"
"18|美国 01|  - { name: '美国 01 | IEPL 1.7X | CM', type: vless, server: mix.cyberguard.games, port: 35000, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgus.hysality.com }"
"19|香港 02| - { name: '香港 02 | IEPL + UDP 3.1X | CM', type: trojan, server: mix.cyberguard.games, port: 35000, password: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, sni: cghk.hysality.com }"
"20|澳大利亚 02| - { name: '澳大利亚 02 | IEPL 0.5X | CM', type: vless, server: zf.hysality.cc, port: 443, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgau.hysality.com }"
"21|迪拜 01|  - { name: '迪拜 01 | IEPL 1.7X | CM', type: vless, server: mix.cyberguard.games, port: 35000, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgae.hysality.com }"
"22|印度 01|  - { name: '印度 01 | IEPL 1X | CM', type: vless, server: mix.cyberguard.games, port: 35000, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgin.hysality.com }"
"23|韩国 02|  - { name: '韩国 02 | IEPL 0.8X | CM', type: vless, server: zf.hysality.cc, port: 443, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgkr.hysality.com }"
"24|印度 02|  - { name: '印度 02 | IEPL 1X | CM', type: vless, server: mix.cyberguard.games, port: 35000, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgin.hysality.com }"
"|美国 02| - { name: '美国 02 | IEPL 0.5X | CM', type: vless, server: zf.hysality.cc, port: 443, uuid: 041ece63-256a-45b6-b3a8-15cd5cae6427, udp: true, tls: true, skip-cert-verify: false, flow: xtls-rprx-vision, client-fingerprint: chrome, servername: cgus.hysality.com }"
)

##############################################################################
# 工具函数：获取本机IP尾数（兼容eth0/wlan0，避免报错）
##############################################################################
get_local_ip_suffix() {
    # 优先有线网卡（单板常用eth0），次选无线网卡wlan0
    local ip=$(ifconfig eth0 2>/dev/null | grep -oE 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -oE '([0-9]*\.){3}[0-9]*' | head -n1)
    if [ -z "$ip" ]; then
        ip=$(ip addr show wlan0 2>/dev/null | grep -oE 'inet ([0-9]*\.){3}[0-9]*' | grep -oE '([0-9]*\.){3}[0-9]*' | head -n1)
    fi
    
    # 提取IP最后一段，无IP返回空
    if [ -n "$ip" ]; then
        echo "${ip##*.}"
    else
        echo ""
    fi
}

##############################################################################
# 工具函数：根据IP尾数匹配节点（无匹配返回默认香港-01）
##############################################################################
match_node_by_ip() {
    local target_ip=$1
    local default_node_name=""
    local default_node_config=""
    
    # 遍历节点列表，匹配IP并记录默认节点
    for item in "${NODE_IP_MAP[@]}"; do
        local item_ip=$(echo "$item" | cut -d'|' -f1)
        local item_name=$(echo "$item" | cut -d'|' -f2)
        local item_config=$(echo "$item" | cut -d'|' -f3-)
        
        # 保存默认节点（IP为空的项）
        if [ -z "$item_ip" ]; then
            default_node_name="$item_name"
            default_node_config="$item_config"
        fi
        
        # 匹配到目标IP，直接返回节点信息
        if [ "$item_ip" = "$target_ip" ]; then
            echo "$item_name|$item_config"
            return 0
        fi
    done
    
    # 无IP匹配，返回默认节点
    echo "$default_node_name|$default_node_config"
}

##############################################################################
# 工具函数：生成mihomo-ip.yaml配置文件
##############################################################################
generate_mihomo_config() {
    local node_name=$1
    local node_config=$2
    local output_path="/data/mihomocfg/mihomo-ip.yaml"
    
    # 检查配置有效性
    if [ -z "$node_config" ]; then
        echo "⚠️  节点配置为空，生成失败"
        return 1
    fi
    
    # 写入配置文件（静态内容+动态节点配置）
    cat > "$output_path" << 'EOF'
mixed-port: 7890
allow-lan: false
bind-address: '*'
mode: rule
log-level: info
external-controller: '127.0.0.1:9090'
unified-delay: true
tcp-concurrent: true
tun:
    enable: true
dns:
    enable: true
    ipv6: false
    default-nameserver: [223.5.5.5, 119.29.29.29, 114.114.114.114]
    enhanced-mode: fake-ip
    fake-ip-range: 198.18.0.1/16
    use-hosts: true
    respect-rules: true
    proxy-server-nameserver: [223.5.5.5, 119.29.29.29, 114.114.114.114]
    nameserver: [223.5.5.5, 119.29.29.29, 114.114.114.114]
    fallback: [1.1.1.1, 8.8.8.8]
    fallback-filter: { geoip: true, geoip-code: CN, geosite: [gfw], ipcidr: [240.0.0.0/4], domain: [+.google.com, +.facebook.com, +.youtube.com] }
proxies:
EOF
    # 追加动态节点配置
    echo "    $node_config" >> "$output_path"
    # 追加剩余静态配置（占位符NODE_NAME后续替换）
    cat >> "$output_path" << 'EOF'
proxy-groups:
    - { name: CyberGuard, type: select, proxies: [自动选择, 故障转移,NODE_NAME] }
    - { name: 自动选择, type: url-test, proxies: [NODE_NAME], url: 'http://www.gstatic.com/generate_204', interval: 86400 }
    - { name: 故障转移, type: fallback, proxies: [NODE_NAME], url: 'http://www.gstatic.com/generate_204', interval: 7200 }

rules:
    - 'IP-CIDR,1.1.1.1/32,CyberGuard,no-resolve'
    - 'IP-CIDR,8.8.8.8/32,CyberGuard,no-resolve'
    - 'DOMAIN-SUFFIX,services.googleapis.cn,CyberGuard'
    - 'DOMAIN-SUFFIX,xn--ngstr-lra8j.com,CyberGuard'
    - 'DOMAIN,safebrowsing.urlsec.qq.com,DIRECT'
    - 'DOMAIN,safebrowsing.googleapis.com,DIRECT'
    - 'DOMAIN,developer.apple.com,CyberGuard'
    - 'DOMAIN-SUFFIX,digicert.com,CyberGuard'
    - 'DOMAIN,ocsp.apple.com,CyberGuard'
    - 'DOMAIN,ocsp.comodoca.com,CyberGuard'
    - 'DOMAIN,ocsp.usertrust.com,CyberGuard'
    - 'DOMAIN,ocsp.sectigo.com,CyberGuard'
    - 'DOMAIN,ocsp.verisign.net,CyberGuard'
    - 'DOMAIN-SUFFIX,apple-dns.net,CyberGuard'
    - 'DOMAIN,testflight.apple.com,CyberGuard'
    - 'DOMAIN,sandbox.itunes.apple.com,CyberGuard'
    - 'DOMAIN,itunes.apple.com,CyberGuard'
    - 'DOMAIN-SUFFIX,apps.apple.com,CyberGuard'
    - 'DOMAIN-SUFFIX,blobstore.apple.com,CyberGuard'
    - 'DOMAIN,cvws.icloud-content.com,CyberGuard'
    - 'DOMAIN-SUFFIX,mzstatic.com,DIRECT'
    - 'DOMAIN-SUFFIX,itunes.apple.com,DIRECT'
    - 'DOMAIN-SUFFIX,icloud.com,DIRECT'
    - 'DOMAIN-SUFFIX,icloud-content.com,DIRECT'
    - 'DOMAIN-SUFFIX,me.com,DIRECT'
    - 'DOMAIN-SUFFIX,aaplimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,cdn20.com,DIRECT'
    - 'DOMAIN-SUFFIX,cdn-apple.com,DIRECT'
    - 'DOMAIN-SUFFIX,akadns.net,DIRECT'
    - 'DOMAIN-SUFFIX,akamaiedge.net,DIRECT'
    - 'DOMAIN-SUFFIX,edgekey.net,DIRECT'
    - 'DOMAIN-SUFFIX,mwcloudcdn.com,DIRECT'
    - 'DOMAIN-SUFFIX,mwcname.com,DIRECT'
    - 'DOMAIN-SUFFIX,apple.com,DIRECT'
    - 'DOMAIN-SUFFIX,apple-cloudkit.com,DIRECT'
    - 'DOMAIN-SUFFIX,apple-mapkit.com,DIRECT'
    - 'DOMAIN,cn.bing.com,DIRECT'
    - 'DOMAIN-SUFFIX,126.com,DIRECT'
    - 'DOMAIN-SUFFIX,126.net,DIRECT'
    - 'DOMAIN-SUFFIX,127.net,DIRECT'
    - 'DOMAIN-SUFFIX,163.com,DIRECT'
    - 'DOMAIN-SUFFIX,360buyimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,36kr.com,DIRECT'
    - 'DOMAIN-SUFFIX,acfun.tv,DIRECT'
    - 'DOMAIN-SUFFIX,air-matters.com,DIRECT'
    - 'DOMAIN-SUFFIX,aixifan.com,DIRECT'
    - 'DOMAIN-KEYWORD,alicdn,DIRECT'
    - 'DOMAIN-KEYWORD,alipay,DIRECT'
    - 'DOMAIN-KEYWORD,taobao,DIRECT'
    - 'DOMAIN-SUFFIX,amap.com,DIRECT'
    - 'DOMAIN-SUFFIX,autonavi.com,DIRECT'
    - 'DOMAIN-KEYWORD,baidu,DIRECT'
    - 'DOMAIN-SUFFIX,bdimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,bdstatic.com,DIRECT'
    - 'DOMAIN-SUFFIX,bilibili.com,DIRECT'
    - 'DOMAIN-SUFFIX,bilivideo.com,DIRECT'
    - 'DOMAIN-SUFFIX,caiyunapp.com,DIRECT'
    - 'DOMAIN-SUFFIX,clouddn.com,DIRECT'
    - 'DOMAIN-SUFFIX,cnbeta.com,DIRECT'
    - 'DOMAIN-SUFFIX,cnbetacdn.com,DIRECT'
    - 'DOMAIN-SUFFIX,cootekservice.com,DIRECT'
    - 'DOMAIN-SUFFIX,csdn.net,DIRECT'
    - 'DOMAIN-SUFFIX,ctrip.com,DIRECT'
    - 'DOMAIN-SUFFIX,dgtle.com,DIRECT'
    - 'DOMAIN-SUFFIX,dianping.com,DIRECT'
    - 'DOMAIN-SUFFIX,douban.com,DIRECT'
    - 'DOMAIN-SUFFIX,doubanio.com,DIRECT'
    - 'DOMAIN-SUFFIX,duokan.com,DIRECT'
    - 'DOMAIN-SUFFIX,easou.com,DIRECT'
    - 'DOMAIN-SUFFIX,ele.me,DIRECT'
    - 'DOMAIN-SUFFIX,feng.com,DIRECT'
    - 'DOMAIN-SUFFIX,fir.im,DIRECT'
    - 'DOMAIN-SUFFIX,frdic.com,DIRECT'
    - 'DOMAIN-SUFFIX,g-cores.com,DIRECT'
    - 'DOMAIN-SUFFIX,godic.net,DIRECT'
    - 'DOMAIN-SUFFIX,gtimg.com,DIRECT'
    - 'DOMAIN,cdn.hockeyapp.net,DIRECT'
    - 'DOMAIN-SUFFIX,hongxiu.com,DIRECT'
    - 'DOMAIN-SUFFIX,hxcdn.net,DIRECT'
    - 'DOMAIN-SUFFIX,iciba.com,DIRECT'
    - 'DOMAIN-SUFFIX,ifeng.com,DIRECT'
    - 'DOMAIN-SUFFIX,ifengimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,ipip.net,DIRECT'
    - 'DOMAIN-SUFFIX,iqiyi.com,DIRECT'
    - 'DOMAIN-SUFFIX,jd.com,DIRECT'
    - 'DOMAIN-SUFFIX,jianshu.com,DIRECT'
    - 'DOMAIN-SUFFIX,knewone.com,DIRECT'
    - 'DOMAIN-SUFFIX,le.com,DIRECT'
    - 'DOMAIN-SUFFIX,lecloud.com,DIRECT'
    - 'DOMAIN-SUFFIX,lemicp.com,DIRECT'
    - 'DOMAIN-SUFFIX,licdn.com,DIRECT'
    - 'DOMAIN-SUFFIX,luoo.net,DIRECT'
    - 'DOMAIN-SUFFIX,meituan.com,DIRECT'
    - 'DOMAIN-SUFFIX,meituan.net,DIRECT'
    - 'DOMAIN-SUFFIX,mi.com,DIRECT'
    - 'DOMAIN-SUFFIX,miaopai.com,DIRECT'
    - 'DOMAIN-SUFFIX,microsoft.com,DIRECT'
    - 'DOMAIN-SUFFIX,microsoftonline.com,DIRECT'
    - 'DOMAIN-SUFFIX,miui.com,DIRECT'
    - 'DOMAIN-SUFFIX,miwifi.com,DIRECT'
    - 'DOMAIN-SUFFIX,mob.com,DIRECT'
    - 'DOMAIN-SUFFIX,netease.com,DIRECT'
    - 'DOMAIN-SUFFIX,office.com,DIRECT'
    - 'DOMAIN-SUFFIX,office365.com,DIRECT'
    - 'DOMAIN-KEYWORD,officecdn,DIRECT'
    - 'DOMAIN-SUFFIX,oschina.net,DIRECT'
    - 'DOMAIN-SUFFIX,ppsimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,pstatp.com,DIRECT'
    - 'DOMAIN-SUFFIX,qcloud.com,DIRECT'
    - 'DOMAIN-SUFFIX,qdaily.com,DIRECT'
    - 'DOMAIN-SUFFIX,qdmm.com,DIRECT'
    - 'DOMAIN-SUFFIX,qhimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,qhres.com,DIRECT'
    - 'DOMAIN-SUFFIX,qidian.com,DIRECT'
    - 'DOMAIN-SUFFIX,qihucdn.com,DIRECT'
    - 'DOMAIN-SUFFIX,qiniu.com,DIRECT'
    - 'DOMAIN-SUFFIX,qiniucdn.com,DIRECT'
    - 'DOMAIN-SUFFIX,qiyipic.com,DIRECT'
    - 'DOMAIN-SUFFIX,qq.com,DIRECT'
    - 'DOMAIN-SUFFIX,qqurl.com,DIRECT'
    - 'DOMAIN-SUFFIX,rarbg.to,DIRECT'
    - 'DOMAIN-SUFFIX,ruguoapp.com,DIRECT'
    - 'DOMAIN-SUFFIX,segmentfault.com,DIRECT'
    - 'DOMAIN-SUFFIX,sinaapp.com,DIRECT'
    - 'DOMAIN-SUFFIX,smzdm.com,DIRECT'
    - 'DOMAIN-SUFFIX,snapdrop.net,DIRECT'
    - 'DOMAIN-SUFFIX,sogou.com,DIRECT'
    - 'DOMAIN-SUFFIX,sogoucdn.com,DIRECT'
    - 'DOMAIN-SUFFIX,sohu.com,DIRECT'
    - 'DOMAIN-SUFFIX,soku.com,DIRECT'
    - 'DOMAIN-SUFFIX,speedtest.net,DIRECT'
    - 'DOMAIN-SUFFIX,sspai.com,DIRECT'
    - 'DOMAIN-SUFFIX,suning.com,DIRECT'
    - 'DOMAIN-SUFFIX,taobao.com,DIRECT'
    - 'DOMAIN-SUFFIX,tencent.com,DIRECT'
    - 'DOMAIN-SUFFIX,tenpay.com,DIRECT'
    - 'DOMAIN-SUFFIX,tianyancha.com,DIRECT'
    - 'DOMAIN-SUFFIX,tmall.com,DIRECT'
    - 'DOMAIN-SUFFIX,tudou.com,DIRECT'
    - 'DOMAIN-SUFFIX,umetrip.com,DIRECT'
    - 'DOMAIN-SUFFIX,upaiyun.com,DIRECT'
    - 'DOMAIN-SUFFIX,upyun.com,DIRECT'
    - 'DOMAIN-SUFFIX,veryzhun.com,DIRECT'
    - 'DOMAIN-SUFFIX,weather.com,DIRECT'
    - 'DOMAIN-SUFFIX,weibo.com,DIRECT'
    - 'DOMAIN-SUFFIX,xiami.com,DIRECT'
    - 'DOMAIN-SUFFIX,xiami.net,DIRECT'
    - 'DOMAIN-SUFFIX,xiaomicp.com,DIRECT'
    - 'DOMAIN-SUFFIX,ximalaya.com,DIRECT'
    - 'DOMAIN-SUFFIX,xmcdn.com,DIRECT'
    - 'DOMAIN-SUFFIX,xunlei.com,DIRECT'
    - 'DOMAIN-SUFFIX,yhd.com,DIRECT'
    - 'DOMAIN-SUFFIX,yihaodianimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,yinxiang.com,DIRECT'
    - 'DOMAIN-SUFFIX,ykimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,youdao.com,DIRECT'
    - 'DOMAIN-SUFFIX,youku.com,DIRECT'
    - 'DOMAIN-SUFFIX,zealer.com,DIRECT'
    - 'DOMAIN-SUFFIX,zhihu.com,DIRECT'
    - 'DOMAIN-SUFFIX,zhimg.com,DIRECT'
    - 'DOMAIN-SUFFIX,zimuzu.tv,DIRECT'
    - 'DOMAIN-SUFFIX,zoho.com,DIRECT'
    - 'DOMAIN-KEYWORD,amazon,CyberGuard'
    - 'DOMAIN-KEYWORD,google,CyberGuard'
    - 'DOMAIN-KEYWORD,gmail,CyberGuard'
    - 'DOMAIN-KEYWORD,youtube,CyberGuard'
    - 'DOMAIN-KEYWORD,facebook,CyberGuard'
    - 'DOMAIN-SUFFIX,fb.me,CyberGuard'
    - 'DOMAIN-SUFFIX,fbcdn.net,CyberGuard'
    - 'DOMAIN-KEYWORD,twitter,CyberGuard'
    - 'DOMAIN-KEYWORD,instagram,CyberGuard'
    - 'DOMAIN-KEYWORD,dropbox,CyberGuard'
    - 'DOMAIN-SUFFIX,twimg.com,CyberGuard'
    - 'DOMAIN-KEYWORD,blogspot,CyberGuard'
    - 'DOMAIN-SUFFIX,youtu.be,CyberGuard'
    - 'DOMAIN-KEYWORD,whatsapp,CyberGuard'
    - 'DOMAIN-KEYWORD,admarvel,REJECT'
    - 'DOMAIN-KEYWORD,admaster,REJECT'
    - 'DOMAIN-KEYWORD,adsage,REJECT'
    - 'DOMAIN-KEYWORD,adsmogo,REJECT'
    - 'DOMAIN-KEYWORD,adsrvmedia,REJECT'
    - 'DOMAIN-KEYWORD,adwords,REJECT'
    - 'DOMAIN-KEYWORD,adservice,REJECT'
    - 'DOMAIN-SUFFIX,appsflyer.com,REJECT'
    - 'DOMAIN-KEYWORD,domob,REJECT'
    - 'DOMAIN-SUFFIX,doubleclick.net,REJECT'
    - 'DOMAIN-KEYWORD,duomeng,REJECT'
    - 'DOMAIN-KEYWORD,dwtrack,REJECT'
    - 'DOMAIN-KEYWORD,guanggao,REJECT'
    - 'DOMAIN-KEYWORD,lianmeng,REJECT'
    - 'DOMAIN-SUFFIX,mmstat.com,REJECT'
    - 'DOMAIN-KEYWORD,mopub,REJECT'
    - 'DOMAIN-KEYWORD,omgmta,REJECT'
    - 'DOMAIN-KEYWORD,openx,REJECT'
    - 'DOMAIN-KEYWORD,partnerad,REJECT'
    - 'DOMAIN-KEYWORD,pingfore,REJECT'
    - 'DOMAIN-KEYWORD,supersonicads,REJECT'
    - 'DOMAIN-KEYWORD,uedas,REJECT'
    - 'DOMAIN-KEYWORD,umeng,REJECT'
    - 'DOMAIN-KEYWORD,usage,REJECT'
    - 'DOMAIN-SUFFIX,vungle.com,REJECT'
    - 'DOMAIN-KEYWORD,wlmonitor,REJECT'
    - 'DOMAIN-KEYWORD,zjtoolbar,REJECT'
    - 'DOMAIN-SUFFIX,9to5mac.com,CyberGuard'
    - 'DOMAIN-SUFFIX,abpchina.org,CyberGuard'
    - 'DOMAIN-SUFFIX,adblockplus.org,CyberGuard'
    - 'DOMAIN-SUFFIX,adobe.com,CyberGuard'
    - 'DOMAIN-SUFFIX,akamaized.net,CyberGuard'
    - 'DOMAIN-SUFFIX,alfredapp.com,CyberGuard'
    - 'DOMAIN-SUFFIX,amplitude.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ampproject.org,CyberGuard'
    - 'DOMAIN-SUFFIX,android.com,CyberGuard'
    - 'DOMAIN-SUFFIX,angularjs.org,CyberGuard'
    - 'DOMAIN-SUFFIX,aolcdn.com,CyberGuard'
    - 'DOMAIN-SUFFIX,apkpure.com,CyberGuard'
    - 'DOMAIN-SUFFIX,appledaily.com,CyberGuard'
    - 'DOMAIN-SUFFIX,appshopper.com,CyberGuard'
    - 'DOMAIN-SUFFIX,appspot.com,CyberGuard'
    - 'DOMAIN-SUFFIX,arcgis.com,CyberGuard'
    - 'DOMAIN-SUFFIX,archive.org,CyberGuard'
    - 'DOMAIN-SUFFIX,armorgames.com,CyberGuard'
    - 'DOMAIN-SUFFIX,aspnetcdn.com,CyberGuard'
    - 'DOMAIN-SUFFIX,att.com,CyberGuard'
    - 'DOMAIN-SUFFIX,awsstatic.com,CyberGuard'
    - 'DOMAIN-SUFFIX,azureedge.net,CyberGuard'
    - 'DOMAIN-SUFFIX,azurewebsites.net,CyberGuard'
    - 'DOMAIN-SUFFIX,bing.com,CyberGuard'
    - 'DOMAIN-SUFFIX,bintray.com,CyberGuard'
    - 'DOMAIN-SUFFIX,bit.com,CyberGuard'
    - 'DOMAIN-SUFFIX,bit.ly,CyberGuard'
    - 'DOMAIN-SUFFIX,bitbucket.org,CyberGuard'
    - 'DOMAIN-SUFFIX,bjango.com,CyberGuard'
    - 'DOMAIN-SUFFIX,bkrtx.com,CyberGuard'
    - 'DOMAIN-SUFFIX,blog.com,CyberGuard'
    - 'DOMAIN-SUFFIX,blogcdn.com,CyberGuard'
    - 'DOMAIN-SUFFIX,blogger.com,CyberGuard'
    - 'DOMAIN-SUFFIX,blogsmithmedia.com,CyberGuard'
    - 'DOMAIN-SUFFIX,blogspot.com,CyberGuard'
    - 'DOMAIN-SUFFIX,blogspot.hk,CyberGuard'
    - 'DOMAIN-SUFFIX,bloomberg.com,CyberGuard'
    - 'DOMAIN-SUFFIX,box.com,CyberGuard'
    - 'DOMAIN-SUFFIX,box.net,CyberGuard'
    - 'DOMAIN-SUFFIX,cachefly.net,CyberGuard'
    - 'DOMAIN-SUFFIX,chromium.org,CyberGuard'
    - 'DOMAIN-SUFFIX,cl.ly,CyberGuard'
    - 'DOMAIN-SUFFIX,cloudflare.com,CyberGuard'
    - 'DOMAIN-SUFFIX,cloudfront.net,CyberGuard'
    - 'DOMAIN-SUFFIX,cloudmagic.com,CyberGuard'
    - 'DOMAIN-SUFFIX,cmail19.com,CyberGuard'
    - 'DOMAIN-SUFFIX,cnet.com,CyberGuard'
    - 'DOMAIN-SUFFIX,cocoapods.org,CyberGuard'
    - 'DOMAIN-SUFFIX,comodoca.com,CyberGuard'
    - 'DOMAIN-SUFFIX,crashlytics.com,CyberGuard'
    - 'DOMAIN-SUFFIX,culturedcode.com,CyberGuard'
    - 'DOMAIN-SUFFIX,d.pr,CyberGuard'
    - 'DOMAIN-SUFFIX,danilo.to,CyberGuard'
    - 'DOMAIN-SUFFIX,dayone.me,CyberGuard'
    - 'DOMAIN-SUFFIX,db.tt,CyberGuard'
    - 'DOMAIN-SUFFIX,deskconnect.com,CyberGuard'
    - 'DOMAIN-SUFFIX,disq.us,CyberGuard'
    - 'DOMAIN-SUFFIX,disqus.com,CyberGuard'
    - 'DOMAIN-SUFFIX,disquscdn.com,CyberGuard'
    - 'DOMAIN-SUFFIX,dnsimple.com,CyberGuard'
    - 'DOMAIN-SUFFIX,docker.com,CyberGuard'
    - 'DOMAIN-SUFFIX,dribbble.com,CyberGuard'
    - 'DOMAIN-SUFFIX,droplr.com,CyberGuard'
    - 'DOMAIN-SUFFIX,duckduckgo.com,CyberGuard'
    - 'DOMAIN-SUFFIX,dueapp.com,CyberGuard'
    - 'DOMAIN-SUFFIX,dytt8.net,CyberGuard'
    - 'DOMAIN-SUFFIX,edgecastcdn.net,CyberGuard'
    - 'DOMAIN-SUFFIX,edgekey.net,CyberGuard'
    - 'DOMAIN-SUFFIX,edgesuite.net,CyberGuard'
    - 'DOMAIN-SUFFIX,engadget.com,CyberGuard'
    - 'DOMAIN-SUFFIX,entrust.net,CyberGuard'
    - 'DOMAIN-SUFFIX,eurekavpt.com,CyberGuard'
    - 'DOMAIN-SUFFIX,evernote.com,CyberGuard'
    - 'DOMAIN-SUFFIX,fabric.io,CyberGuard'
    - 'DOMAIN-SUFFIX,fast.com,CyberGuard'
    - 'DOMAIN-SUFFIX,fastly.net,CyberGuard'
    - 'DOMAIN-SUFFIX,fc2.com,CyberGuard'
    - 'DOMAIN-SUFFIX,feedburner.com,CyberGuard'
    - 'DOMAIN-SUFFIX,feedly.com,CyberGuard'
    - 'DOMAIN-SUFFIX,feedsportal.com,CyberGuard'
    - 'DOMAIN-SUFFIX,fiftythree.com,CyberGuard'
    - 'DOMAIN-SUFFIX,firebaseio.com,CyberGuard'
    - 'DOMAIN-SUFFIX,flexibits.com,CyberGuard'
    - 'DOMAIN-SUFFIX,flickr.com,CyberGuard'
    - 'DOMAIN-SUFFIX,flipboard.com,CyberGuard'
    - 'DOMAIN-SUFFIX,g.co,CyberGuard'
    - 'DOMAIN-SUFFIX,gabia.net,CyberGuard'
    - 'DOMAIN-SUFFIX,geni.us,CyberGuard'
    - 'DOMAIN-SUFFIX,gfx.ms,CyberGuard'
    - 'DOMAIN-SUFFIX,ggpht.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ghostnoteapp.com,CyberGuard'
    - 'DOMAIN-SUFFIX,git.io,CyberGuard'
    - 'DOMAIN-KEYWORD,github,CyberGuard'
    - 'DOMAIN-SUFFIX,globalsign.com,CyberGuard'
    - 'DOMAIN-SUFFIX,gmodules.com,CyberGuard'
    - 'DOMAIN-SUFFIX,godaddy.com,CyberGuard'
    - 'DOMAIN-SUFFIX,golang.org,CyberGuard'
    - 'DOMAIN-SUFFIX,gongm.in,CyberGuard'
    - 'DOMAIN-SUFFIX,goo.gl,CyberGuard'
    - 'DOMAIN-SUFFIX,goodreaders.com,CyberGuard'
    - 'DOMAIN-SUFFIX,goodreads.com,CyberGuard'
    - 'DOMAIN-SUFFIX,gravatar.com,CyberGuard'
    - 'DOMAIN-SUFFIX,gstatic.com,CyberGuard'
    - 'DOMAIN-SUFFIX,gvt0.com,CyberGuard'
    - 'DOMAIN-SUFFIX,hockeyapp.net,CyberGuard'
    - 'DOMAIN-SUFFIX,hotmail.com,CyberGuard'
    - 'DOMAIN-SUFFIX,icons8.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ifixit.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ift.tt,CyberGuard'
    - 'DOMAIN-SUFFIX,ifttt.com,CyberGuard'
    - 'DOMAIN-SUFFIX,iherb.com,CyberGuard'
    - 'DOMAIN-SUFFIX,imageshack.us,CyberGuard'
    - 'DOMAIN-SUFFIX,img.ly,CyberGuard'
    - 'DOMAIN-SUFFIX,imgur.com,CyberGuard'
    - 'DOMAIN-SUFFIX,imore.com,CyberGuard'
    - 'DOMAIN-SUFFIX,instapaper.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ipn.li,CyberGuard'
    - 'DOMAIN-SUFFIX,is.gd,CyberGuard'
    - 'DOMAIN-SUFFIX,issuu.com,CyberGuard'
    - 'DOMAIN-SUFFIX,itgonglun.com,CyberGuard'
    - 'DOMAIN-SUFFIX,itun.es,CyberGuard'
    - 'DOMAIN-SUFFIX,ixquick.com,CyberGuard'
    - 'DOMAIN-SUFFIX,j.mp,CyberGuard'
    - 'DOMAIN-SUFFIX,js.revsci.net,CyberGuard'
    - 'DOMAIN-SUFFIX,jshint.com,CyberGuard'
    - 'DOMAIN-SUFFIX,jtvnw.net,CyberGuard'
    - 'DOMAIN-SUFFIX,justgetflux.com,CyberGuard'
    - 'DOMAIN-SUFFIX,kat.cr,CyberGuard'
    - 'DOMAIN-SUFFIX,klip.me,CyberGuard'
    - 'DOMAIN-SUFFIX,libsyn.com,CyberGuard'
    - 'DOMAIN-SUFFIX,linkedin.com,CyberGuard'
    - 'DOMAIN-SUFFIX,line-apps.com,CyberGuard'
    - 'DOMAIN-SUFFIX,linode.com,CyberGuard'
    - 'DOMAIN-SUFFIX,lithium.com,CyberGuard'
    - 'DOMAIN-SUFFIX,littlehj.com,CyberGuard'
    - 'DOMAIN-SUFFIX,live.com,CyberGuard'
    - 'DOMAIN-SUFFIX,live.net,CyberGuard'
    - 'DOMAIN-SUFFIX,livefilestore.com,CyberGuard'
    - 'DOMAIN-SUFFIX,llnwd.net,CyberGuard'
    - 'DOMAIN-SUFFIX,macid.co,CyberGuard'
    - 'DOMAIN-SUFFIX,macromedia.com,CyberGuard'
    - 'DOMAIN-SUFFIX,macrumors.com,CyberGuard'
    - 'DOMAIN-SUFFIX,mashable.com,CyberGuard'
    - 'DOMAIN-SUFFIX,mathjax.org,CyberGuard'
    - 'DOMAIN-SUFFIX,medium.com,CyberGuard'
    - 'DOMAIN-SUFFIX,mega.co.nz,CyberGuard'
    - 'DOMAIN-SUFFIX,mega.nz,CyberGuard'
    - 'DOMAIN-SUFFIX,megaupload.com,CyberGuard'
    - 'DOMAIN-SUFFIX,microsofttranslator.com,CyberGuard'
    - 'DOMAIN-SUFFIX,mindnode.com,CyberGuard'
    - 'DOMAIN-SUFFIX,mobile01.com,CyberGuard'
    - 'DOMAIN-SUFFIX,modmyi.com,CyberGuard'
    - 'DOMAIN-SUFFIX,msedge.net,CyberGuard'
    - 'DOMAIN-SUFFIX,myfontastic.com,CyberGuard'
    - 'DOMAIN-SUFFIX,name.com,CyberGuard'
    - 'DOMAIN-SUFFIX,nextmedia.com,CyberGuard'
    - 'DOMAIN-SUFFIX,nsstatic.net,CyberGuard'
    - 'DOMAIN-SUFFIX,nssurge.com,CyberGuard'
    - 'DOMAIN-SUFFIX,nyt.com,CyberGuard'
    - 'DOMAIN-SUFFIX,nytimes.com,CyberGuard'
    - 'DOMAIN-SUFFIX,omnigroup.com,CyberGuard'
    - 'DOMAIN-SUFFIX,onedrive.com,CyberGuard'
    - 'DOMAIN-SUFFIX,onenote.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ooyala.com,CyberGuard'
    - 'DOMAIN-SUFFIX,openvpn.net,CyberGuard'
    - 'DOMAIN-SUFFIX,openwrt.org,CyberGuard'
    - 'DOMAIN-SUFFIX,orkut.com,CyberGuard'
    - 'DOMAIN-SUFFIX,osxdaily.com,CyberGuard'
    - 'DOMAIN-SUFFIX,outlook.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ow.ly,CyberGuard'
    - 'DOMAIN-SUFFIX,paddleapi.com,CyberGuard'
    - 'DOMAIN-SUFFIX,parallels.com,CyberGuard'
    - 'DOMAIN-SUFFIX,parse.com,CyberGuard'
    - 'DOMAIN-SUFFIX,pdfexpert.com,CyberGuard'
    - 'DOMAIN-SUFFIX,periscope.tv,CyberGuard'
    - 'DOMAIN-SUFFIX,pinboard.in,CyberGuard'
    - 'DOMAIN-SUFFIX,pinterest.com,CyberGuard'
    - 'DOMAIN-SUFFIX,pixelmator.com,CyberGuard'
    - 'DOMAIN-SUFFIX,pixiv.net,CyberGuard'
    - 'DOMAIN-SUFFIX,playpcesor.com,CyberGuard'
    - 'DOMAIN-SUFFIX,playstation.com,CyberGuard'
    - 'DOMAIN-SUFFIX,playstation.com.hk,CyberGuard'
    - 'DOMAIN-SUFFIX,playstation.net,CyberGuard'
    - 'DOMAIN-SUFFIX,playstationnetwork.com,CyberGuard'
    - 'DOMAIN-SUFFIX,pushwoosh.com,CyberGuard'
    - 'DOMAIN-SUFFIX,rime.im,CyberGuard'
    - 'DOMAIN-SUFFIX,servebom.com,CyberGuard'
    - 'DOMAIN-SUFFIX,sfx.ms,CyberGuard'
    - 'DOMAIN-SUFFIX,shadowsocks.org,CyberGuard'
    - 'DOMAIN-SUFFIX,sharethis.com,CyberGuard'
    - 'DOMAIN-SUFFIX,shazam.com,CyberGuard'
    - 'DOMAIN-SUFFIX,skype.com,CyberGuard'
    - 'DOMAIN-SUFFIX,smartdnsCyberGuard.com,CyberGuard'
    - 'DOMAIN-SUFFIX,smartmailcloud.com,CyberGuard'
    - 'DOMAIN-SUFFIX,sndcdn.com,CyberGuard'
    - 'DOMAIN-SUFFIX,sony.com,CyberGuard'
    - 'DOMAIN-SUFFIX,soundcloud.com,CyberGuard'
    - 'DOMAIN-SUFFIX,sourceforge.net,CyberGuard'
    - 'DOMAIN-SUFFIX,spotify.com,CyberGuard'
    - 'DOMAIN-SUFFIX,squarespace.com,CyberGuard'
    - 'DOMAIN-SUFFIX,sstatic.net,CyberGuard'
    - 'DOMAIN-SUFFIX,st.luluku.pw,CyberGuard'
    - 'DOMAIN-SUFFIX,stackoverflow.com,CyberGuard'
    - 'DOMAIN-SUFFIX,startpage.com,CyberGuard'
    - 'DOMAIN-SUFFIX,staticflickr.com,CyberGuard'
    - 'DOMAIN-SUFFIX,steamcommunity.com,CyberGuard'
    - 'DOMAIN-SUFFIX,symauth.com,CyberGuard'
    - 'DOMAIN-SUFFIX,symcb.com,CyberGuard'
    - 'DOMAIN-SUFFIX,symcd.com,CyberGuard'
    - 'DOMAIN-SUFFIX,tapbots.com,CyberGuard'
    - 'DOMAIN-SUFFIX,tapbots.net,CyberGuard'
    - 'DOMAIN-SUFFIX,tdesktop.com,CyberGuard'
    - 'DOMAIN-SUFFIX,techcrunch.com,CyberGuard'
    - 'DOMAIN-SUFFIX,techsmith.com,CyberGuard'
    - 'DOMAIN-SUFFIX,thepiratebay.org,CyberGuard'
    - 'DOMAIN-SUFFIX,theverge.com,CyberGuard'
    - 'DOMAIN-SUFFIX,time.com,CyberGuard'
    - 'DOMAIN-SUFFIX,timeinc.net,CyberGuard'
    - 'DOMAIN-SUFFIX,tiny.cc,CyberGuard'
    - 'DOMAIN-SUFFIX,tinypic.com,CyberGuard'
    - 'DOMAIN-SUFFIX,tmblr.co,CyberGuard'
    - 'DOMAIN-SUFFIX,todoist.com,CyberGuard'
    - 'DOMAIN-SUFFIX,trello.com,CyberGuard'
    - 'DOMAIN-SUFFIX,trustasiassl.com,CyberGuard'
    - 'DOMAIN-SUFFIX,tumblr.co,CyberGuard'
    - 'DOMAIN-SUFFIX,tumblr.com,CyberGuard'
    - 'DOMAIN-SUFFIX,tweetdeck.com,CyberGuard'
    - 'DOMAIN-SUFFIX,tweetmarker.net,CyberGuard'
    - 'DOMAIN-SUFFIX,twitch.tv,CyberGuard'
    - 'DOMAIN-SUFFIX,txmblr.com,CyberGuard'
    - 'DOMAIN-SUFFIX,typekit.net,CyberGuard'
    - 'DOMAIN-SUFFIX,ubertags.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ublock.org,CyberGuard'
    - 'DOMAIN-SUFFIX,ubnt.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ulyssesapp.com,CyberGuard'
    - 'DOMAIN-SUFFIX,urchin.com,CyberGuard'
    - 'DOMAIN-SUFFIX,usertrust.com,CyberGuard'
    - 'DOMAIN-SUFFIX,v.gd,CyberGuard'
    - 'DOMAIN-SUFFIX,v2ex.com,CyberGuard'
    - 'DOMAIN-SUFFIX,vimeo.com,CyberGuard'
    - 'DOMAIN-SUFFIX,vimeocdn.com,CyberGuard'
    - 'DOMAIN-SUFFIX,vine.co,CyberGuard'
    - 'DOMAIN-SUFFIX,vivaldi.com,CyberGuard'
    - 'DOMAIN-SUFFIX,vox-cdn.com,CyberGuard'
    - 'DOMAIN-SUFFIX,vsco.co,CyberGuard'
    - 'DOMAIN-SUFFIX,vultr.com,CyberGuard'
    - 'DOMAIN-SUFFIX,w.org,CyberGuard'
    - 'DOMAIN-SUFFIX,w3schools.com,CyberGuard'
    - 'DOMAIN-SUFFIX,webtype.com,CyberGuard'
    - 'DOMAIN-SUFFIX,wikiwand.com,CyberGuard'
    - 'DOMAIN-SUFFIX,wikileaks.org,CyberGuard'
    - 'DOMAIN-SUFFIX,wikimedia.org,CyberGuard'
    - 'DOMAIN-SUFFIX,wikipedia.com,CyberGuard'
    - 'DOMAIN-SUFFIX,wikipedia.org,CyberGuard'
    - 'DOMAIN-SUFFIX,windows.com,CyberGuard'
    - 'DOMAIN-SUFFIX,windows.net,CyberGuard'
    - 'DOMAIN-SUFFIX,wire.com,CyberGuard'
    - 'DOMAIN-SUFFIX,wordpress.com,CyberGuard'
    - 'DOMAIN-SUFFIX,workflowy.com,CyberGuard'
    - 'DOMAIN-SUFFIX,wp.com,CyberGuard'
    - 'DOMAIN-SUFFIX,wsj.com,CyberGuard'
    - 'DOMAIN-SUFFIX,wsj.net,CyberGuard'
    - 'DOMAIN-SUFFIX,xda-developers.com,CyberGuard'
    - 'DOMAIN-SUFFIX,xeeno.com,CyberGuard'
    - 'DOMAIN-SUFFIX,xiti.com,CyberGuard'
    - 'DOMAIN-SUFFIX,yahoo.com,CyberGuard'
    - 'DOMAIN-SUFFIX,yimg.com,CyberGuard'
    - 'DOMAIN-SUFFIX,ying.com,CyberGuard'
    - 'DOMAIN-SUFFIX,yoyo.org,CyberGuard'
    - 'DOMAIN-SUFFIX,ytimg.com,CyberGuard'
    - 'DOMAIN-SUFFIX,telegra.ph,CyberGuard'
    - 'DOMAIN-SUFFIX,telegram.org,CyberGuard'
    - 'IP-CIDR,91.108.4.0/22,CyberGuard,no-resolve'
    - 'IP-CIDR,91.108.8.0/21,CyberGuard,no-resolve'
    - 'IP-CIDR,91.108.16.0/22,CyberGuard,no-resolve'
    - 'IP-CIDR,91.108.56.0/22,CyberGuard,no-resolve'
    - 'IP-CIDR,149.154.160.0/20,CyberGuard,no-resolve'
    - 'IP-CIDR6,2001:67c:4e8::/48,CyberGuard,no-resolve'
    - 'IP-CIDR6,2001:b28:f23d::/48,CyberGuard,no-resolve'
    - 'IP-CIDR6,2001:b28:f23f::/48,CyberGuard,no-resolve'
    - 'IP-CIDR,120.232.181.162/32,CyberGuard,no-resolve'
    - 'IP-CIDR,120.241.147.226/32,CyberGuard,no-resolve'
    - 'IP-CIDR,120.253.253.226/32,CyberGuard,no-resolve'
    - 'IP-CIDR,120.253.255.162/32,CyberGuard,no-resolve'
    - 'IP-CIDR,120.253.255.34/32,CyberGuard,no-resolve'
    - 'IP-CIDR,120.253.255.98/32,CyberGuard,no-resolve'
    - 'IP-CIDR,180.163.150.162/32,CyberGuard,no-resolve'
    - 'IP-CIDR,180.163.150.34/32,CyberGuard,no-resolve'
    - 'IP-CIDR,180.163.151.162/32,CyberGuard,no-resolve'
    - 'IP-CIDR,180.163.151.34/32,CyberGuard,no-resolve'
    - 'IP-CIDR,203.208.39.0/24,CyberGuard,no-resolve'
    - 'IP-CIDR,203.208.40.0/24,CyberGuard,no-resolve'
    - 'IP-CIDR,203.208.41.0/24,CyberGuard,no-resolve'
    - 'IP-CIDR,203.208.43.0/24,CyberGuard,no-resolve'
    - 'IP-CIDR,203.208.50.0/24,CyberGuard,no-resolve'
    - 'IP-CIDR,220.181.174.162/32,CyberGuard,no-resolve'
    - 'IP-CIDR,220.181.174.226/32,CyberGuard,no-resolve'
    - 'IP-CIDR,220.181.174.34/32,CyberGuard,no-resolve'
    - 'DOMAIN,injections.adguard.org,DIRECT'
    - 'DOMAIN,local.adguard.org,DIRECT'
    - 'DOMAIN-SUFFIX,local,DIRECT'
    - 'IP-CIDR,127.0.0.0/8,DIRECT'
    - 'IP-CIDR,172.16.0.0/12,DIRECT'
    - 'IP-CIDR,192.168.0.0/16,DIRECT'
    - 'IP-CIDR,10.0.0.0/8,DIRECT'
    - 'IP-CIDR,17.0.0.0/8,DIRECT'
    - 'IP-CIDR,100.64.0.0/10,DIRECT'
    - 'IP-CIDR,224.0.0.0/4,DIRECT'
    - 'IP-CIDR6,fe80::/10,DIRECT'
    - 'DOMAIN-SUFFIX,cn,DIRECT'
    - 'DOMAIN-KEYWORD,-cn,DIRECT'
    - 'GEOIP,CN,DIRECT'
    - 'MATCH,CyberGuard'
EOF
    
    # 替换占位符为实际节点名
    sed -i "s/NODE_NAME/$node_name/g" "$output_path"
    echo "✅ 配置文件生成成功：$output_path"
    echo "🔹 匹配节点：$node_name"
}

##############################################################################
# 主函数：核心执行流程（仅生成一个默认配置）
##############################################################################
main() {
    echo "=== 开始生成mihomo默认配置 ==="
    
    # 1. 获取本机IP尾数
    local local_ip=$(get_local_ip_suffix)
    if [ -n "$local_ip" ]; then
        echo "🔍 检测到本机IP尾数：$local_ip"
    else
        echo "🔍 未检测到有效IP，将使用默认节点（香港-01）"
    fi
    
    # 2. 匹配节点（IP优先，无匹配用默认）
    local node_info=$(match_node_by_ip "$local_ip")
    local node_name=$(echo "$node_info" | cut -d'|' -f1)
    local node_config=$(echo "$node_info" | cut -d'|' -f2-)
    
    # 3. 生成配置文件
    generate_mihomo_config "$node_name" "$node_config"
    
    echo "=== 配置生成完成 ==="
}

# 执行主函数（入口）
mkdir /data/mihomocfg
sleep 1
main
sleep 10
#/system/bin/mihomo -f /data/mihomocfg/mihomo-ip.yaml -d /data/mihomocfg > /dev/null 2>&1 &
/system/bin/mihomo -f /data/mihomocfg/mihomo-ip.yaml -d /data/mihomocfg   &
