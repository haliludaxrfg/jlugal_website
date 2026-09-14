神必吉林大学旮旯给木群 
先到小群接受政审()
__1101934015__

引用：

bgm:忍 - 秋黴雨 （星空的记忆）
背景:pid:96769924
人像1:pid:126639082
人像2:pid:142719804
人像3:pid:122295004
视频1:BV1yo7L6cETS

相片库维护
-----------

相片文件放在 `photos/gallery1`、`photos/gallery2`、`photos/gallery3` 中，分别对应三个模块。
增删或改名图片后，在项目目录运行 `./refresh-galleries.ps1`，脚本会自动扫描三个目录并更新 `gallery-data.js`，不需要手动修改图片清单。
脚本只会读取 `.jpg`、`.jpeg`、`.png`、`.webp`、`.gif` 文件；相册标题仍可在脚本顶部的 `$galleryTitles` 中修改。

