VER=1.0.4
REL=1

all:
	# Download
	wget -c https://releases.hashicorp.com/nomad/${VER}/nomad_${VER}_linux_amd64.zip
	# Prepare workdir
	mkdir -p ./src
	cd src; unzip ../nomad_${VER}_linux_amd64.zip
	# Build
	fpm \
		-s dir -t deb \
		-n 'nomad-bin' -v ${VER}-${REL} \
		--after-install=postinstall.sh \
		./src/nomad=/usr/bin/nomad \
		nomad-client.service=/usr/lib/systemd/system/nomad-client.service \
		nomad-server.service=/usr/lib/systemd/system/nomad-server.service \
		nomad-client.hcl=/etc/nomad/client.hcl \
		nomad-server.hcl=/etc/nomad/server.hcl

clean:
	rm -rf ./src
	rm -f *.deb

mrproper: clean
	rm -f nomad_*_linux_amd64.zip

install:
	dpkg -i nomad-bin_${VER}-${REL}_amd64.deb
