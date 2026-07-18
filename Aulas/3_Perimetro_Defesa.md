[![Segurança](https://img.shields.io/badge/Segurança-v1.0+-blue?logo=shield)](#)
[![Firewall](https://img.shields.io/badge/Firewall-Active-red?logo=firefox)](#)
[![Criptografia](https://img.shields.io/badge/Criptografia-Enabled-green?logo=lock)](#)

# Perímetro de Defesa

Em Segurança da Informação, perímetro de segurança pode ser entendido como o ambiente, recurso ou área que precisa ser protegida contra ameaças.

Perímetros em áreas de proteção:


| Perímetro / Área          | O que proteger                            | Exemplos de ameaças                         |
| ------------------------- | ----------------------------------------- | ------------------------------------------- |
| **Físico**                | Prédios, salas, servidores e equipamentos | Roubo, incêndio, acesso não autorizado      |
| **Rede**                  | Comunicação entre dispositivos            | Sniffing, DoS, ataques de rede              |
| **Perímetro externo**     | Conexão entre Internet e empresa          | Malware, ataques externos, DDoS             |
| **Servidores**            | Sistemas e serviços                       | Exploração de vulnerabilidades, brute force |
| **Estações de trabalho**  | Computadores e notebooks                  | Malware, ransomware, phishing               |
| **Identidade e acesso**   | Usuários, contas e permissões             | Roubo de credenciais, acesso indevido       |
| **Aplicações**            | Sistemas e serviços web                   | SQL Injection, XSS, exploração de falhas    |
| **Dados**                 | Arquivos, bancos de dados e informações   | Roubo, alteração, exclusão                  |
| **Wi-Fi**                 | Comunicação sem fio                       | Evil Twin, acesso não autorizado            |
| **Dispositivos IoT/IIoT** | Sensores, atuadores e gateways            | Credenciais padrão, botnets, spoofing       |
| **Nuvem**                 | Serviços e dados hospedados na nuvem      | Configuração incorreta, vazamento           |
| **Usuários**              | Pessoas que utilizam os sistemas          | Engenharia social, phishing                 |





Uma visão simples da empresa

                         INTERNET
                             │
                       [ PERÍMETRO ]
                             │
                         FIREWALL
                             │
                    ┌────────┴────────┐
                    │                 │
              REDE CORPORATIVA       Wi-Fi
                    │                 │
          ┌─────────┼─────────┐       │
          │         │         │       │
      Servidores  Estações  IoT/IIoT  │
          │         │         │       │
          └─────────┴─────────┴───────┘
                    │
                  DADOS

O perímetro não é apenas o firewall ou a borda da rede. A segurança precisa proteger diferentes elementos da organização.

Exemplo prático

Um atacante envia um e-mail de phishing:


Atacante
   │
   ▼
Usuário
   │
   ▼
Estação de trabalho
   │
   ▼
Rede corporativa
   │
   ▼
Servidor
   │
   ▼
Dados


Nesse caso, o ataque pode atravessar vários perímetros:

Usuário → é enganado pelo phishing;
Estação → recebe malware;
Rede → o malware tenta se movimentar;
Servidor → tenta acessar outros sistemas;
Dados → tenta roubar ou criptografar informações.

A Segurança da Informação protege pessoas, dispositivos, redes, sistemas, aplicações, dados e ambientes físicos.

Seis grandes áreas:

1. Perímetro físico
2. Perímetro de rede
3. Perímetro de servidores e dispositivos
4. Perímetro de aplicações
5. Perímetro de dados
6. Perímetro humano e de identidade

switches e roteadores (rede), servidores (infraestrutura), Wi-Fi (acesso sem fio), estações (endpoints) e sensores/atuadores (IoT/IIoT).
