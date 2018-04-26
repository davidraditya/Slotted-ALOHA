% Tugas Kelas Teknologi Nirkabel
% @author David Raditya K - 1506690372
% @version 16.03.2018

clear;close all;clc;
prS = 0;
n = 1000; % banyak percobaan yang diinginkan
for jumlahUser = 1:20
	for peluangTx = 1:20 % setiap pengiriman yang sukses akan menambah 1 persen
		jumlahSukses=0;
		jumlahTx = 0;
		for perc = 1:n
			hasilRandom = randi(100, 1, jumlahUser); % proses merandom
			paketDiTx = sum(hasilRandom <= peluangTx); % proses kalkulasi untuk peluang pengiriman sukses
			if paketDiTx == 1 % pengiriman sukses terjadi ketika ini bernilai 1
				jumlahSukses = jumlahSukses + 1;
			end
			jumlahTx = jumlahTx + paketDiTx;
		end
		prS(jumlahUser, peluangTx) = jumlahSukses/jumlahTx;
    end
end
surf(prS)
xlabel('Jumlah Pengguna')
ylabel('Peluang untuk Tx')
zlabel('Peluang Paket Sukses Terkirim')
title('Grafik Simulasi Slotted ALOHA')