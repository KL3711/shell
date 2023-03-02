YUM_SOURCE_DIR="/etc/yum.repos.d"
YUM_SOURCE_DIR_BAK="$YUM_SOURCE_DIR/yumbak"
mkdir -p $YUM_SOURCE_DIR_BAK
if [ -f $YUM_SOURCE_DIR ];then
  echo "$YUM_SOURCE_DIR exist"
  mv $YUM_SOURCE_DIR/* $YUM_SOURCE_DIR_BAK
fi
# 解析操作系统类型
OS_RELEASE=`cat /etc/os-release`
if [[ $OS_RELEASE =~ "CentOS-8" ]];then
  echo "CentOS-8"
  wget -O $YUM_SOURCE_DIR/CentOS-Linux-BaseOS.repo http://mirrors.aliyun.com/repo/Centos-8.repo
fi

yum clean all
yum makecache

