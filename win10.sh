#! /bin/bash
echo ===============================
echo Chào mừng tới bộ cài Windows 10 trên Centos7
echo ===============================
echo "Ảo hoá KVM, QEMU, Libvirt."
echo ===============================
rm /var/lib/libvirt/images/win.img &>/dev/null &
rm /bin/rinnevps &>/dev/null &
clear
echo ===============================
echo Đang tải ảo hoá KVM...
echo ===============================
sudo yum -y install wget qemu-kvm qemu-system-x86 libvirt virt-install bridge-utils &>/dev/null
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
echo ===============================
echo Đang tải file Windows
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1e9b2Cqe7TniXtO1kd9ladPWSeb5Ue8a2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1e9b2Cqe7TniXtO1kd9ladPWSeb5Ue8a2" -O /var/lib/libvirt/images/win.img && rm -rf /tmp/cookies.txt
clear
echo ===============================
echo Phiên bản Windows:
echo Windows 10 Pro SuperLite with Cisco Devnet Sandbox Setup
echo ===============================
echo Đang bật VPS...
echo ===============================
echo Username: 
echo RinneVPS
echo Password:
echo Rinne@001
echo ===============================
echo IP VNC VIEWER: 10.10.20.10:0
echo IP REMOTE DESKTOP: 10.10.20.10:3388
echo ===============================
echo Nhấn ctrl và c để thoát
echo ===============================
echo Để bật lại vps khi tab này tắt, hãy nhập lệnh "rinnevps" để tự bật lại
echo ===============================
sudo echo "qemu-system-x86_64 -vga cirrus -m 4G -cpu host -enable-kvm -boot order=d -hda /var/lib/libvirt/images/win.img -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -net user,hostfwd=tcp::3388-:3389 -net nic -smp cores=8 &>/dev/null" >> /bin/rinnevps
sudo chmod +x /bin/rinnevps
sudo qemu-system-x86_64 -vga cirrus -m 4G -cpu host -enable-kvm -boot order=d -hda /var/lib/libvirt/images/win.img -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -net user,hostfwd=tcp::3388-:3389 -net nic -smp cores=8 &>/dev/null
