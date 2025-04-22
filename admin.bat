@echo off

set "BASE_PATH=F:\xiaozhi\xiaozhi_admin\xiaozhi-esp32-server\main"

REM 启动前端服务
start "管理平台前端" /D "%BASE_PATH%\manager-web" cmd /k "npm run serve"

REM 启动后端服务
start "管理平台后端" /D "%BASE_PATH%\manager-api" cmd /k "mvn spring-boot:run"

REM 等待 8 秒
timeout /t 8 /nobreak

REM 启动 ESP32 服务器
start "ESP32 服务器" cmd /k "
cd /d %BASE_PATH%\xiaozhi-server
call D:\anaconda\Scripts\activate.bat xiaozhi-esp32-server
python app.py
"

pause