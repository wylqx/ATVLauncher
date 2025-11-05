#!/system/bin/sh

# 定义monkey测试的事件数量变量（可在此处统一修改）
EVENT_COUNT=10000


# 启动Google Play商店主界面
am start -n com.android.vending/com.google.android.finsky.activities.MainActivity && sleep 10
input keyevent KEYCODE_ENTER  && sleep 10

# 安装并测试 com.tv.leanbacklauncher.demo
echo "Install com.tv.leanbacklauncher.demo"
am start -a android.intent.action.VIEW -d "market://details?id=com.tv.leanbacklauncher.demo" && sleep 60
input keyevent KEYCODE_DPAD_UP && sleep 1
input keyevent KEYCODE_DPAD_UP && sleep 1
input keyevent KEYCODE_DPAD_DOWN && sleep 1
input keyevent KEYCODE_DPAD_LEFT && sleep 1
input keyevent KEYCODE_ENTER  && sleep 120
input keyevent KEYCODE_BACK  && sleep 2
input keyevent KEYCODE_BACK  && sleep 2
# 引用事件数量变量
monkey -p com.tv.leanbacklauncher.demo --throttle 1000 $EVENT_COUNT

# 安装并测试 com.tv.leanbacklauncher
echo "Install com.tv.leanbacklauncher"
am start -a android.intent.action.VIEW -d "market://details?id=com.tv.leanbacklauncher" && sleep 60
input keyevent KEYCODE_DPAD_UP && sleep 1
input keyevent KEYCODE_DPAD_UP && sleep 1
input keyevent KEYCODE_DPAD_DOWN && sleep 1
input keyevent KEYCODE_DPAD_LEFT && sleep 1
input keyevent KEYCODE_ENTER  && sleep 120
input keyevent KEYCODE_BACK  && sleep 2
input keyevent KEYCODE_BACK  && sleep 2
# 引用事件数量变量
monkey -p com.tv.leanbacklauncher --throttle 1000 $EVENT_COUNT

# 安装并测试 com.tv.painting.demo
echo "Install com.tv.painting.demo"
am start -a android.intent.action.VIEW -d "market://details?id=com.tv.painting.demo" && sleep 60
input keyevent KEYCODE_DPAD_UP && sleep 1
input keyevent KEYCODE_DPAD_UP && sleep 1
input keyevent KEYCODE_DPAD_DOWN && sleep 1
input keyevent KEYCODE_DPAD_LEFT && sleep 1
input keyevent KEYCODE_ENTER  && sleep 120
# 引用事件数量变量
monkey -p com.tv.painting.demo --throttle 1000 $EVENT_COUNT

# 安装并测试 com.tv.painting
echo "Install com.tv.painting"
am start -a android.intent.action.VIEW -d "market://details?id=com.tv.painting" && sleep 60
input keyevent KEYCODE_DPAD_UP && sleep 1
input keyevent KEYCODE_DPAD_UP && sleep 1
input keyevent KEYCODE_DPAD_DOWN && sleep 1
input keyevent KEYCODE_DPAD_LEFT && sleep 1
input keyevent KEYCODE_ENTER  && sleep 120
# 引用事件数量变量
monkey -p com.tv.painting --throttle 1000 $EVENT_COUNT

echo "本轮测试完成，等待进入下一轮..."
sleep 5  # 两轮循环间隔时间