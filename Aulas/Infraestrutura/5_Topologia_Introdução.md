# Unidade V — Primeira Topologia com Containerlab

## Objetivos da Unidade

Ao final desta unidade o estudante será capaz de:

- Compreender a estrutura de uma topologia de rede no Containerlab.
- Criar um laboratório contendo dois hosts Linux.
- Realizar o deploy de uma topologia.
- Configurar endereços IP manualmente.
- Testar a conectividade entre dispositivos.
- Capturar e analisar o tráfego da rede.
- Destruir o laboratório de forma segura.

---

# 5. Introdução

Nas unidades anteriores foram apresentados o Docker e o Containerlab. Agora chegou o momento de construir o primeiro laboratório de redes.

Nesta atividade será criada uma topologia simples composta por dois computadores Linux conectados diretamente por um enlace virtual. Embora seja uma estrutura pequena, ela servirá como base para laboratórios mais complexos que envolverão roteadores, switches, servidores, firewalls e dispositivos IoT.

Ao final desta unidade o estudante terá executado todas as etapas necessárias para criar, utilizar e remover uma topologia de rede utilizando o Containerlab.

---

# 5.1 A Primeira Topologia

A topologia será composta por dois hosts Linux conectados diretamente.

```
+-----------+             +-----------+
|   PC-01   |-------------|   PC-02   |
+-----------+             +-----------+
```

Cada computador será representado por um container Docker criado automaticamente pelo Containerlab.

---

# Estrutura do Projeto

Crie um diretório para armazenar os arquivos do laboratório.

```
primeira-topologia/

├── lab.clab.yml
├── configs/
├── captures/
├── logs/
└── scripts/
```

Cada pasta possui uma finalidade específica.

| Diretório | Finalidade |
|------------|------------|
| lab.clab.yml | Arquivo principal da topologia |
| configs | Configurações dos dispositivos |
| captures | Arquivos PCAP |
| logs | Arquivos de log |
| scripts | Scripts auxiliares |

---

# Criando o Arquivo YAML

Dentro do diretório do laboratório, crie o arquivo:

```
lab.clab.yml
```

Conteúdo:

```yaml
name: primeira-topologia

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

Esse arquivo descreve toda a infraestrutura.

---

# Entendendo o Arquivo

## Nome da Topologia

```yaml
name: primeira-topologia
```

Define o nome do laboratório.

---

## Nós

```yaml
nodes:
```

Representam os equipamentos da rede.

Neste exemplo existem dois dispositivos.

```
pc1

pc2
```

Cada um utiliza a imagem Linux Alpine.

---

## Links

```yaml
links:
```

Representam os cabos de rede.

```
pc1:eth1

↓

pc2:eth1
```

Cada equipamento receberá automaticamente uma interface chamada **eth1**, utilizada para comunicação entre os dois hosts.

---

# Criando a Topologia

Execute:

```bash
sudo containerlab deploy -t lab.clab.yml
```

Durante a execução o Containerlab irá:

- criar os containers;
- criar os enlaces;
- conectar as interfaces;
- iniciar os dispositivos.

Ao final será apresentada uma tabela semelhante a:

```
Name

primeira-topologia-pc1

primeira-topologia-pc2
```

---

# Verificando os Containers

Liste os containers em execução.

```bash
docker ps
```

Resultado esperado:

```
CONTAINER ID

IMAGE

STATUS

NAMES

primeira-topologia-pc1

primeira-topologia-pc2
```

---

# Acessando um Host

Entre no primeiro computador.

```bash
docker exec -it primeira-topologia-pc1 sh
```

Será aberto o terminal do Linux Alpine.

---

# Verificando as Interfaces

Dentro do container execute:

```bash
ip addr
```

Resultado esperado:

```
lo

eth0

eth1
```

A interface **eth1** representa o cabo conectado ao segundo computador.

---

# Configurando Endereços IP

O Containerlab cria o enlace, porém o endereçamento será configurado manualmente.

## PC-01

```bash
ip addr add 192.168.10.1/24 dev eth1
```

Ativando a interface:

```bash
ip link set eth1 up
```

---

## PC-02

Abra outro terminal.

```bash
docker exec -it primeira-topologia-pc2 sh
```

Configure:

```bash
ip addr add 192.168.10.2/24 dev eth1
```

```bash
ip link set eth1 up
```

---

# Verificando a Configuração

Em ambos os hosts:

```bash
ip addr
```

ou

```bash
ip address show eth1
```

Verifique se os endereços IP foram atribuídos corretamente.

---

# Testando Conectividade

No PC-01:

```bash
ping 192.168.10.2
```

Resultado esperado:

```
64 bytes from 192.168.10.2

icmp_seq=1

ttl=64

time=0.2 ms
```

No PC-02:

```bash
ping 192.168.10.1
```

Se houver resposta, a comunicação está funcionando corretamente.

---

# Analisando a Tabela de Rotas

Execute:

```bash
ip route
```

Como existe apenas uma rede, será exibida uma rota diretamente conectada.

---

# Capturando Pacotes

Abra um terminal no PC-01.

Execute:

```bash
tcpdump -i eth1
```

Em outro terminal, envie pacotes ICMP.

```bash
ping 192.168.10.2
```

Observe no `tcpdump` os pacotes sendo capturados em tempo real.

Esse procedimento será utilizado em diversas atividades da disciplina para analisar protocolos e ataques.

---

# Copiando Arquivos para o Container

Crie um arquivo no computador hospedeiro.

```bash
echo "Segurança de Redes" > aula.txt
```

Copie para o container.

```bash
docker cp aula.txt primeira-topologia-pc1:/root
```

Verifique:

```bash
ls /root
```

---

# Copiando Arquivos do Container

Dentro do container:

```bash
echo "Teste Containerlab" > teste.txt
```

No computador hospedeiro:

```bash
docker cp primeira-topologia-pc1:/teste.txt .
```

---

# Inspecionando a Topologia

Execute:

```bash
containerlab inspect
```

São apresentadas informações como:

- nome do laboratório;
- dispositivos;
- estado;
- endereços IP;
- imagem utilizada.

---

# Gerando o Diagrama

Execute:

```bash
containerlab graph
```

O Containerlab gera automaticamente um diagrama da topologia.

---

# Removendo a Topologia

Quando o laboratório não for mais necessário:

```bash
sudo containerlab destroy -t lab.clab.yml
```

Todos os containers e enlaces serão removidos.

---

# Fluxo Completo

```
Criar diretório

↓

Criar YAML

↓

Deploy

↓

Verificar containers

↓

Configurar IP

↓

Testar Ping

↓

Capturar tráfego

↓

Inspecionar laboratório

↓

Remover laboratório
```

---

# Boas Práticas

- Organize um diretório para cada laboratório.
- Utilize nomes significativos para os dispositivos.
- Versione o arquivo YAML utilizando Git.
- Salve capturas de tráfego na pasta `captures`.
- Faça backup das configurações.
- Remova laboratórios que não estejam sendo utilizados.
- Documente alterações realizadas durante os experimentos.

---

# Resumo da Unidade

Nesta unidade foi construída a primeira topologia utilizando o Containerlab. Foram criados dois hosts Linux conectados por um enlace virtual, configurados endereços IP, realizados testes de conectividade e capturado o tráfego de rede.

Esses procedimentos representam a base para os laboratórios que serão desenvolvidos ao longo da disciplina, envolvendo dispositivos de rede, servidores, firewalls e cenários de segurança.

---

# Exercícios de Fixação

1. Qual é a função do arquivo `lab.clab.yml`?

2. O que representa a seção `nodes` em uma topologia?

3. Qual é a finalidade da seção `links`?

4. Qual comando cria um laboratório utilizando o Containerlab?

5. Qual comando lista os containers em execução?

6. Como acessar o terminal de um host Linux criado pelo Containerlab?

7. Qual comando configura um endereço IP em uma interface de rede?

8. Qual comando exibe as interfaces de rede de um host Linux?

9. Qual ferramenta pode ser utilizada para capturar pacotes em um container?

10. Qual comando remove completamente uma topologia criada pelo Containerlab?

---

# Laboratório Prático

## Atividade 1

Crie o diretório `primeira-topologia` e organize a estrutura de pastas.

---

## Atividade 2

Crie o arquivo `lab.clab.yml` contendo dois hosts Linux conectados.

---

## Atividade 3

Realize o deploy da topologia.

---

## Atividade 4

Verifique os containers utilizando `docker ps`.

---

## Atividade 5

Acesse ambos os hosts e configure os endereços IP nas interfaces `eth1`.

---

## Atividade 6

Teste a conectividade utilizando o comando `ping`.

---

## Atividade 7

Utilize `tcpdump` para capturar os pacotes ICMP durante o teste de conectividade.

---

## Atividade 8

Inspecione o laboratório utilizando `containerlab inspect`.

---

## Atividade 9

Gere o diagrama da topologia com `containerlab graph`.

---

## Atividade 10

Remova completamente o laboratório utilizando `containerlab destroy`.

---

**Próxima Unidade:** Construção de Topologias Avançadas — criação de laboratórios com switches Linux, roteadores, servidores e segmentação de redes.
