## Vulnerabilidades e Ameaças

Em segurança de redes, é importante diferenciar vulnerabilidade, ameaça, ataque e risco. Esses conceitos estão relacionados, mas representam situações diferentes.

### 1. :monkey: Vulnerabilidade

Uma vulnerabilidade é uma fraqueza em um sistema, serviço, equipamento, software ou processo que pode ser explorada.

Exemplos
- Senha fraca;
- Sistema operacional desatualizado;
- Serviço desnecessário habilitado;
- Porta de rede aberta;
- Configuração incorreta;
- Falta de controle de acesso;
- Falha em um software;
- Firmware desatualizado.

Exemplo

Um servidor possui o serviço Telnet habilitado:

Servidor
   │
   └── Porta 23 aberta

O Telnet transmite informações sem a proteção adequada. Essa configuração pode ser considerada uma vulnerabilidade.

Vulnerabilidade = fraqueza que pode ser explorada.

### 2. :ghost: Ameaça

Uma ameaça é qualquer situação, pessoa, programa ou evento que pode causar danos a um sistema ou informação.

Exemplos de ameaças
- Atacante externo;
- Funcionário mal-intencionado;
- Malware;
- Ransomware;
- Phishing;
- Falha de energia;
- Incêndio;
- Falha de hardware;
- Desastre natural.

Uma ameaça pode existir mesmo quando ainda não ocorreu um ataque.

### 3. :flashlight: Ataque

Um ataque ocorre quando uma ameaça utiliza uma vulnerabilidade para tentar causar algum dano ou obter acesso não autorizado.

Ameaça
   │
   ▼
Explora
   │
   ▼
Vulnerabilidade
   │
   ▼
Ataque
Exemplo
- Vulnerabilidade:
- Senha fraca

Ameaça:
- Atacante

Ataque:
- Tentativas repetidas de login

Resultado:
- Acesso não autorizado

### 4. :hammer: Risco

O risco representa a possibilidade de uma ameaça explorar uma vulnerabilidade e causar um impacto.

Podemos representar de forma simplificada:

Risco = Ameaça + Vulnerabilidade + Impacto
Exemplo
- Elemento	Exemplo
- Vulnerabilidade	Senha fraca
- Ameaça	Atacante
- Ataque	Brute force
- Impacto	Acesso ao servidor

Quanto maior a probabilidade de exploração e maior o impacto, maior será o risco.

### 5. Exemplo em uma rede corporativa

Imagine uma empresa com um servidor de arquivos:

Usuários
    │
    ▼
  Switch
    │
    ▼
Servidor de arquivos

O servidor possui:

- sistema desatualizado;
- senha fraca;
- compartilhamento acessível a todos.
- Vulnerabilidades
- Sistema desatualizado
- Senha fraca
- Permissões incorretas
- Ameaças
- Atacante externo
- Funcionário mal-intencionado
- Malware

Possíveis ataques
- Brute Force
- Exploração de vulnerabilidade
- Ransomware

Impactos
- Roubo de arquivos
- Alteração de dados
- Indisponibilidade
- Prejuízo financeiro

### 6. Principais ameaças em redes
- Malware
- Software desenvolvido para causar danos ou realizar ações não autorizadas.

Exemplos:

- Vírus;
- Worm;
- Trojan;
- Spyware;
- Ransomware.
- Phishing

Tentativa de enganar uma pessoa para obter:

- senhas;
- dados pessoais;
- informações bancárias;
- códigos de autenticação.

Exemplo:

"Seu acesso será bloqueado.
Clique aqui para confirmar sua senha."

Brute Force

O atacante tenta várias combinações de usuário e senha.

admin / 123456
admin / senha
admin / admin123
admin / 12345678

Proteções
- senhas fortes;
- MFA;
- limite de tentativas;
- bloqueio de conta;
- monitoramento de logs.
- DoS e DDoS

O objetivo é tornar um serviço indisponível.

Muitos dispositivos
        │
        ▼
     Servidor
        │
        ▼
    Sobrecarga

Proteções
- firewall;
- IDS/IPS;
- rate limiting;
- filtragem de tráfego;
- serviços de proteção contra DDoS.
- Spoofing

O atacante falsifica sua identidade.

Exemplos:

- IP Spoofing;
- ARP Spoofing;
- DNS Spoofing;
- e-mail spoofing.
- Sniffing

O atacante captura e analisa o tráfego da rede.

Computador A ─────► Servidor
       │
       └── Atacante captura o tráfego
Proteções
- HTTPS;
- TLS;
- VPN;
- criptografia.

### 7. Vulnerabilidades em uma infraestrutura de rede

Uma empresa pode possuir vulnerabilidades em diferentes componentes:

| Componente | Exemplo de vulnerabilidade |
|---|---|
| Servidor | Sistema desatualizado |
| Switch | Porta de rede sem controle |
| Roteador | Senha padrão |
| Wi-Fi | Senha fraca |
| DNS | Configuração inadequada |
| DHCP | Servidor DHCP não autorizado |
| Estação de trabalho | Malware |
| IoT | Credenciais padrão |
| Usuário | Falta de treinamento |

### 8. Como reduzir vulnerabilidades?

Uma organização pode adotar várias medidas:

- Atualização
- Manter sistemas, aplicações e firmware atualizados.
- Hardening
- Desabilitar recursos desnecessários e aplicar configurações seguras.
- Controle de acesso
- Permitir que cada usuário tenha apenas as permissões necessárias.
- Segmentação
- Utilizar VLANs, firewalls e ACLs para separar redes.
- Monitoramento
- Analisar:
- logs;
- tráfego;
- eventos de segurança;
- tentativas de acesso.
- Backup
- Manter cópias de segurança para recuperação após incidentes.

### 9. Vulnerabilidade, ameaça e ataque: resumo
┌────────────────────────────────────┐
│ Vulnerabilidade                    │
│ Uma fraqueza                       │
└──────────────────┬─────────────────┘
                   │
                   ▼
┌────────────────────────────────────┐
│ Ameaça                             │
│ Algo que pode explorar a fraqueza  │
└──────────────────┬─────────────────┘
                   │
                   ▼
┌────────────────────────────────────┐
│ Ataque                             │
│ Exploração da vulnerabilidade      │
└──────────────────┬─────────────────┘
                   │
                   ▼
┌────────────────────────────────────┐
│ Impacto                            │
│ Dano ao sistema ou à informação    │
└────────────────────────────────────┘
Exemplo final

Uma empresa possui um servidor com uma senha fraca.

- Vulnerabilidade: senha fraca;
- Ameaça: atacante;
- Ataque: brute force;
- Impacto: acesso não autorizado aos dados.
