From cbd59c0514136158f0ebc91fbf94dfaf44f5ecaf Mon Sep 17 00:00:00 2001
From: Oliver Garcia Albertos <oliverarafo@gmail.com>
Date: Wed, 30 Jan 2013 23:39:18 +0000
Subject: [PATCH] bcmdhd: Hack for allow module to load nvram and firmware
 correctly

---
 drivers/net/wireless/bcmdhd/dhd_linux.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/bcmdhd/dhd_linux.c b/drivers/net/wireless/bcmdhd/dhd_linux.c
index d7e2ae3..0486343 100644
--- a/drivers/net/wireless/bcmdhd/dhd_linux.c
+++ b/drivers/net/wireless/bcmdhd/dhd_linux.c
@@ -365,8 +365,10 @@ static int dhd_device_event(struct notifier_block *this,
 /* Definitions to provide path to the firmware and nvram
  * example nvram_path[MOD_PARAM_PATHLEN]="/projects/wlan/nvram.txt"
  */
-char firmware_path[MOD_PARAM_PATHLEN];
-char nvram_path[MOD_PARAM_PATHLEN];
+
+/* TODO: Remove hack, we must to be allowed to set parameters for module from BoardConfig define */
+char firmware_path[MOD_PARAM_PATHLEN]="/system/etc/wifi/bcmdhd_sta.bin_b2";
+char nvram_path[MOD_PARAM_PATHLEN]="/system/etc/wifi/nvram_net.txt_GPIO4";
 
 /* information string to keep firmware, chio, cheip version info visiable from log */
 char info_string[MOD_PARAM_INFOLEN];
@@ -3342,11 +3344,11 @@ int dhd_do_driver_init(struct net_device *net)
 
 	/* try to download image and nvram to the dongle */
 	if  ((dhd->pub.busstate == DHD_BUS_DOWN) &&
-		(fw_path != NULL) && (fw_path[0] != '\0') &&
-		(nv_path != NULL) && (nv_path[0] != '\0')) {
+		(firmware_path != NULL) && (firmware_path[0] != '\0') &&
+		(nvram_path != NULL) && (nvram_path[0] != '\0')) {
 		/* wake lock moved to dhdsdio_download_firmware */
 		if (!(dhd_bus_download_firmware(dhd->pub.bus, dhd->pub.osh,
-		                                fw_path, nv_path))) {
+		                                firmware_path, nvram_path))) {
 			DHD_ERROR(("%s: dhdsdio_probe_download failed. firmware or nvram path is wrong\n",
 			           __FUNCTION__));
 #ifdef DHDTHREAD
-- 
1.8.1.6

