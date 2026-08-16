#bin/sh

# cjpm build
cjpm update
cjpm build

# get_arch=`arch`
# if [[ $get_arch =~ "x86_64" ]];then
#     echo "this is x86_64"
# elif [[ $get_arch =~ "aarch64" ]];then
#     echo "this is arm64"
# fi