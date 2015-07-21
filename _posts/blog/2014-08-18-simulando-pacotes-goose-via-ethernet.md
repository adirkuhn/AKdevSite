---
layout: post
title: "Simulando pacotes GOOSE via ethernet"
excerpt: "Simulando pacotes GOOSE via ethernet"
categories: blog
tags: [goose, ethernet, iec61850]
comments: true
share: true
---

No desenvolvimento de um programa para comunicar dentro dos padrões da norma IEC 61850 uma das dificuldades que passei for para simular os dados de uma mensagem GOOSE.

Sabendo que por padrão toda a comunicação é feita direta na camada de data link, segundo modelo OSI, precisava de um programa que pudesse mandar pacotes ethernet.

Ai que encontrei o <a href="http://packeth.sourceforge.net/packeth/Home.html">packETH</a>, um gerador de pacotes ethernet. Com ele bastava encontrar algum exemplo de pacote GOOSE para envio.

Na wiki do wireshark é disponibilizado um arquivo PCAP com alguns exemplos de captura. <a href="http://wiki.wireshark.org/SampleCaptures?action=AttachFile&amp;do=view&amp;target=GOOSE.pcap.gz">Arquivo.</a>


Enviando Mensagem GOOSE
![Enviando Mensagem GOOSE](/assets/images/servindo-mensagem-goose.png)

Recebendo Mensagem GOOSE
![Recebendo Mensagem GOOSE](/assets/images/lendo-mensagem-goose.png)