@echo off
@mode con lines=30 cols=100&color 0F
title "׷�ιٸ�ROM��ˢ����==RedmiK60=="
set app_description=MIUI�汾��V14.0.26.0.TMNCNXM  ��׿�汾��13.0  �豸���ƣ�mondrian  �豸�ͺţ�RedmiK60
set app_examples=ˢ��ǰ��������Ķ�ZhuiMemgFlashShow.txt��ˢ�����̳̼�ע������
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
echo.        -[1]-^>^> һ�����롰1���س�
echo.
echo.        -[2]-^>^> һ�����롰1���س�
echo.        
echo.        -[3]-^>^> �����롰1���س�
echo.
echo.        -[4]-^>^> �˳�
echo.
echo         ===================================================================================
echo.
set /p key=-^-^-^-^-^> ��ѡ�����:
if "%key%"=="1" goto GO_USBFLASH
if "%key%"=="2" goto GO_USBFLASH2
if "%key%"=="3" goto GO_MAGISK
if "%key%"=="4" exit

:GO_USBFLASH
cls
echo.
echo.�X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo.�U  Origin OS 3.1 for Redmi K60 
echo.�U  ���� ��RedmiK60
echo.�U  ���� ��mondrian
echo.�U  �ű�����  ���ᰲ@�а���
echo.�U  rom��� ���а���
echo.�U  ����Ⱥ��657066407
echo.�^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo.
echo.===��ѡ���Ƿ���Ҫˢ�����
echo.===��Ҫ����1������Ҫ����2
echo.===������ɣ�����س�����
echo.
set /p bootch=------�����룺
echo.
if "%bootch%"=="1" echo.===��ѡ�����ˢ��¶�����ߣ������������治��ʾ���������ͼ�꣬��ˢ������ڹ�����ҳ����3���ذ�װ����������apk
if "%bootch%"=="2" echo.===��ѡ����ǲ�ˢ����ߣ�������Rom��û��rootȨ�޹���
if exist "images\super.zst.img" (
echo.
echo.===�����ͷ�super
echo.
echo.===�����ĵȴ�����ʱ�ϳ�������������й�...
echo.
echo.===��ȷ��Ӳ��ʣ��ռ����16G���ϣ������ͷ�super�����������ˢ��ʧ��
echo.
if not exist images\init_boot.img bins\zstd.exe --rm -d images\super.zst.img -o images\super.img
if exist images\init_boot.img bins\zstd.exe --rm -d images\super.zst.img -o images\super.raw.img
)
if exist "images\super.raw.img" (
    echo.
    echo.===���ڽ�super����ת����Sparse
    echo.
    echo.===�����ĵȴ�����ȷ������Ϊ64λϵͳ��32λ���޷���ɴ���ת�������ˢ��ʧ��
    echo.��
   bins\img2simg.exe images\super.raw.img images\super.img
    del images\super.raw.img
)
if not exist "images\super.img" (
echo.===super�ͷ�ʧ��,��������˳�
pause >nul 2>nul
exit
)
echo.
echo.===super�ͷ�ת�����
echo.===����images�ļ����ͷų���super.img�ļ���С������
echo.===������СΪ����G����
echo.
echo.===��ȷ������ֻ�Ϊ:RedmiK60 
echo.===������Ͳ��ԣ�ˢ���ֻ������ש
echo.
echo.===ȷ������,�밴���������
pause >nul 2>nul
echo.
cls
echo.
echo.
echo.===��ʼ��ˢ...
echo.
echo.===�����ĵȴ���ˢ��������������ֻ�...
echo.
echo.
echo.===��ʼˢ��ײ��ļ�...
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
echo.===��ʼˢ����ϵͳ�ļ�super.img...
echo.
echo.===��ʱ�ϳ������ĵȴ���������������������...
echo.
echo.===����Invalid sparse file format at header magic��ʾ��������
echo.
bins\fastboot %* flash super images\super.img
echo.
echo.===��������a����...
echo.
echo.===��������ĵȴ�������ǿ�ƹرչ��ߣ�ǿ�������ֻ�...
echo.
bins\fastboot set_active a
bins\fastboot reboot

goto PAYHOME

:GO_USBFLASH2
cls
echo.
echo   ======================================================================
echo.   �豸���ƣ�mondrian
echo.   �豸�ͺţ�RedmiK60
echo.   MIUI�汾��V14.0.26.0.TMNCNXM
echo.   ��׿�汾��13.0
echo.   �״�ˢ���ֻ�ϵͳ��
echo   ======================================================================
echo.
echo.===��ѡ���Ƿ���Ҫˢ�����
echo.===��Ҫ����1������Ҫ����2
echo.===������ɣ�����س�����
echo.
set /p bootch=------�����룺
echo.
if "%bootch%"=="1" echo.===��ѡ�����ˢ��¶�����ߣ������������治��ʾ���������ͼ�꣬��ˢ������ڹ�����ҳ����3���ذ�װ����������apk
if "%bootch%"=="2" echo.===��ѡ����ǲ�ˢ����ߣ�������Rom��û��rootȨ�޹���
)
if exist "images\super.zst.img" (
echo.
echo.===�����ͷ�super
echo.
echo.===�����ĵȴ�����ʱ�ϳ�������������й�...
echo.
echo.===��ȷ��Ӳ��ʣ��ռ����16G���ϣ������ͷ�super�����������ˢ��ʧ��
echo.
if not exist images\init_boot.img bins\zstd.exe --rm -d images\super.zst.img -o images\super.img
if exist images\init_boot.img bins\zstd.exe --rm -d images\super.zst.img -o images\super.raw.img
)
if exist "images\super.raw.img" (
    echo.
    echo.===���ڽ�super����ת����Sparse
    echo.
    echo.===�����ĵȴ�����ȷ������Ϊ64λϵͳ��32λ���޷���ɴ���ת�������ˢ��ʧ��
    echo.��
   bins\img2simg.exe images\super.raw.img images\super.img
    del images\super.raw.img
)
if not exist "images\super.img" (
echo.===super�ͷ�ʧ��,��������˳�
pause >nul 2>nul
exit
)
echo.
echo.===�ͷ����
echo.===����images�ļ����ͷų���super.img�ļ���С������
echo.===������СΪ����G����
echo.
echo.===��ȷ������ֻ�Ϊ:RedmiK60 
echo.===������Ͳ��ԣ�ˢ���ֻ������ש
echo.
echo.===ȷ������,�밴���������
pause >nul 2>nul
echo.
cls
echo.
echo.===��ʼ��ˢ...
echo.
echo.===�����ĵȴ���ˢ��������������ֻ�...
echo.
echo.
echo.===��ʼˢ��ײ��ļ�...
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
if "%bootch%"=="2" bins\fastboot %* flash boot_b images\miboot.img��
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
echo.===��ʼˢ����ϵͳ�ļ�super.img...
echo.
echo.===��ʱ�ϳ������ĵȴ���������������������...
echo.
echo.===����Invalid sparse file format at header magic��ʾ��������
echo.
bins\fastboot %* flash super images\super.img
echo.
echo.===���ڸ�ʽ��data����...
echo.
bins\fastboot %* erase metadata
bins\fastboot %* erase userdata
echo.
echo.===��������a����...
echo.
echo.===��������ĵȴ�������ǿ�ƹرչ��ߣ�ǿ�������ֻ�...
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
echo.        -[1]-^>^> һ����ˢ�ֻ�(����)
echo.
echo.        -[2]-^>^> һ����ˢ�ֻ�(�״�)
echo.
echo.        -[3]-^>^> ���ص¶������apk
echo.
echo.        -[4]-^>^> �˳�
echo.
echo         ======================================================================
echo.
echo.
set /p key=-^-^-^-^-^> ��ѡ�����:
if "%key%"=="1" goto GO_USBFLASHDT
if "%key%"=="2" goto GO_USBFLASHDT2
if "%key%"=="3" goto GO_MAGISK
if "%key%"=="4" exit

:GO_USBFLASHDT
cls
echo.
echo   ======================================================================
echo.   �豸���ƣ�mondrian
echo.   �豸�ͺţ�RedmiK60
echo.   MIUI�汾��V14.0.26.0.TMNCNXM
echo.   ��׿�汾��13.0
echo.   �����ֻ�ϵͳˢ��!
echo   ======================================================================
echo.
echo.===��ѡ���Ƿ���Ҫˢ�����
echo.===��Ҫ����1������Ҫ����2
echo.===������ɣ�����س�����
echo.
set /p bootch=------�����룺
echo.
if "%bootch%"=="1" echo.===��ѡ�����ˢ��¶�����ߣ������������治��ʾ���������ͼ�꣬��ˢ������ڹ�����ҳ����3���ذ�װ����������apk
if "%bootch%"=="2" echo.===��ѡ����ǲ�ˢ����ߣ�������Rom��û��rootȨ�޹���
if exist "images\super.zst.img" (
echo.
echo.===�����ͷ�super
echo.
echo.===�����ĵȴ�����ʱ�ϳ�������������й�...
echo.
echo.===��ȷ��Ӳ��ʣ��ռ����16G���ϣ������ʷ�super��������ˢ��ʧ��
echo.
bins\zstd.exe --rm -d images\super.zst.img -o images\super.img
)
if not exist "images\super.img" (
echo.===super�ͷ�ʧ��,��������˳�
pause >nul 2>nul
exit
)
echo.
echo.===�ͷ����
echo.===����images�ļ����ͷų���super.img�ļ���С������
echo.===������СΪ8.5G
echo.
echo.===��ȷ������ֻ�Ϊ:RedmiK60 
echo.===������Ͳ��ԣ�ˢ���ֻ������ש
echo.
echo.===ȷ������,�밴���������
pause >nul 2>nul
echo.
cls
echo.
echo.===��ʼ��ˢ...
echo.
echo.===�����ĵȴ���ˢ��������������ֻ�...
echo.
echo.
echo.===��ʼˢ��ײ��ļ�...
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
echo.===��ʼˢ����ϵͳ�ļ�super.img...
echo.
echo.===��ʱ�ϳ������ĵȴ���������������������...
echo.
echo.===������Invalid sparse file format at header magic��ʾ
echo.
bins\fastboot %* flash super images\super.img
bins\fastboot reboot

goto DTHOME

:GO_USBFLASHDT2
cls
echo.
echo   ======================================================================
echo.   �豸���ƣ�mondrian
echo.   �豸�ͺţ�RedmiK60
echo.   MIUI�汾��V14.0.26.0.TMNCNXM
echo.   ��׿�汾��13.0
echo.   �״�ˢ���ֻ�ϵͳ!
echo   ======================================================================
echo.
echo.===��ѡ���Ƿ���Ҫˢ�����
echo.===��Ҫ����1������Ҫ����2
echo.===������ɣ�����س�����
echo.
set /p bootch=------�����룺
echo.
if "%bootch%"=="1" echo.===��ѡ�����ˢ��¶�����ߣ������������治��ʾ���������ͼ�꣬��ˢ������ڹ�����ҳ����3���ذ�װ����������apk
if "%bootch%"=="2" echo.===��ѡ����ǲ�ˢ����ߣ�������Rom��û��rootȨ�޹���
if exist "images\super.zst.img" (
echo.
echo.===�����ͷ�super
echo.
echo.===�����ĵȴ�����ʱ�ϳ�������������й�...
echo.
echo.===��ȷ��Ӳ��ʣ��ռ����16G���ϣ������ʷ�super��������ˢ��ʧ��
echo.
bins\zstd.exe --rm -d images\super.zst.img -o images\super.img
)
if not exist "images\super.img" (
echo.===super�ͷ�ʧ��,��������˳�
pause >nul 2>nul
exit
)
echo.
echo.===�ͷ����
echo.===����images�ļ����ͷų���super.img�ļ���С������
echo.===������СΪ8.5G
echo.
echo.===��ȷ������ֻ�Ϊ:RedmiK60 
echo.===������Ͳ��ԣ�ˢ���ֻ������ש
echo.
echo.===ȷ������,�밴���������
pause >nul 2>nul
echo.
cls
echo.
echo.===��ʼ��ˢ...
echo.
echo.===�����ĵȴ���ˢ��������������ֻ�...
echo.
echo.
echo.===��ʼˢ��ײ��ļ�...
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
echo.===��ʼˢ����ϵͳ�ļ�super.img...
echo.
echo.===��ʱ�ϳ������ĵȴ���������������������...
echo.
echo.===������Invalid sparse file format at header magic��ʾ
echo.
bins\fastboot %* flash super images\super.img
echo.
echo.===���ڸ�ʽ��data����...
echo.
bins\fastboot %* erase metadata
bins\fastboot %* erase userdata
bins\fastboot reboot

goto DTHOME

:GO_MAGISK
start https://www.123pan.com/s/8zOSVv-6pP4H.html


goto HOME

