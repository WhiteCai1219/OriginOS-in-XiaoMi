@echo off
@mode con lines=30 cols=100&color 0F
title "追梦官改ROM线刷工具==RedmiK60=="
set app_description=MIUI版本：V14.0.26.0.TMNCNXM  安卓版本：13.0  设备名称：mondrian  设备型号：RedmiK60
set app_examples=刷机前请务必先阅读ZhuiMemgFlashShow.txt线刷操作教程及注意事项
set cecho=bins\cecho.exe
if exist "bins\PAYLOAD" (
goto PAYHOME
)
if not exist "bins\PAYLOAD" (
goto DTHOME
)
:PAYHOME
cls
set key=""
echo.
echo.
%cecho% 	-{06}RedmiK60 ROM by ZhuiMeng {#} 		           {06}[QQ:542259874]{#}
echo.                       
echo. 
echo         ===================================================================================
echo.
%cecho% 	-{04}%app_examples%{#}
echo.
echo.
%cecho%  	-{02}%app_description%{#}
echo.
echo.
echo         ===================================================================================
echo.
echo.        -[1]-^>^> 一请输入“1”回车
echo.
echo.        -[2]-^>^> 一请输入“1”回车
echo.        
echo.        -[3]-^>^> 请输入“1”回车
echo.
echo.        -[4]-^>^> 退出
echo.
echo         ===================================================================================
echo.
set /p key=-^-^-^-^-^> 请选择操作:
if "%key%"=="1" goto GO_USBFLASH
if "%key%"=="2" goto GO_USBFLASH2
if "%key%"=="3" goto GO_MAGISK
if "%key%"=="4" exit

:GO_USBFLASH
cls
echo.
echo.╔═════════════════════════
echo.║  Origin OS 3.1 for Redmi K60 
echo.║  机型 ：RedmiK60
echo.║  代号 ：mondrian
echo.║  脚本制作  ：酷安@行啊您
echo.║  rom打包 ：行啊您
echo.║  交流群：657066407
echo.╚═════════════════════════
echo.
echo.===请选择是否需要刷入面具
echo.===需要输入1，不需要输入2
echo.===输入完成，点击回车继续
echo.
set /p bootch=------请输入：
echo.
if "%bootch%"=="1" echo.===你选择的是刷入德尔塔面具，开机后若桌面不显示正常的面具图标，请刷完机后在工具首页输入3下载安装或更新下面具apk
if "%bootch%"=="2" echo.===你选择的是不刷入面具，开机后Rom将没有root权限功能
if exist "images\super.zst.img" (
echo.
echo.===正在释放super
echo.
echo.===请耐心等待，耗时较长与你电脑配置有关...
echo.
echo.===请确保硬盘剩余空间大于16G以上，否则将释放super不完整，造成刷机失败
echo.
if not exist images\init_boot.img bins\zstd.exe --rm -d images\super.zst.img -o images\super.img
if exist images\init_boot.img bins\zstd.exe --rm -d images\super.zst.img -o images\super.raw.img
)
if exist "images\super.raw.img" (
    echo.
    echo.===正在将super分区转换成Sparse
    echo.
    echo.===请耐心等待，请确保电脑为64位系统，32位将无法完成此项转换，造成刷机失败
    echo.，
   bins\img2simg.exe images\super.raw.img images\super.img
    del images\super.raw.img
)
if not exist "images\super.img" (
echo.===super释放失败,按任意键退出
pause >nul 2>nul
exit
)
echo.
echo.===super释放转换完成
echo.===请检查images文件夹释放出的super.img文件大小是正常
echo.===正常大小为几个G以上
echo.
echo.===请确认你的手机为:RedmiK60 
echo.===如果机型不对，刷入手机将会黑砖
echo.
echo.===确认无误,请按任意键继续
pause >nul 2>nul
echo.
cls
echo.
echo.
echo.===开始线刷...
echo.
echo.===请耐心等待，刷机过程请勿操作手机...
echo.
echo.
echo.===开始刷入底层文件...
echo.
if exist images\vm-bootsys.img bins\fastboot %* flash vm-bootsys_a images\vm-bootsys.img
if exist images\vm-bootsys.img bins\fastboot %* flash vm-bootsys_b images\vm-bootsys.img
if exist images\dsp.img bins\fastboot %* flash dsp_a images\dsp.img
if exist images\dsp.img bins\fastboot %* flash dsp_b images\dsp.img
if exist images\xbl_config.img bins\fastboot %* flash xbl_config_a images\xbl_config.img
if exist images\xbl_config.img bins\fastboot %* flash xbl_config_b images\xbl_config.img
if exist images\modem.img bins\fastboot %* flash modem_a images\modem.img
if exist images\modem.img bins\fastboot %* flash modem_b images\modem.img
if exist images\vbmeta_system.img bins\fastboot %* flash vbmeta_system_a images\vbmeta_system.img
if exist images\vbmeta_system.img bins\fastboot %* flash vbmeta_system_b images\vbmeta_system.img
if exist images\tz.img bins\fastboot %* flash tz_a images\tz.img
if exist images\tz.img bins\fastboot %* flash tz_b images\tz.img
if exist images\vbmeta.img bins\fastboot %* flash vbmeta_a images\vbmeta.img
if exist images\vbmeta.img bins\fastboot %* flash vbmeta_b images\vbmeta.img
if exist images\bluetooth.img bins\fastboot %* flash bluetooth_a images\bluetooth.img
if exist images\bluetooth.img bins\fastboot %* flash bluetooth_b images\bluetooth.img
if exist images\abl.img bins\fastboot %* flash abl_a images\abl.img
if exist images\abl.img bins\fastboot %* flash abl_b images\abl.img
if exist images\cmnlib.img bins\fastboot %* flash cmnlib_a images\cmnlib.img
if exist images\cmnlib.img bins\fastboot %* flash cmnlib_b images\cmnlib.img
if exist images\cmnlib64.img bins\fastboot %* flash cmnlib64_a images\cmnlib64.img
if exist images\cmnlib64.img bins\fastboot %* flash cmnlib64_b images\cmnlib64.img
if exist images\cpucp.img bins\fastboot %* flash cpucp_a images\cpucp.img
if exist images\cpucp.img bins\fastboot %* flash cpucp_b images\cpucp.img
if exist images\aop_config.img bins\fastboot %* flash aop_config_a images\aop_config.img
if exist images\aop_config.img bins\fastboot %* flash aop_config_b images\aop_config.img
if exist images\uefi.img bins\fastboot %* flash uefi_a images\uefi.img
if exist images\uefi.img bins\fastboot %* flash uefi_b images\uefi.img
if exist images\xbl_ramdump.img bins\fastboot %* flash xbl_ramdump_a images\xbl_ramdump.img
if exist images\xbl_ramdump.img bins\fastboot %* flash xbl_ramdump_b images\xbl_ramdump.img
if exist images\apusys.img bins\fastboot %* flash apusys_a images\apusys.img
if exist images\apusys.img bins\fastboot %* flash apusys_b images\apusys.img
if exist images\audio_dsp.img bins\fastboot %* flash audio_dsp_a images\audio_dsp.img
if exist images\audio_dsp.img bins\fastboot %* flash audio_dsp_b images\audio_dsp.img
if exist images\ccu.img bins\fastboot %* flash ccu_a images\ccu.img
if exist images\ccu.img bins\fastboot %* flash ccu_b images\ccu.img
if exist images\dpm.img bins\fastboot %* flash dpm_a images\dpm.img
if exist images\dpm.img bins\fastboot %* flash dpm_b images\dpm.img
if exist images\gpueb.img bins\fastboot %* flash gpueb_a images\gpueb.img
if exist images\gpueb.img bins\fastboot %* flash gpueb_b images\gpueb.img
if exist images\gz.img bins\fastboot %* flash gz_a images\gz.img
if exist images\gz.img bins\fastboot %* flash gz_b images\gz.img
if exist images\lk.img bins\fastboot %* flash lk_a images\lk.img
if exist images\lk.img bins\fastboot %* flash lk_b images\lk.img
if exist images\mcf_ota.img bins\fastboot %* flash mcf_ota_a images\mcf_ota.img
if exist images\mcf_ota.img bins\fastboot %* flash mcf_ota_b images\mcf_ota.img
if exist images\mcupm.img bins\fastboot %* flash mcupm_a images\mcupm.img
if exist images\mcupm.img bins\fastboot %* flash mcupm_b images\mcupm.img
if exist images\md1img.img bins\fastboot %* flash md1img_a images\md1img.img
if exist images\md1img.img bins\fastboot %* flash md1img_b images\md1img.img
if exist images\mvpu_algo.img bins\fastboot %* flash mvpu_algo_a images\mvpu_algo.img
if exist images\mvpu_algo.img bins\fastboot %* flash mvpu_algo_b images\mvpu_algo.img
if exist images\pi_img.img bins\fastboot %* flash pi_img_a images\pi_img.img
if exist images\pi_img.img bins\fastboot %* flash pi_img_b images\pi_img.img
if exist images\preloader_raw.img bins\fastboot %* flash preloader_a images\preloader_raw.img
if exist images\preloader_raw.img bins\fastboot %* flash preloader_b images\preloader_raw.img
if exist images\preloader_raw.img bins\fastboot %* flash preloader1 images\preloader_raw.img
if exist images\preloader_raw.img bins\fastboot %* flash preloader2 images\preloader_raw.img
if exist images\scp.img bins\fastboot %* flash scp_a images\scp.img
if exist images\scp.img bins\fastboot %* flash scp_b images\scp.img
if exist images\spmfw.img bins\fastboot %* flash spmfw_a images\spmfw.img
if exist images\spmfw.img bins\fastboot %* flash spmfw_b images\spmfw.img
if exist images\sspm.img bins\fastboot %* flash sspm_a images\sspm.img
if exist images\sspm.img bins\fastboot %* flash sspm_b images\sspm.img
if exist images\tee.img bins\fastboot %* flash tee_a images\tee.img
if exist images\tee.img bins\fastboot %* flash tee_b images\tee.img
if exist images\vbmeta_vendor.img bins\fastboot %* flash vbmeta_vendor_a images\vbmeta_vendor.img
if exist images\vbmeta_vendor.img bins\fastboot %* flash vbmeta_vendor_b images\vbmeta_vendor.img
if exist images\vcp.img bins\fastboot %* flash vcp_a images\vcp.img
if exist images\vcp.img bins\fastboot %* flash vcp_b images\vcp.img
if exist images\dtbo.img bins\fastboot %* flash dtbo_a images\dtbo.img
if exist images\dtbo.img bins\fastboot %* flash dtbo_b images\dtbo.img
if exist images\featenabler.img bins\fastboot %* flash featenabler_a images\featenabler.img
if exist images\featenabler.img bins\fastboot %* flash featenabler_b images\featenabler.img
if exist images\vendor_boot.img bins\fastboot %* flash vendor_boot_a images\vendor_boot.img
if exist images\vendor_boot.img bins\fastboot %* flash vendor_boot_b images\vendor_boot.img
if exist images\keymaster.img bins\fastboot %* flash keymaster_a images\keymaster.img
if exist images\keymaster.img bins\fastboot %* flash keymaster_b images\keymaster.img
if exist images\uefisecapp.img bins\fastboot %* flash uefisecapp_a images\uefisecapp.img
if exist images\uefisecapp.img bins\fastboot %* flash uefisecapp_b images\uefisecapp.img
if exist images\qupfw.img bins\fastboot %* flash qupfw_a images\qupfw.img
if exist images\qupfw.img bins\fastboot %* flash qupfw_b images\qupfw.img
if exist images\xbl.img bins\fastboot %* flash xbl_a images\xbl.img
if exist images\xbl.img bins\fastboot %* flash xbl_b images\xbl.img
if exist images\devcfg.img bins\fastboot %* flash devcfg_a images\devcfg.img
if exist images\devcfg.img bins\fastboot %* flash devcfg_b images\devcfg.img
if exist images\hyp.img bins\fastboot %* flash hyp_a images\hyp.img
if exist images\hyp.img bins\fastboot %* flash hyp_b images\hyp.img
if exist images\imagefv.img bins\fastboot %* flash imagefv_a images\imagefv.img
if exist images\imagefv.img bins\fastboot %* flash imagefv_b images\imagefv.img
if exist images\shrm.img bins\fastboot %* flash shrm_a images\shrm.img
if exist images\shrm.img bins\fastboot %* flash shrm_b images\shrm.img
if exist images\aop.img bins\fastboot %* flash aop_a images\aop.img
if exist images\aop.img bins\fastboot %* flash aop_b images\aop.img
if exist images\logo.img bins\fastboot %* flash logo_a images\logo.img
if exist images\logo.img bins\fastboot %* flash logo_b images\logo.img
if exist images\recovery.img bins\fastboot %* flash recovery_a images\recovery.img
if exist images\recovery.img bins\fastboot %* flash recovery_b images\recovery.img
bins\fastboot %* flash cust images\cust.img
if not exist images\init_boot.img (
if "%bootch%"=="1" bins\fastboot %* flash boot_a images\boot.img
if "%bootch%"=="1" bins\fastboot %* flash boot_b images\boot.img
if "%bootch%"=="2" bins\fastboot %* flash boot_a images\miboot.img
if "%bootch%"=="2" bins\fastboot %* flash boot_b images\miboot.img
if not exist images\miboot.img bins\fastboot %* flash boot_a images\boot.img
if not exist images\miboot.img bins\fastboot %* flash boot_b images\boot.img
)
if exist images\init_boot.img (
if "%bootch%"=="1" bins\fastboot %* flash init_boot_a images\init_boot.img
if "%bootch%"=="1" bins\fastboot %* flash init_boot_b images\init_boot.img
if "%bootch%"=="2" bins\fastboot %* flash init_boot_a images\miboot.img
if "%bootch%"=="2" bins\fastboot %* flash init_boot_b images\miboot.img
bins\fastboot %* flash boot_a images\boot.img
bins\fastboot %* flash boot_b images\boot.img
)
cls
echo.
echo.===开始刷入新系统文件super.img...
echo.
echo.===耗时较长请耐心等待，进度与你电脑配置相关...
echo.
echo.===出现Invalid sparse file format at header magic提示，请无视
echo.
bins\fastboot %* flash super images\super.img
echo.
echo.===正在重启a分区...
echo.
echo.===请务必耐心等待，切勿强制关闭工具，强制重启手机...
echo.
bins\fastboot set_active a
bins\fastboot reboot

goto PAYHOME

:GO_USBFLASH2
cls
echo.
echo   ======================================================================
echo.   设备名称：mondrian
echo.   设备型号：RedmiK60
echo.   MIUI版本：V14.0.26.0.TMNCNXM
echo.   安卓版本：13.0
echo.   首次刷入手机系统！
echo   ======================================================================
echo.
echo.===请选择是否需要刷入面具
echo.===需要输入1，不需要输入2
echo.===输入完成，点击回车继续
echo.
set /p bootch=------请输入：
echo.
if "%bootch%"=="1" echo.===你选择的是刷入德尔塔面具，开机后若桌面不显示正常的面具图标，请刷完机后在工具首页输入3下载安装或更新下面具apk
if "%bootch%"=="2" echo.===你选择的是不刷入面具，开机后Rom将没有root权限功能
)
if exist "images\super.zst.img" (
echo.
echo.===正在释放super
echo.
echo.===请耐心等待，耗时较长与你电脑配置有关...
echo.
echo.===请确保硬盘剩余空间大于16G以上，否则将释放super不完整，造成刷机失败
echo.
if not exist images\init_boot.img bins\zstd.exe --rm -d images\super.zst.img -o images\super.img
if exist images\init_boot.img bins\zstd.exe --rm -d images\super.zst.img -o images\super.raw.img
)
if exist "images\super.raw.img" (
    echo.
    echo.===正在将super分区转换成Sparse
    echo.
    echo.===请耐心等待，请确保电脑为64位系统，32位将无法完成此项转换，造成刷机失败
    echo.，
   bins\img2simg.exe images\super.raw.img images\super.img
    del images\super.raw.img
)
if not exist "images\super.img" (
echo.===super释放失败,按任意键退出
pause >nul 2>nul
exit
)
echo.
echo.===释放完成
echo.===请检查images文件夹释放出的super.img文件大小是正常
echo.===正常大小为几个G以上
echo.
echo.===请确认你的手机为:RedmiK60 
echo.===如果机型不对，刷入手机将会黑砖
echo.
echo.===确认无误,请按任意键继续
pause >nul 2>nul
echo.
cls
echo.
echo.===开始线刷...
echo.
echo.===请耐心等待，刷机过程请勿操作手机...
echo.
echo.
echo.===开始刷入底层文件...
echo.
if exist images\vm-bootsys.img bins\fastboot %* flash vm-bootsys_a images\vm-bootsys.img
if exist images\vm-bootsys.img bins\fastboot %* flash vm-bootsys_b images\vm-bootsys.img
if exist images\dsp.img bins\fastboot %* flash dsp_a images\dsp.img
if exist images\dsp.img bins\fastboot %* flash dsp_b images\dsp.img
if exist images\xbl_config.img bins\fastboot %* flash xbl_config_a images\xbl_config.img
if exist images\xbl_config.img bins\fastboot %* flash xbl_config_b images\xbl_config.img
if exist images\modem.img bins\fastboot %* flash modem_a images\modem.img
if exist images\modem.img bins\fastboot %* flash modem_b images\modem.img
if exist images\vbmeta_system.img bins\fastboot %* flash vbmeta_system_a images\vbmeta_system.img
if exist images\vbmeta_system.img bins\fastboot %* flash vbmeta_system_b images\vbmeta_system.img
if exist images\tz.img bins\fastboot %* flash tz_a images\tz.img
if exist images\tz.img bins\fastboot %* flash tz_b images\tz.img
if exist images\vbmeta.img bins\fastboot %* flash vbmeta_a images\vbmeta.img
if exist images\vbmeta.img bins\fastboot %* flash vbmeta_b images\vbmeta.img
if exist images\bluetooth.img bins\fastboot %* flash bluetooth_a images\bluetooth.img
if exist images\bluetooth.img bins\fastboot %* flash bluetooth_b images\bluetooth.img
if exist images\abl.img bins\fastboot %* flash abl_a images\abl.img
if exist images\abl.img bins\fastboot %* flash abl_b images\abl.img
if exist images\cmnlib.img bins\fastboot %* flash cmnlib_a images\cmnlib.img
if exist images\cmnlib.img bins\fastboot %* flash cmnlib_b images\cmnlib.img
if exist images\cmnlib64.img bins\fastboot %* flash cmnlib64_a images\cmnlib64.img
if exist images\cmnlib64.img bins\fastboot %* flash cmnlib64_b images\cmnlib64.img
if exist images\cpucp.img bins\fastboot %* flash cpucp_a images\cpucp.img
if exist images\cpucp.img bins\fastboot %* flash cpucp_b images\cpucp.img
if exist images\aop_config.img bins\fastboot %* flash aop_config_a images\aop_config.img
if exist images\aop_config.img bins\fastboot %* flash aop_config_b images\aop_config.img
if exist images\uefi.img bins\fastboot %* flash uefi_a images\uefi.img
if exist images\uefi.img bins\fastboot %* flash uefi_b images\uefi.img
if exist images\xbl_ramdump.img bins\fastboot %* flash xbl_ramdump_a images\xbl_ramdump.img
if exist images\xbl_ramdump.img bins\fastboot %* flash xbl_ramdump_b images\xbl_ramdump.img
if exist images\apusys.img bins\fastboot %* flash apusys_a images\apusys.img
if exist images\apusys.img bins\fastboot %* flash apusys_b images\apusys.img
if exist images\audio_dsp.img bins\fastboot %* flash audio_dsp_a images\audio_dsp.img
if exist images\audio_dsp.img bins\fastboot %* flash audio_dsp_b images\audio_dsp.img
if exist images\ccu.img bins\fastboot %* flash ccu_a images\ccu.img
if exist images\ccu.img bins\fastboot %* flash ccu_b images\ccu.img
if exist images\dpm.img bins\fastboot %* flash dpm_a images\dpm.img
if exist images\dpm.img bins\fastboot %* flash dpm_b images\dpm.img
if exist images\gpueb.img bins\fastboot %* flash gpueb_a images\gpueb.img
if exist images\gpueb.img bins\fastboot %* flash gpueb_b images\gpueb.img
if exist images\gz.img bins\fastboot %* flash gz_a images\gz.img
if exist images\gz.img bins\fastboot %* flash gz_b images\gz.img
if exist images\lk.img bins\fastboot %* flash lk_a images\lk.img
if exist images\lk.img bins\fastboot %* flash lk_b images\lk.img
if exist images\mcf_ota.img bins\fastboot %* flash mcf_ota_a images\mcf_ota.img
if exist images\mcf_ota.img bins\fastboot %* flash mcf_ota_b images\mcf_ota.img
if exist images\mcupm.img bins\fastboot %* flash mcupm_a images\mcupm.img
if exist images\mcupm.img bins\fastboot %* flash mcupm_b images\mcupm.img
if exist images\md1img.img bins\fastboot %* flash md1img_a images\md1img.img
if exist images\md1img.img bins\fastboot %* flash md1img_b images\md1img.img
if exist images\mvpu_algo.img bins\fastboot %* flash mvpu_algo_a images\mvpu_algo.img
if exist images\mvpu_algo.img bins\fastboot %* flash mvpu_algo_b images\mvpu_algo.img
if exist images\pi_img.img bins\fastboot %* flash pi_img_a images\pi_img.img
if exist images\pi_img.img bins\fastboot %* flash pi_img_b images\pi_img.img
if exist images\preloader_raw.img bins\fastboot %* flash preloader_a images\preloader_raw.img
if exist images\preloader_raw.img bins\fastboot %* flash preloader_b images\preloader_raw.img
if exist images\preloader_raw.img bins\fastboot %* flash preloader1 images\preloader_raw.img
if exist images\preloader_raw.img bins\fastboot %* flash preloader2 images\preloader_raw.img
if exist images\scp.img bins\fastboot %* flash scp_a images\scp.img
if exist images\scp.img bins\fastboot %* flash scp_b images\scp.img
if exist images\spmfw.img bins\fastboot %* flash spmfw_a images\spmfw.img
if exist images\spmfw.img bins\fastboot %* flash spmfw_b images\spmfw.img
if exist images\sspm.img bins\fastboot %* flash sspm_a images\sspm.img
if exist images\sspm.img bins\fastboot %* flash sspm_b images\sspm.img
if exist images\tee.img bins\fastboot %* flash tee_a images\tee.img
if exist images\tee.img bins\fastboot %* flash tee_b images\tee.img
if exist images\vbmeta_vendor.img bins\fastboot %* flash vbmeta_vendor_a images\vbmeta_vendor.img
if exist images\vbmeta_vendor.img bins\fastboot %* flash vbmeta_vendor_b images\vbmeta_vendor.img
if exist images\vcp.img bins\fastboot %* flash vcp_a images\vcp.img
if exist images\vcp.img bins\fastboot %* flash vcp_b images\vcp.img
if exist images\dtbo.img bins\fastboot %* flash dtbo_a images\dtbo.img
if exist images\dtbo.img bins\fastboot %* flash dtbo_b images\dtbo.img
if exist images\featenabler.img bins\fastboot %* flash featenabler_a images\featenabler.img
if exist images\featenabler.img bins\fastboot %* flash featenabler_b images\featenabler.img
if exist images\vendor_boot.img bins\fastboot %* flash vendor_boot_a images\vendor_boot.img
if exist images\vendor_boot.img bins\fastboot %* flash vendor_boot_b images\vendor_boot.img
if exist images\keymaster.img bins\fastboot %* flash keymaster_a images\keymaster.img
if exist images\keymaster.img bins\fastboot %* flash keymaster_b images\keymaster.img
if exist images\uefisecapp.img bins\fastboot %* flash uefisecapp_a images\uefisecapp.img
if exist images\uefisecapp.img bins\fastboot %* flash uefisecapp_b images\uefisecapp.img
if exist images\qupfw.img bins\fastboot %* flash qupfw_a images\qupfw.img
if exist images\qupfw.img bins\fastboot %* flash qupfw_b images\qupfw.img
if exist images\xbl.img bins\fastboot %* flash xbl_a images\xbl.img
if exist images\xbl.img bins\fastboot %* flash xbl_b images\xbl.img
if exist images\devcfg.img bins\fastboot %* flash devcfg_a images\devcfg.img
if exist images\devcfg.img bins\fastboot %* flash devcfg_b images\devcfg.img
if exist images\hyp.img bins\fastboot %* flash hyp_a images\hyp.img
if exist images\hyp.img bins\fastboot %* flash hyp_b images\hyp.img
if exist images\imagefv.img bins\fastboot %* flash imagefv_a images\imagefv.img
if exist images\imagefv.img bins\fastboot %* flash imagefv_b images\imagefv.img
if exist images\shrm.img bins\fastboot %* flash shrm_a images\shrm.img
if exist images\shrm.img bins\fastboot %* flash shrm_b images\shrm.img
if exist images\aop.img bins\fastboot %* flash aop_a images\aop.img
if exist images\aop.img bins\fastboot %* flash aop_b images\aop.img
if exist images\logo.img bins\fastboot %* flash logo_a images\logo.img
if exist images\logo.img bins\fastboot %* flash logo_b images\logo.img
if exist images\recovery.img bins\fastboot %* flash recovery_a images\recovery.img
if exist images\recovery.img bins\fastboot %* flash recovery_b images\recovery.img
bins\fastboot %* flash cust images\cust.img
if not exist images\init_boot.img (
if "%bootch%"=="1" bins\fastboot %* flash boot_a images\boot.img
if "%bootch%"=="1" bins\fastboot %* flash boot_b images\boot.img
if "%bootch%"=="2" bins\fastboot %* flash boot_a images\miboot.img
if "%bootch%"=="2" bins\fastboot %* flash boot_b images\miboot.img、
if not exist images\miboot.img bins\fastboot %* flash boot_a images\boot.img
if not exist images\miboot.img bins\fastboot %* flash boot_b images\boot.img
)
if exist images\init_boot.img (
if "%bootch%"=="1" bins\fastboot %* flash init_boot_a images\init_boot.img
if "%bootch%"=="1" bins\fastboot %* flash init_boot_b images\init_boot.img
if "%bootch%"=="2" bins\fastboot %* flash init_boot_a images\miboot.img
if "%bootch%"=="2" bins\fastboot %* flash init_boot_b images\miboot.img
bins\fastboot %* flash boot_a images\boot.img
bins\fastboot %* flash boot_b images\boot.img
)
cls
echo.
echo.===开始刷入新系统文件super.img...
echo.
echo.===耗时较长请耐心等待，进度与你电脑配置相关...
echo.
echo.===出现Invalid sparse file format at header magic提示，请无视
echo.
bins\fastboot %* flash super images\super.img
echo.
echo.===正在格式化data分区...
echo.
bins\fastboot %* erase metadata
bins\fastboot %* erase userdata
echo.
echo.===正在重启a分区...
echo.
echo.===请务必耐心等待，切勿强制关闭工具，强制重启手机...
echo.
bins\fastboot set_active a
bins\fastboot reboot

goto PAYHOME

:DTHOME
cls
set key=""
echo.
echo.
%cecho% 	-{06}RedmiK60 ROM by ZhuiMeng {#} 		           {06}[QQ:542259874]{#}
echo.                       
echo. 
echo         ===================================================================================
echo.
%cecho% 	-{04}%app_examples%{#}
echo.
echo.
%cecho%  	-{02}%app_description%{#}
echo.
echo         ======================================================================
echo.
echo.        -[1]-^>^> 一键线刷手机(升级)
echo.
echo.        -[2]-^>^> 一键线刷手机(首次)
echo.
echo.        -[3]-^>^> 下载德尔塔面具apk
echo.
echo.        -[4]-^>^> 退出
echo.
echo         ======================================================================
echo.
echo.
set /p key=-^-^-^-^-^> 请选择操作:
if "%key%"=="1" goto GO_USBFLASHDT
if "%key%"=="2" goto GO_USBFLASHDT2
if "%key%"=="3" goto GO_MAGISK
if "%key%"=="4" exit

:GO_USBFLASHDT
cls
echo.
echo   ======================================================================
echo.   设备名称：mondrian
echo.   设备型号：RedmiK60
echo.   MIUI版本：V14.0.26.0.TMNCNXM
echo.   安卓版本：13.0
echo.   升级手机系统刷入!
echo   ======================================================================
echo.
echo.===请选择是否需要刷入面具
echo.===需要输入1，不需要输入2
echo.===输入完成，点击回车继续
echo.
set /p bootch=------请输入：
echo.
if "%bootch%"=="1" echo.===你选择的是刷入德尔塔面具，开机后若桌面不显示正常的面具图标，请刷完机后在工具首页输入3下载安装或更新下面具apk
if "%bootch%"=="2" echo.===你选择的是不刷入面具，开机后Rom将没有root权限功能
if exist "images\super.zst.img" (
echo.
echo.===正在释放super
echo.
echo.===请耐心等待，耗时较长与你电脑配置有关...
echo.
echo.===请确保硬盘剩余空间大于16G以上，否则将适放super不完整，刷机失败
echo.
bins\zstd.exe --rm -d images\super.zst.img -o images\super.img
)
if not exist "images\super.img" (
echo.===super释放失败,按任意键退出
pause >nul 2>nul
exit
)
echo.
echo.===释放完成
echo.===请检查images文件夹释放出的super.img文件大小是正常
echo.===正常大小为8.5G
echo.
echo.===请确认你的手机为:RedmiK60 
echo.===如果机型不对，刷入手机将会黑砖
echo.
echo.===确认无误,请按任意键继续
pause >nul 2>nul
echo.
cls
echo.
echo.===开始线刷...
echo.
echo.===请耐心等待，刷机过程请勿操作手机...
echo.
echo.
echo.===开始刷入底层文件...
echo.
bins\fastboot %* erase boot
if exist images\xbl_config_5.elf bins\fastboot %* flash xbl_config_5 images\xbl_config_5.elf
if exist images\xbl_config_4.elf bins\fastboot %* flash xbl_config_4 images\xbl_config_4.elf
if exist images\xbl_5.elf bins\fastboot %* flash xbl_5 images\xbl_5.elf
if exist images\xbl_4.elf bins\fastboot %* flash xbl_4 images\xbl_4.elf
if exist images\xbl.elf bins\fastboot %* flash xbl images\xbl.elf
if exist images\xbl_config.elf bins\fastboot %* flash xbl_config images\xbl_config.elf
if exist images\recovery.img bins\fastboot %* flash recovery images\recovery.img
bins\fastboot %* flash vbmeta_system images\vbmeta_system.img
bins\fastboot %* flash vbmeta images\vbmeta.img
bins\fastboot %* flash uefisecapp images\uefi_sec.mbn
bins\fastboot %* flash tz images\tz.mbn
bins\fastboot %* flash storsec images\storsec.mbn
bins\fastboot %* flash qupfw images\qupv3fw.elf
bins\fastboot %* flash modem images\NON-HLOS.bin
bins\fastboot %* flash logo images\logo.img
bins\fastboot %* flash keymaster images\km4.mbn
bins\fastboot %* flash hyp images\hyp.mbn
bins\fastboot %* flash featenabler images\featenabler.mbn
bins\fastboot %* flash dtbo images\dtbo.img
bins\fastboot %* flash dsp images\dspso.bin
bins\fastboot %* flash devcfg images\devcfg.mbn
bins\fastboot %* flash cmnlib images\cmnlib.mbn
bins\fastboot %* flash cmnlib64 images\cmnlib64.mbn
bins\fastboot %* flash bluetooth images\BTFM.bin
bins\fastboot %* flash aop images\aop.mbn
bins\fastboot %* flash abl images\abl.elf
bins\fastboot %* flash cust images\cust.img
if "%bootch%"=="1" bins\fastboot %* flash boot images\boot.img
if "%bootch%"=="2" bins\fastboot %* flash boot images\miboot.img
cls
echo.
echo.===开始刷入新系统文件super.img...
echo.
echo.===耗时较长请耐心等待，进度与你电脑配置相关...
echo.
echo.===请无视Invalid sparse file format at header magic提示
echo.
bins\fastboot %* flash super images\super.img
bins\fastboot reboot

goto DTHOME

:GO_USBFLASHDT2
cls
echo.
echo   ======================================================================
echo.   设备名称：mondrian
echo.   设备型号：RedmiK60
echo.   MIUI版本：V14.0.26.0.TMNCNXM
echo.   安卓版本：13.0
echo.   首次刷入手机系统!
echo   ======================================================================
echo.
echo.===请选择是否需要刷入面具
echo.===需要输入1，不需要输入2
echo.===输入完成，点击回车继续
echo.
set /p bootch=------请输入：
echo.
if "%bootch%"=="1" echo.===你选择的是刷入德尔塔面具，开机后若桌面不显示正常的面具图标，请刷完机后在工具首页输入3下载安装或更新下面具apk
if "%bootch%"=="2" echo.===你选择的是不刷入面具，开机后Rom将没有root权限功能
if exist "images\super.zst.img" (
echo.
echo.===正在释放super
echo.
echo.===请耐心等待，耗时较长与你电脑配置有关...
echo.
echo.===请确保硬盘剩余空间大于16G以上，否则将适放super不完整，刷机失败
echo.
bins\zstd.exe --rm -d images\super.zst.img -o images\super.img
)
if not exist "images\super.img" (
echo.===super释放失败,按任意键退出
pause >nul 2>nul
exit
)
echo.
echo.===释放完成
echo.===请检查images文件夹释放出的super.img文件大小是正常
echo.===正常大小为8.5G
echo.
echo.===请确认你的手机为:RedmiK60 
echo.===如果机型不对，刷入手机将会黑砖
echo.
echo.===确认无误,请按任意键继续
pause >nul 2>nul
echo.
cls
echo.
echo.===开始线刷...
echo.
echo.===请耐心等待，刷机过程请勿操作手机...
echo.
echo.
echo.===开始刷入底层文件...
echo.
bins\fastboot %* erase boot
if exist images\xbl_config_5.elf bins\fastboot %* flash xbl_config_5 images\xbl_config_5.elf
if exist images\xbl_config_4.elf bins\fastboot %* flash xbl_config_4 images\xbl_config_4.elf
if exist images\xbl_5.elf bins\fastboot %* flash xbl_5 images\xbl_5.elf
if exist images\xbl_4.elf bins\fastboot %* flash xbl_4 images\xbl_4.elf
if exist images\xbl.elf bins\fastboot %* flash xbl images\xbl.elf
if exist images\xbl_config.elf bins\fastboot %* flash xbl_config images\xbl_config.elf
if exist images\recovery.img bins\fastboot %* flash recovery images\recovery.img
bins\fastboot %* flash vbmeta_system images\vbmeta_system.img
bins\fastboot %* flash vbmeta images\vbmeta.img
bins\fastboot %* flash uefisecapp images\uefi_sec.mbn
bins\fastboot %* flash tz images\tz.mbn
bins\fastboot %* flash storsec images\storsec.mbn
bins\fastboot %* flash qupfw images\qupv3fw.elf
bins\fastboot %* flash modem images\NON-HLOS.bin
bins\fastboot %* flash logo images\logo.img
bins\fastboot %* flash keymaster images\km4.mbn
bins\fastboot %* flash hyp images\hyp.mbn
bins\fastboot %* flash featenabler images\featenabler.mbn
bins\fastboot %* flash dtbo images\dtbo.img
bins\fastboot %* flash dsp images\dspso.bin
bins\fastboot %* flash devcfg images\devcfg.mbn
bins\fastboot %* flash cmnlib images\cmnlib.mbn
bins\fastboot %* flash cmnlib64 images\cmnlib64.mbn
bins\fastboot %* flash bluetooth images\BTFM.bin
bins\fastboot %* flash aop images\aop.mbn
bins\fastboot %* flash abl images\abl.elf
bins\fastboot %* erase super
bins\fastboot %* reboot bootloader
timeout /t 5
bins\fastboot %* flash cust images\cust.img
if "%bootch%"=="1" bins\fastboot %* flash boot images\boot.img
if "%bootch%"=="2" bins\fastboot %* flash boot images\miboot.img
cls
echo.
echo.===开始刷入新系统文件super.img...
echo.
echo.===耗时较长请耐心等待，进度与你电脑配置相关...
echo.
echo.===请无视Invalid sparse file format at header magic提示
echo.
bins\fastboot %* flash super images\super.img
echo.
echo.===正在格式化data分区...
echo.
bins\fastboot %* erase metadata
bins\fastboot %* erase userdata
bins\fastboot reboot

goto DTHOME

:GO_MAGISK
start https://www.123pan.com/s/8zOSVv-6pP4H.html


goto HOME

