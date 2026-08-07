# Aula 01 — Infraestrutura de Laboratório com Docker e Containerlab

## Objetivos da Aula

Ao final desta aula o aluno será capaz de:

- Compreender o conceito de virtualização baseada em containers.
- Entender a arquitetura do Docker.
- Instalar e verificar o funcionamento do Docker.
- Compreender o funcionamento do Containerlab.
- Criar laboratórios de redes utilizando containers.
- Executar comandos básicos de gerenciamento.
- Preparar o ambiente para as próximas aulas de Segurança de Redes.

---

# Sumário

## Unidade I — Introdução ao Ambiente de Laboratório

### 1.1 Por que utilizar containers em Redes?

- Evolução dos laboratórios de redes
- Limitações de laboratórios físicos
- Virtualização tradicional vs Containers
- Vantagens para ensino e pesquisa
- Casos de uso em empresas

### 1.2 Conceitos Fundamentais

- O que é um Container
- O que é uma Imagem
- Docker Hub
- Registro de imagens
- Volumes
- Redes Docker
- Persistência de dados

---

# Unidade II — Docker

### 2.1 Arquitetura do Docker

- Docker Engine
- Docker Daemon
- Docker CLI
- Cliente x Servidor
- Ciclo de vida dos containers

### 2.2 Instalação

- Instalação no Ubuntu
- Instalação no Windows (WSL)
- Instalação no Debian

### 2.3 Verificação da instalação

- docker version
- docker info
- docker run hello-world

---

# Unidade III — Comandos Fundamentais do Docker

### 3.1 Gerenciamento de imagens

- docker search
- docker pull
- docker images
- docker image inspect
- docker image rm

### 3.2 Gerenciamento de containers

- docker run
- docker create
- docker start
- docker stop
- docker restart
- docker pause
- docker unpause
- docker kill
- docker rm

### 3.3 Monitoramento

- docker ps
- docker ps -a
- docker logs
- docker top
- docker stats
- docker inspect

### 3.4 Acesso ao container

- docker exec
- docker attach
- docker cp

### 3.5 Redes Docker

- docker network ls
- docker network create
- docker network inspect
- docker network connect
- docker network disconnect
- docker network rm

### 3.6 Volumes

- docker volume create
- docker volume ls
- docker volume inspect
- docker volume rm

### 3.7 Limpeza do ambiente

- docker system prune
- docker image prune
- docker container prune
- docker volume prune
- docker network prune

---

# Unidade IV — Introdução ao Containerlab

### 4.1 O que é o Containerlab

- Conceitos
- Arquitetura
- Funcionamento
- Casos de uso
- Vantagens em laboratórios de redes

### 4.2 Estrutura de um laboratório

- Arquivo YAML
- Nós
- Links
- Endereçamento
- Diretórios

### 4.3 Deploy de laboratório

- containerlab deploy
- containerlab inspect
- containerlab graph
- containerlab destroy

---

# Unidade V — Primeira Topologia

### 5.1 Estrutura do projeto

```
laboratorio/
│
├── lab.clab.yml
├── configs/
├── captures/
└── scripts/
```

### 5.2 Primeiro laboratório

- Dois hosts Linux
- Comunicação entre containers
- Testes com ping
- Testes com traceroute

---

# Unidade VI — Comandos Linux Úteis

### Rede

- ip addr
- ip route
- ip link
- ss
- netstat
- ping
- traceroute
- arp
- hostname

### Diagnóstico

- ps
- top
- htop
- journalctl
- systemctl

### Arquivos

- ls
- cd
- cp
- mv
- rm
- cat
- nano
- vim

---

# Unidade VII — Captura e Análise de Tráfego

- tcpdump
- Wireshark
- Captura em interfaces Docker
- Exportação de arquivos PCAP

---

# Unidade VIII — Boas Práticas

- Organização dos laboratórios
- Versionamento com Git
- Estrutura de diretórios
- Backup das configurações
- Reutilização de topologias

---

# Exercícios Práticos

## Exercício 1

Instalar o Docker.

---

## Exercício 2

Executar o container "hello-world".

---

## Exercício 3

Executar um container Ubuntu.

---

## Exercício 4

Acessar o terminal do container.

---

## Exercício 5

Criar uma rede Docker personalizada.

---

## Exercício 6

Conectar dois containers na mesma rede.

---

## Exercício 7

Criar um laboratório simples utilizando o Containerlab.

---

## Exercício 8

Realizar testes de conectividade utilizando:

- ping
- ip addr
- ip route

---

## Exercício 9

Capturar o tráfego utilizando tcpdump.

---

## Exercício 10

Remover completamente o laboratório e limpar o ambiente Docker.

---

# Preparação para a Aula 02

Na próxima aula serão abordados:

- Arquitetura TCP/IP
- Topologias de redes
- Switches virtuais
- Roteadores Linux
- Construção de laboratórios completos para Segurança de Redes
