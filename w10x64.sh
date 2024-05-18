echo "===================================="
echo "Download windows files"
echo "===================================="
curl -L -o w10x64.img https://bit.ly/akuhnetW10x64
echo "===================================="
echo "Download ngrok"
echo "===================================="
wget https://download1078.mediafire.com/hg36xq97v8lgh-c6qGkn4lDBtETpRYrVEb3K8xUvOzIYSE5rT3vGSMooNJB71gTX4lvB8lCVhbu54F722Ypebn-Z4D8whVz5TQ1HkCgnldq9hlMoJb1cpbQ3vZqxbQ4AhgQeyhBcPdpigN3XhKFNOrLz2MIXe6oPTna2Hhx8pqnmOQE/8k2xje6qqzhlran/ngrok-v3-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-v3-stable-linux-amd64.zip &>/dev/null &
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3389 &>/dev/null &
./ngrok tcp 3389 &>/dev/null &
echo "===================================="
echo Install QEMU
echo "===================================="
apt-get install qemu-kvm
echo "===================================="
echo "Wait"
echo "Starting Windows"
echo "===================================="
echo "===================================="
echo You will wait 10 second after VM has start
qemu-system-x86_64 -hda w10x64.img -m 8G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic  > /dev/null 2>&1
sleep 10
./ngrok tcp 3389
