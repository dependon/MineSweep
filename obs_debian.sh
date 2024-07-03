git clone --depth=1 https://gitee.com/liuminghang/MineSweep.git
tar -czvf com.github.minesweep_1.2.0.orig.tar.gz ./MineSweep
cd MineSweep/
tar -czvf ../com.github.minesweep_1.2.0.debian.tar.gz ./debian
cd ..
md5sum com.github.minesweep_1.2.0.orig.tar.gz
md5sum com.github.minesweep_1.2.0.debian.tar.gz
ls -l
