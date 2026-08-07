# Unidade II — Docker — Arquitetura, instalação e primeiros comandos.

## Objetivos da Unidade

Ao final desta unidade o estudante será capaz de:

- Compreender a arquitetura do Docker.
- Entender como ocorre a comunicação entre o cliente e o servidor Docker.
- Conhecer os principais componentes do Docker Engine.
- Instalar corretamente o Docker no Ubuntu.
- Verificar se a instalação foi realizada com sucesso.
- Executar o primeiro container.

---

# 2. Introdução

O **Docker** é atualmente uma das plataformas mais utilizadas para desenvolvimento, implantação e gerenciamento de aplicações em containers.

Sua popularidade deve-se à facilidade de criar ambientes isolados, portáveis e reproduzíveis, permitindo que uma aplicação funcione da mesma forma em diferentes computadores e servidores.

Na área de **Redes de Computadores** e **Segurança da Informação**, o Docker tornou-se uma ferramenta essencial para construção de laboratórios, simulação de ataques, implantação de serviços de rede e criação de ambientes de testes.

Nesta unidade serão apresentados a arquitetura do Docker, seus principais componentes e o procedimento de instalação no Ubuntu.

---

# 2.1 Arquitetura do Docker

O Docker é composto por diversos componentes que trabalham em conjunto para criar, executar e gerenciar containers.

Sua arquitetura segue um modelo **Cliente-Servidor**, no qual o usuário envia comandos para um serviço responsável por controlar todo o ambiente.

A figura abaixo representa essa arquitetura.

```
                Usuário
                   │
            Docker CLI
                   │
         Comunicação via API
                   │
           Docker Daemon
                   │
        Docker Engine (Runtime)
                   │
     ┌──────────┬──────────┬──────────┐
     │          │          │
 Container   Container   Container
```

---

## Docker Engine

O **Docker Engine** é o núcleo da plataforma Docker.

Ele é responsável por fornecer toda a infraestrutura necessária para criação e execução dos containers.

Entre suas funções estão:

- gerenciamento de imagens;
- criação de containers;
- gerenciamento de redes;
- gerenciamento de volumes;
- controle do ciclo de vida dos containers.

Na prática, quando executamos um comando como:

```bash
docker run ubuntu
```

é o Docker Engine que realiza todas as operações necessárias para iniciar o container.

---

## Docker Daemon

O **Docker Daemon**, também conhecido como **dockerd**, é um serviço executado em segundo plano no sistema operacional.

Sua função é receber solicitações do Docker CLI e controlar todos os recursos do Docker.

O daemon é responsável por:

- criar containers;
- remover containers;
- baixar imagens;
- gerenciar volumes;
- criar redes;
- monitorar containers em execução.

No Ubuntu, o daemon funciona como um serviço do **systemd**.

Podemos verificar seu status com:

```bash
sudo systemctl status docker
```

Para iniciar o serviço:

```bash
sudo systemctl start docker
```

Para habilitar sua inicialização automática:

```bash
sudo systemctl enable docker
```

---

## Docker CLI

O **Docker CLI (Command Line Interface)** é a interface utilizada pelo usuário.

Sempre que digitamos um comando iniciado por **docker**, estamos utilizando o CLI.

Exemplos:

```bash
docker images
```

```bash
docker ps
```

```bash
docker run ubuntu
```

```bash
docker stop container1
```

O CLI apenas envia comandos ao Docker Daemon.

Todo o processamento é realizado pelo servidor Docker.

---

## Modelo Cliente x Servidor

O Docker utiliza uma arquitetura cliente-servidor.

O fluxo de funcionamento ocorre da seguinte forma:

1. O usuário executa um comando no terminal.

2. O Docker CLI envia esse comando ao Docker Daemon.

3. O Docker Daemon interpreta a solicitação.

4. O Docker Engine realiza a operação.

5. O resultado é enviado ao usuário.

Fluxo simplificado:

```
Usuário

↓

Docker CLI

↓

Docker Daemon

↓

Docker Engine

↓

Container
```

Essa arquitetura permite inclusive controlar servidores Docker remotos utilizando APIs.

---

## Ciclo de vida dos containers

Um container passa por diferentes estados durante sua existência.

```
Imagem

↓

Criado

↓

Executando

↓

Pausado

↓

Parado

↓

Removido
```

Os principais estados são:

### Criado

O container existe, mas ainda não está executando.

---

### Executando

O container encontra-se ativo.

Nesse estado sua aplicação está funcionando normalmente.

---

### Pausado

Todos os processos do container ficam temporariamente suspensos.

---

### Parado

O container deixa de executar sua aplicação, mas ainda existe no sistema.

Pode ser iniciado novamente.

---

### Removido

O container é apagado.

Caso não exista persistência por meio de volumes, seus dados internos serão perdidos.

---

# 2.2 Instalação do Docker no Ubuntu

Nesta disciplina será utilizada a versão mais recente do Docker para Ubuntu.

Antes da instalação, recomenda-se atualizar o sistema.

## Atualizando o sistema

```bash
sudo apt update
```

```bash
sudo apt upgrade -y
```

---

## Instalando dependências

```bash
sudo apt install -y \
ca-certificates \
curl \
gnupg \
lsb-release
```

---

## Adicionando a chave oficial do Docker

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

---

## Adicionando o repositório oficial

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

---

## Atualizando os repositórios

```bash
sudo apt update
```

---

## Instalando o Docker

```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

---

## Iniciando o serviço

```bash
sudo systemctl start docker
```

---

## Habilitando a inicialização automática

```bash
sudo systemctl enable docker
```

---

## Verificando o serviço

```bash
sudo systemctl status docker
```

Caso apareça:

```
Active: active (running)
```

o Docker está funcionando corretamente.

---

## Executando Docker sem sudo (opcional)

Adicionar o usuário ao grupo Docker:

```bash
sudo usermod -aG docker $USER
```

Aplicar as permissões:

```bash
newgrp docker
```

Após esse procedimento será possível utilizar comandos Docker sem o comando **sudo**.

---

# 2.3 Verificação da instalação

Após concluir a instalação, alguns comandos podem ser utilizados para confirmar o funcionamento do ambiente.

---

## docker version

Mostra a versão instalada do cliente e do servidor Docker.

```bash
docker version
```

Exemplo de saída:

```
Client:
 Version: 28.x

Server:
 Engine:
  Version: 28.x
```

---

## docker info

Exibe informações detalhadas sobre o ambiente Docker.

```bash
docker info
```

Entre as informações exibidas estão:

- número de containers;
- número de imagens;
- driver de armazenamento;
- redes disponíveis;
- versão do kernel;
- arquitetura da máquina;
- memória disponível.

---

## docker run hello-world

O comando abaixo realiza diversas operações automaticamente.

```bash
docker run hello-world
```

Durante sua execução o Docker:

1. Procura a imagem localmente.
2. Caso não exista, realiza o download.
3. Cria um container.
4. Executa o programa.
5. Exibe uma mensagem de sucesso.
6. Finaliza o container.

Saída esperada:

```
Hello from Docker!

This message shows that your installation appears to be working correctly.
```

Esse é considerado o primeiro teste oficial de uma instalação Docker.

---

# Resumo da Unidade

Nesta unidade foi apresentada a arquitetura do Docker, seus principais componentes e o funcionamento da comunicação entre o Docker CLI e o Docker Daemon.

Também foi realizada a instalação completa do Docker no Ubuntu, incluindo a configuração do repositório oficial, instalação dos pacotes, inicialização do serviço e verificação do ambiente.

Ao final da unidade, o estudante executou seu primeiro container utilizando a imagem **hello-world**, validando que a plataforma está pronta para uso.

Na próxima unidade serão apresentados os principais comandos para gerenciamento de imagens, containers, redes e volumes.

---

# Exercícios de Fixação

1. Explique a função do Docker Engine.

2. Qual é a responsabilidade do Docker Daemon?

3. Qual componente recebe os comandos digitados pelo usuário?

4. Descreva o modelo Cliente-Servidor utilizado pelo Docker.

5. Quais são os principais estados do ciclo de vida de um container?

6. Qual comando exibe a versão do Docker instalada?

7. Qual comando apresenta informações detalhadas do ambiente Docker?

8. O que acontece quando o comando `docker run hello-world` é executado pela primeira vez?

9. Qual é a função do serviço `dockerd`?

10. Explique por que o Docker é uma ferramenta importante para laboratórios de Redes de Computadores e Segurança da Informação.

---

**Próxima Unidade:** Comandos Fundamentais do Docker — gerenciamento de imagens, containers, redes e volumes.
