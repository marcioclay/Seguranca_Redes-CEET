# Unidade I — Introdução ao Ambiente de Laboratório

## Objetivos da Unidade

Ao final desta unidade o estudante será capaz de:

- Compreender a evolução dos laboratórios de redes.
- Identificar as limitações de laboratórios físicos.
- Diferenciar máquinas virtuais e containers.
- Entender os conceitos fundamentais do Docker.
- Compreender como imagens, containers, volumes e redes funcionam.
- Reconhecer aplicações reais de containers em empresas.

---

# 1. Introdução

Durante muitos anos, laboratórios de Redes de Computadores e Segurança da Informação eram montados utilizando equipamentos físicos, como switches, roteadores, servidores e computadores. Embora essa abordagem ainda seja utilizada em ambientes profissionais, ela apresenta diversas limitações para instituições de ensino e pesquisa.

Com o avanço da virtualização e, posteriormente, da tecnologia de containers, tornou-se possível criar ambientes completos de redes utilizando apenas um computador, permitindo que alunos e profissionais simulem infraestruturas complexas com baixo custo.

Nesta disciplina utilizaremos principalmente **Docker** e **Containerlab**, duas ferramentas amplamente utilizadas para construção de laboratórios virtuais de redes.

---

# 1.1 Por que utilizar containers em Redes?

## Evolução dos laboratórios de redes

Os primeiros laboratórios de redes eram compostos exclusivamente por equipamentos físicos.

Um laboratório básico normalmente possuía:

- Computadores;
- Switches;
- Roteadores;
- Cabos de rede;
- Access Points;
- Servidores.

Esse modelo permite contato direto com o hardware, porém apresenta diversas limitações quando o objetivo é criar ambientes complexos ou realizar experimentos frequentes.

Com o crescimento da computação em nuvem e da virtualização, começaram a surgir soluções baseadas em máquinas virtuais e, posteriormente, em containers, tornando os laboratórios muito mais flexíveis.

---

## Limitações dos laboratórios físicos

Apesar de extremamente importantes para a formação profissional, laboratórios físicos apresentam alguns desafios.

### Alto custo

Equipamentos de rede possuem elevado valor de aquisição e manutenção.

Exemplo:

- Switch gerenciável;
- Roteador corporativo;
- Firewall;
- Servidores.

Além do investimento inicial, há custos relacionados à atualização de equipamentos e substituição de componentes.

---

### Espaço físico

Laboratórios físicos exigem:

- Bancadas;
- Rack;
- Energia elétrica;
- Cabeamento;
- Climatização.

Nem todas as instituições possuem infraestrutura suficiente para expandir esses ambientes.

---

### Escalabilidade

Criar um laboratório com dezenas de dispositivos físicos pode ser inviável financeiramente.

Imagine montar uma rede contendo:

- 20 servidores;
- 15 roteadores;
- 30 switches;
- 100 hosts.

O custo seria extremamente elevado.

---

### Reconfiguração

Modificar um laboratório físico normalmente envolve:

- Troca de cabos;
- Alteração de configurações;
- Reinicialização de equipamentos;
- Reorganização física.

Esse processo consome tempo e dificulta a realização de múltiplos experimentos durante uma aula.

---

## Virtualização tradicional vs Containers

Antes dos containers, a principal tecnologia utilizada para virtualização eram as **Máquinas Virtuais (Virtual Machines - VM)**.

### Máquina Virtual

Uma máquina virtual executa um sistema operacional completo.

Cada VM possui:

- Kernel próprio;
- Sistema operacional próprio;
- Drivers;
- Aplicações.

Exemplo:

```
Hardware
    │
Hypervisor
    │
├── Ubuntu
├── Windows Server
└── Debian
```

Cada máquina virtual consome memória, armazenamento e processamento de forma independente.

---

### Containers

Os containers compartilham o kernel do sistema operacional hospedeiro.

Cada container executa apenas os processos necessários para sua aplicação.

```
Hardware
    │
Sistema Operacional
    │
Docker Engine
    │
├── Container Web
├── Container Banco
├── Container DNS
└── Container Firewall
```

Como não executam um sistema operacional completo, os containers são muito mais leves.

---

## Comparação entre Máquinas Virtuais e Containers

| Característica | Máquina Virtual | Container |
|----------------|-----------------|-----------|
| Sistema operacional próprio | Sim | Não |
| Inicialização | Lenta | Muito rápida |
| Consumo de memória | Alto | Baixo |
| Compartilha Kernel | Não | Sim |
| Portabilidade | Média | Alta |
| Escalabilidade | Média | Muito alta |

---

## Vantagens para ensino e pesquisa

A utilização de containers revolucionou os laboratórios acadêmicos.

Entre as principais vantagens estão:

### Baixo custo

Um único computador pode executar dezenas de dispositivos virtuais.

---

### Rapidez

Criar um laboratório completo leva apenas alguns segundos.

---

### Reprodutibilidade

Todos os alunos podem utilizar exatamente o mesmo ambiente.

Isso reduz problemas relacionados a diferenças entre computadores.

---

### Facilidade de recuperação

Caso algum experimento apresente erro, basta remover os containers e recriá-los.

Não é necessário reinstalar sistemas operacionais.

---

### Escalabilidade

É possível aumentar ou reduzir o número de dispositivos de forma simples.

Por exemplo:

- adicionar novos roteadores;
- criar novos servidores;
- inserir sensores IoT;
- incluir firewalls;
- criar redes completas.

---

### Segurança

Os experimentos permanecem isolados do sistema operacional principal.

Isso permite executar ataques controlados sem comprometer o computador hospedeiro.

---

## Casos de uso em empresas

Containers deixaram de ser apenas uma tecnologia utilizada por desenvolvedores.

Atualmente são empregados em diversas áreas da Tecnologia da Informação.

Exemplos:

- Computação em nuvem;
- Data Centers;
- Ambientes DevOps;
- Integração Contínua (CI/CD);
- Microsserviços;
- Segurança ofensiva;
- Segurança defensiva;
- Laboratórios de treinamento;
- Simulações de redes;
- Plataformas IoT.

Empresas como Google, Netflix, Amazon, Microsoft, IBM, Red Hat e Oracle utilizam containers em larga escala para hospedar aplicações e automatizar seus ambientes.

Na área de Redes de Computadores, containers permitem simular roteadores, switches, servidores DNS, DHCP, firewalls, proxies e diversos outros serviços sem necessidade de equipamentos físicos.

---

# 1.2 Conceitos Fundamentais

Antes de utilizar o Docker é necessário compreender alguns conceitos básicos.

---

## O que é um Container?

Um **container** é um ambiente isolado que executa uma aplicação juntamente com todas as suas dependências.

Ele possui:

- bibliotecas;
- arquivos;
- configurações;
- processos;
- interface de rede.

Entretanto, utiliza o kernel do sistema operacional hospedeiro.

Um container pode executar apenas uma aplicação ou um conjunto de serviços relacionados.

Exemplos:

- Servidor Web Apache;
- Banco de Dados MySQL;
- Servidor DNS;
- Broker MQTT;
- Firewall;
- Servidor SSH.

---

## O que é uma Imagem?

Uma imagem é um modelo utilizado para criar containers.

Pode ser comparada a um molde.

Sempre que um novo container é iniciado, ele é criado a partir de uma imagem.

Exemplo:

```
Imagem Ubuntu

↓

Container 1

Container 2

Container 3
```

Uma única imagem pode gerar centenas de containers.

---

## Docker Hub

O Docker Hub é um repositório público de imagens.

Nele podem ser encontradas milhares de aplicações prontas.

Exemplos:

- Ubuntu;
- Debian;
- Alpine Linux;
- Nginx;
- Apache;
- MySQL;
- PostgreSQL;
- Redis;
- MongoDB;
- Mosquitto MQTT.

O comando abaixo realiza o download de uma imagem:

```bash
docker pull ubuntu
```

---

## Registro de imagens

Embora o Docker Hub seja o registro mais conhecido, existem outros repositórios.

Exemplos:

- Docker Hub;
- GitHub Container Registry (GHCR);
- Amazon Elastic Container Registry (ECR);
- Google Artifact Registry;
- Azure Container Registry;
- Harbor (registro privado).

Empresas frequentemente mantêm registros privados para armazenar imagens internas.

---

## Volumes

Por padrão, quando um container é removido, todos os dados gravados dentro dele também são apagados.

Os **volumes** resolvem esse problema.

Volumes permitem armazenar dados fora do container.

Exemplos:

- Banco de dados;
- Logs;
- Arquivos de configuração;
- Certificados digitais;
- Capturas de rede.

Assim, mesmo que o container seja removido, os dados permanecem disponíveis.

---

## Redes Docker

Cada container pode ser conectado a uma ou mais redes.

As redes Docker permitem que containers se comuniquem entre si de forma semelhante aos dispositivos de uma rede física.

Tipos comuns de redes:

- Bridge;
- Host;
- None;
- Overlay (Docker Swarm);
- Macvlan.

Durante esta disciplina utilizaremos principalmente redes do tipo **Bridge**, integradas ao **Containerlab** para representar enlaces entre dispositivos virtuais.

---

## Persistência de dados

Uma das características mais importantes em aplicações modernas é a persistência de dados.

Sem persistência:

- banco de dados seria perdido;
- arquivos desapareceriam;
- configurações precisariam ser refeitas.

Utilizando volumes, os dados permanecem armazenados mesmo após:

- desligar o container;
- reiniciar o computador;
- atualizar a aplicação;
- criar um novo container.

---

# Resumo da Unidade

Nesta unidade foram apresentados os fundamentos necessários para utilização de containers em laboratórios de Redes de Computadores.

Foram discutidas as limitações dos laboratórios físicos, a evolução para ambientes virtualizados, as diferenças entre máquinas virtuais e containers, além dos principais conceitos do Docker, como imagens, containers, volumes, redes e persistência de dados.

Esses conceitos servirão como base para as próximas unidades, nas quais serão construídos laboratórios completos utilizando Docker e Containerlab para simular ambientes de redes e segurança da informação.

---

# Exercícios de Fixação

1. Explique duas limitações dos laboratórios físicos de redes.

2. Qual a principal diferença entre uma máquina virtual e um container?

3. O que é uma imagem Docker?

4. Qual é a função do Docker Hub?

5. O que acontece com os dados de um container sem o uso de volumes?

6. Para que servem os volumes no Docker?

7. Qual é a função das redes Docker?

8. Cite três vantagens do uso de containers em laboratórios de ensino.

9. Explique o conceito de persistência de dados.

10. Pesquise um serviço de mercado que utilize containers e descreva como essa tecnologia pode beneficiar sua infraestrutura.

---

