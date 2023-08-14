#!/bin/bash
echo ""
echo -e "Bypass MDM for MacOS 14"
echo ""
echo -e "Bypass on Recovery"
if [ -d "/Volumes/Macintosh HD - Data" ]; then
re	diskutil rename "Macintosh HD - Data" "Data"
fi
echo -e "Tạo người dùng mới"
echo -e "Nhấn Enter để chuyển bước tiếp theo, có thể không điền sẽ tự động nhận giá trị mặc định"
echo -e "Nhập tên người dùng (Mặc định: Macbook), có thể có dấu cách"
read realName
realName="${realName:=Macbook}"
echo -e "Nhận username VIẾT LIỀN KHÔNG DẤU  (Mặc định: macbook)"
read username
username="${username:=macbook}"
echo -e "Nhập mật khẩu (mặc định: 4 dấu cách)"
read passw
passw="${passw:=    }"
dscl_path='/Volumes/Data/private/var/db/dslocal/nodes/Default' 
echo -e "Đang tạo user"
# Create user
dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username"
dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" UserShell "/bin/zsh"
dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" RealName "$realName"
dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" RealName "$realName"
dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" UniqueID "501"
dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" PrimaryGroupID "20"
mkdir "/Volumes/Data/Users/$username"
dscl -f "$dscl_path" localhost -create "/Local/Default/Users/$username" NFSHomeDirectory "/Users/$username"
dscl -f "$dscl_path" localhost -passwd "/Local/Default/Users/$username" "$passw"
dscl -f "$dscl_path" localhost -append "/Local/Default/Groups/admin" GroupMembership $username
echo "0.0.0.0 deviceenrollment.apple.com" >>/Volumes/Macintosh\ HD/etc/hosts
echo "0.0.0.0 mdmenrollment.apple.com" >>/Volumes/Macintosh\ HD/etc/hosts
echo "0.0.0.0 iprofiles.apple.com" >>/Volumes/Macintosh\ HD/etc/hosts
echo -e "Chặn host thành công"
# echo "Remove config profile"
touch /Volumes/Data/private/var/db/.AppleSetupDone
rm -rf /Volumes/Macintosh\ HD/var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord
rm -rf /Volumes/Macintosh\ HD/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound
touch /Volumes/Macintosh\ HD/var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled
touch /Volumes/Macintosh\ HD/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordNotFound
echo -e "Remove config profile thành công"
echo "----------------------"
