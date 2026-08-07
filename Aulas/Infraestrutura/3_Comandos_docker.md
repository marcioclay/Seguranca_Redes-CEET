# Unidade III — Comandos Fundamentais do Docker

## Objetivos da Unidade

Ao final desta unidade o estudante será capaz de:

- Gerenciar imagens Docker.
- Criar, iniciar e remover containers.
- Monitorar containers em execução.
- Acessar o terminal de um container.
- Criar e administrar redes Docker.
- Utilizar volumes para persistência de dados.
- Limpar recursos não utilizados no ambiente Docker.

---

# 3. Introdução

Após compreender a arquitetura do Docker e realizar sua instalação, o próximo passo é aprender a administrar o ambiente por meio da linha de comando.

O Docker possui dezenas de comandos, porém uma pequena parte deles é suficiente para realizar a maioria das tarefas do dia a dia. Nesta unidade serão apresentados os comandos fundamentais utilizados em laboratórios de Redes de Computadores e Segurança da Informação.

Todos os exemplos foram desenvolvidos para execução no **Ubuntu** utilizando o terminal.

---

# 3.1 Gerenciamento de Imagens

As imagens são modelos utilizados para criar containers. Antes de executar uma aplicação, é necessário possuir a imagem correspondente.

## Procurando imagens

O comando `docker search` pesquisa imagens disponíveis no Docker Hub.

```bash
docker search ubuntu
```

Exemplo de saída:

```
NAME              DESCRIPTION
ubuntu            Ubuntu is a Debian-based Linux...
ubuntu-upstart    Upstart is an event-based replacement...
```

---

## Baixando uma imagem

O comando `docker pull` realiza o download de uma imagem.

```bash
docker pull ubuntu
```

Também é possível baixar uma versão específica:

```bash
docker pull ubuntu:24.04
```

---

## Listando imagens

Para visualizar todas as imagens armazenadas localmente:

```bash
docker images
```

ou

```bash
docker image ls
```

Exemplo:

```
REPOSITORY   TAG      IMAGE ID
ubuntu       latest   xxxxxxxxx
alpine       latest   xxxxxxxxx
```

---

## Inspecionando uma imagem

Exibe informações detalhadas.

```bash
docker image inspect ubuntu
```

São apresentadas informações como:

- arquitetura;
- sistema operacional;
- variáveis de ambiente;
- tamanho;
- camadas da imagem.

---

## Removendo uma imagem

```bash
docker image rm ubuntu
```

Caso existam containers utilizando essa imagem, sua remoção será impedida.

---

# 3.2 Gerenciamento de Containers

Containers são instâncias em execução de uma imagem.

---

## Criando e executando um container

```bash
docker run ubuntu
```

Como o Ubuntu não possui um processo contínuo em primeiro plano, o container será encerrado logo após sua criação.

Para abrir um terminal interativo:

```bash
docker run -it ubuntu bash
```

Opções utilizadas:

| Opção | Função |
|--------|--------|
| `-i` | modo interativo |
| `-t` | cria um terminal |
| `bash` | inicia o shell Bash |

---

## Criando um container sem executá-lo

```bash
docker create ubuntu
```

---

## Iniciando um container existente

```bash
docker start nome_container
```

---

## Parando um container

```bash
docker stop nome_container
```

---

## Reiniciando um container

```bash
docker restart nome_container
```

---

## Pausando um container

```bash
docker pause nome_container
```

---

## Retomando a execução

```bash
docker unpause nome_container
```

---

## Encerrando imediatamente

O comando abaixo força o encerramento.

```bash
docker kill nome_container
```

---

## Removendo um container

```bash
docker rm nome_container
```

Caso esteja em execução:

```bash
docker rm -f nome_container
```

---

# 3.3 Monitoramento

Uma das tarefas mais importantes é acompanhar o estado dos containers.

---

## Containers em execução

```bash
docker ps
```

Exemplo:

```
CONTAINER ID
IMAGE
STATUS
PORTS
NAMES
```

---

## Todos os containers

```bash
docker ps -a
```

Esse comando também exibe containers parados.

---

## Logs

Visualiza a saída da aplicação.

```bash
docker logs nome_container
```

Exibir continuamente:

```bash
docker logs -f nome_container
```

---

## Processos internos

Mostra os processos executados pelo container.

```bash
docker top nome_container
```

---

## Consumo de recursos

Monitoramento em tempo real.

```bash
docker stats
```

São exibidos:

- CPU;
- Memória;
- Rede;
- Disco.

---

## Informações detalhadas

```bash
docker inspect nome_container
```

Exibe informações como:

- endereço IP;
- volumes;
- variáveis de ambiente;
- configuração da rede;
- portas.

---

# 3.4 Acesso ao Container

Em muitos momentos será necessário acessar o terminal interno de um container.

---

## Executando comandos

```bash
docker exec nome_container ls
```

---

## Abrindo um terminal

```bash
docker exec -it nome_container bash
```

Caso utilize Alpine Linux:

```bash
docker exec -it nome_container sh
```

---

## Anexando ao processo principal

```bash
docker attach nome_container
```

Esse comando conecta diretamente ao processo principal do container.

---

## Copiando arquivos

Do computador para o container:

```bash
docker cp arquivo.txt container:/tmp
```

Do container para o computador:

```bash
docker cp container:/tmp/arquivo.txt .
```

---

# 3.5 Redes Docker

Uma das maiores vantagens do Docker é permitir a comunicação entre containers.

---

## Listando redes

```bash
docker network ls
```

Exemplo:

```
bridge
host
none
```

---

## Criando uma rede

```bash
docker network create rede_lab
```

---

## Inspecionando uma rede

```bash
docker network inspect rede_lab
```

São exibidos:

- subnet;
- gateway;
- containers conectados.

---

## Conectando um container

```bash
docker network connect rede_lab container1
```

---

## Desconectando

```bash
docker network disconnect rede_lab container1
```

---

## Removendo uma rede

```bash
docker network rm rede_lab
```

A rede somente poderá ser removida se não houver containers conectados.

---

# 3.6 Volumes

Volumes permitem armazenar dados permanentemente.

---

## Criando um volume

```bash
docker volume create dados_mysql
```

---

## Listando volumes

```bash
docker volume ls
```

---

## Inspecionando

```bash
docker volume inspect dados_mysql
```

Mostra:

- caminho físico;
- driver;
- informações adicionais.

---

## Removendo um volume

```bash
docker volume rm dados_mysql
```

Volumes utilizados por containers não podem ser removidos.

---

# Exemplo utilizando volume

```bash
docker run -d \
--name banco \
-v dados_mysql:/var/lib/mysql \
mysql
```

Nesse exemplo, os dados do banco permanecem armazenados mesmo que o container seja removido.

---

# 3.7 Limpeza do Ambiente

Com o tempo, imagens, containers e volumes deixam de ser utilizados.

O Docker fornece comandos para liberar espaço em disco.

---

## Removendo recursos não utilizados

```bash
docker system prune
```

Confirmação:

```
WARNING!
Are you sure?
```

---

## Removendo imagens não utilizadas

```bash
docker image prune
```

---

## Removendo containers parados

```bash
docker container prune
```

---

## Removendo volumes órfãos

```bash
docker volume prune
```

---

## Removendo redes não utilizadas

```bash
docker network prune
```

---

# Fluxo típico de trabalho

Durante o uso do Docker, normalmente seguimos uma sequência semelhante:

```
Pesquisar imagem

↓

Baixar imagem

↓

Criar container

↓

Executar aplicação

↓

Monitorar

↓

Parar

↓

Remover container

↓

Limpar ambiente
```

---

# Boas Práticas

- Utilize nomes significativos para containers.
- Evite executar containers como usuário root quando possível.
- Utilize volumes para dados importantes.
- Remova containers que não serão mais utilizados.
- Documente seus laboratórios.
- Organize imagens por versão.
- Utilize redes dedicadas para separar serviços.
- Verifique regularmente o consumo de recursos.

---

# Resumo da Unidade

Nesta unidade foram apresentados os principais comandos utilizados na administração do Docker. Foram abordadas operações relacionadas ao gerenciamento de imagens, criação e controle de containers, monitoramento, acesso ao terminal, administração de redes, utilização de volumes e limpeza do ambiente.

O domínio desses comandos permitirá construir laboratórios completos utilizando Docker e servirá como base para a utilização do Containerlab nas próximas unidades.

---

# Exercícios de Fixação

1. Qual comando pesquisa imagens disponíveis no Docker Hub?

2. Qual a diferença entre `docker pull` e `docker run`?

3. Como listar apenas os containers em execução?

4. Qual comando permite visualizar todos os containers, inclusive os parados?

5. Para que serve o comando `docker exec -it`?

6. Qual a diferença entre `docker stop` e `docker kill`?

7. Como criar uma rede Docker chamada **rede_lab**?

8. Qual é a função dos volumes no Docker?

9. Qual comando remove recursos não utilizados do ambiente Docker?

10. Explique a diferença entre uma imagem Docker e um container Docker.

---

# Laboratório Prático

## Atividade 1

- Baixe a imagem do Ubuntu.
- Liste as imagens instaladas.

---

## Atividade 2

- Crie um container Ubuntu.
- Acesse seu terminal.
- Verifique o endereço IP utilizando `ip addr`.

---

## Atividade 3

- Crie uma rede chamada `rede_lab`.
- Conecte dois containers Ubuntu nessa rede.
- Teste a comunicação utilizando `ping`.

---

## Atividade 4

- Crie um volume chamado `dados`.
- Monte esse volume em um container.
- Crie um arquivo dentro do volume.
- Remova o container.
- Crie um novo container utilizando o mesmo volume e verifique se o arquivo permanece disponível.

---

## Atividade 5

- Liste todos os containers.
- Remova os containers parados.
- Remova imagens não utilizadas.
- Execute a limpeza geral do ambiente utilizando `docker system prune`.

---

