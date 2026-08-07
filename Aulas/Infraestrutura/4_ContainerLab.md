# Unidade IV — Introdução ao Containerlab

## Objetivos da Unidade

Ao final desta unidade o estudante será capaz de:

- Compreender o propósito do Containerlab.
- Instalar e verificar o funcionamento do Containerlab.
- Entender a estrutura de um laboratório.
- Criar topologias de redes utilizando arquivos YAML.
- Realizar o deploy, inspeção e remoção de laboratórios.
- Preparar ambientes para as aulas práticas de Redes de Computadores e Segurança da Informação.

---

# 4. Introdução

Nas unidades anteriores aprendemos a utilizar o Docker para criar e administrar containers. Entretanto, quando desejamos construir uma infraestrutura composta por diversos dispositivos interligados, criar manualmente cada container e conectá-los por meio de redes Docker torna-se uma tarefa trabalhosa.

O **Containerlab** foi desenvolvido para simplificar esse processo. Ele permite definir toda a topologia de uma rede em um único arquivo de configuração e criar automaticamente todos os dispositivos e enlaces necessários.

Dessa forma, é possível montar laboratórios completos de redes em poucos segundos, facilitando atividades de ensino, pesquisa, certificações profissionais e testes de infraestrutura.

---

# 4.1 O que é o Containerlab?

O **Containerlab** é uma ferramenta de orquestração de laboratórios de redes baseada em containers Docker.

Seu principal objetivo é automatizar a criação de topologias compostas por:

- Hosts Linux;
- Roteadores virtuais;
- Switches virtuais;
- Firewalls;
- Servidores;
- Appliances de fabricantes;
- Dispositivos IoT.

Ao invés de criar cada container individualmente, toda a infraestrutura é descrita em um único arquivo YAML.

---

## Como funciona?

O Containerlab utiliza o Docker como mecanismo de virtualização.

O fluxo básico é:

```
Arquivo YAML

↓

Containerlab

↓

Docker

↓

Containers

↓

Topologia de Rede
```

O usuário apenas descreve a topologia e o Containerlab realiza automaticamente:

- criação dos containers;
- criação dos enlaces;
- configuração das interfaces;
- organização do laboratório.

---

## Principais vantagens

- Automatização da criação da infraestrutura;
- Facilidade de reprodução dos laboratórios;
- Baixo consumo de recursos;
- Compatibilidade com Docker;
- Suporte a diversos sistemas de rede;
- Facilidade para integração com Wireshark e tcpdump;
- Excelente ferramenta para ensino e pesquisa.

---

## Casos de uso

O Containerlab é utilizado em diversas situações.

### Ensino

- Laboratórios de Redes.
- Segurança de Redes.
- Sistemas Operacionais.
- IoT.

### Pesquisa

- Testes de protocolos.
- Simulação de ataques.
- Desenvolvimento de ferramentas.
- Avaliação de desempenho.

### Empresas

- Testes antes da implantação.
- Validação de configurações.
- Automação de infraestrutura.
- Ambientes DevOps.

---

# 4.2 Instalação do Containerlab

Nesta disciplina será utilizada a instalação oficial para Ubuntu.

---

## Baixando o instalador

```bash
bash -c "$(curl -sL https://get.containerlab.dev)"
```

---

## Verificando a instalação

```bash
containerlab version
```

Saída esperada:

```
containerlab version 0.xx.x
```

---

## Verificando dependências

O Docker deve estar em execução.

```bash
docker version
```

Verifique também:

```bash
docker ps
```

Caso ambos funcionem corretamente, o ambiente está pronto.

---

# 4.3 Estrutura de um Laboratório

Cada laboratório normalmente é organizado em um diretório próprio.

Exemplo:

```
laboratorio/

├── lab.clab.yml
├── configs/
├── scripts/
├── captures/
├── logs/
└── backups/
```

---

## Descrição dos diretórios

### lab.clab.yml

Arquivo principal contendo toda a topologia.

---

### configs

Arquivos de configuração dos dispositivos.

---

### scripts

Scripts utilizados para automatizar tarefas.

---

### captures

Capturas de tráfego (.pcap).

---

### logs

Arquivos de log dos dispositivos.

---

### backups

Cópias das configurações.

---

# O arquivo YAML

O Containerlab utiliza arquivos no formato YAML.

Exemplo mínimo:

```yaml
name: primeiro-lab

topology:
  nodes:

    pc1:
      kind: linux
      image: alpine:latest

    pc2:
      kind: linux
      image: alpine:latest

  links:
    - endpoints:
      - pc1:eth1
      - pc2:eth1
```

Nesse exemplo são criados:

- dois hosts Linux;
- um enlace entre eles.

---

# Estrutura do arquivo

## Nome do laboratório

```yaml
name: primeiro-lab
```

Esse nome identifica toda a infraestrutura.

---

## Nós

```yaml
nodes:
```

Define todos os dispositivos.

Cada nó possui:

- nome;
- tipo;
- imagem.

Exemplo:

```yaml
pc1:
  kind: linux
  image: alpine
```

---

## Links

```yaml
links:
```

Representam os cabos de rede.

Exemplo:

```yaml
- endpoints:
  - pc1:eth1
  - pc2:eth1
```

---

# Tipos de dispositivos

Alguns exemplos de dispositivos suportados:

| Tipo | Utilização |
|------|------------|
| linux | Host Linux |
| ceos | Arista EOS |
| vr-sros | Nokia SR Linux |
| crpd | Juniper |
| sonic | SONiC |
| openwrt | OpenWrt |
| alpine | Linux Alpine |

Durante esta disciplina utilizaremos principalmente dispositivos Linux.

---

# 4.4 Comandos Fundamentais do Containerlab

## Criando o laboratório

```bash
sudo containerlab deploy -t lab.clab.yml
```

O Containerlab realiza automaticamente:

- criação dos containers;
- criação das redes;
- conexão dos dispositivos;
- inicialização da topologia.

---

## Inspecionando o laboratório

```bash
containerlab inspect
```

Exemplo:

```
Name
Kind
State
IPv4
```

---

## Exibindo a topologia

```bash
containerlab graph
```

Esse comando gera um diagrama da infraestrutura.

---

## Listando laboratórios

```bash
containerlab inspect --all
```

---

## Removendo o laboratório

```bash
sudo containerlab destroy -t lab.clab.yml
```

Todos os containers e enlaces serão removidos.

---

# Primeiro Laboratório

Considere a topologia abaixo.

```
+---------+        +---------+
|  PC-01  |--------|  PC-02  |
+---------+        +---------+
```

Arquivo:

```yaml
name: primeiro-lab

topology:

  nodes:

    pc1:
      kind: linux
      image: alpine

    pc2:
      kind: linux
      image: alpine

  links:

    - endpoints:
      - pc1:eth1
      - pc2:eth1
```

---

## Criando o laboratório

```bash
sudo containerlab deploy -t lab.clab.yml
```

---

## Verificando os containers

```bash
docker ps
```

Saída esperada:

```
primeiro-lab-pc1
primeiro-lab-pc2
```

---

## Acessando um dispositivo

```bash
docker exec -it primeiro-lab-pc1 sh
```

---

## Verificando interfaces

```bash
ip addr
```

---

## Testando conectividade

Após configurar endereços IP, utilize:

```bash
ping
```

ou

```bash
ping <endereço_IP_do_outro_host>
```

---

## Removendo o laboratório

```bash
sudo containerlab destroy -t lab.clab.yml
```

---

# Boas Práticas

- Utilize um diretório para cada laboratório.
- Nomeie corretamente os dispositivos.
- Versione os arquivos YAML utilizando Git.
- Mantenha arquivos de configuração separados.
- Utilize comentários no YAML.
- Faça backup das configurações.
- Remova laboratórios que não estejam sendo utilizados.

---

# Resumo da Unidade

Nesta unidade foi apresentado o Containerlab, uma ferramenta utilizada para automatizar a criação de laboratórios de redes baseados em containers Docker.

Foram estudados o processo de instalação, a estrutura dos laboratórios, a organização dos diretórios, a criação de topologias utilizando arquivos YAML e os principais comandos para criação, inspeção e remoção de laboratórios.

Esses conhecimentos servirão como base para a construção de cenários mais complexos envolvendo roteadores, switches, firewalls, servidores e dispositivos IoT ao longo da disciplina.

---

# Exercícios de Fixação

1. Qual é a finalidade do Containerlab?

2. Qual tecnologia é utilizada pelo Containerlab para executar os dispositivos?

3. Qual é a função do arquivo `lab.clab.yml`?

4. Explique a diferença entre **nodes** e **links** em um arquivo YAML.

5. Qual comando cria uma topologia no Containerlab?

6. Qual comando exibe os laboratórios existentes?

7. Qual comando remove um laboratório?

8. O que representa a seção `endpoints` em um arquivo YAML?

9. Quais são as vantagens do uso do Containerlab em laboratórios de Redes de Computadores?

10. Explique por que o Containerlab é uma ferramenta importante para ensino, pesquisa e testes em infraestrutura de redes.

---

# Laboratório Prático

## Atividade 1

Instale o Containerlab e verifique sua versão.

---

## Atividade 2

Crie um diretório chamado `primeiro-lab`.

---

## Atividade 3

Crie o arquivo `lab.clab.yml` contendo dois hosts Linux conectados entre si.

---

## Atividade 4

Realize o deploy do laboratório.

---

## Atividade 5

Liste os containers criados utilizando `docker ps`.

---

## Atividade 6

Acesse um dos hosts utilizando `docker exec`.

---

## Atividade 7

Configure endereços IP nas interfaces `eth1` dos dois hosts e teste a conectividade com o comando `ping`.

---

## Atividade 8

Inspecione o laboratório utilizando `containerlab inspect`.

---

## Atividade 9

Gere o diagrama da topologia utilizando `containerlab graph`.

---

## Atividade 10

Remova completamente o laboratório utilizando `containerlab destroy`.

---

