## NetRoute-Diag-CMD

Script de diagnóstico de rede em lote (Batch) desenvolvido para facilitar a análise de conectividade, MTU e saltos de rota diretamente pelo CMD do Windows, utilizando códigos ANSI para melhor legibilidade visual.

🚀 Funcionalidades

O script automatiza três etapas críticas de diagnóstico de rede:

Verificação de MTU (Maximum Transmission Unit): Realiza um teste de fragmentação de pacote com 1472 bytes (+8 bytes de cabeçalho ICMP + 20 bytes IP = 1500 bytes) para validar se o caminho suporta o padrão Ethernet sem fragmentação.

Teste de Latência: Executa uma sequência de 5 pings para medir o tempo de resposta (RTT) e perda de pacotes.

Análise de Saltos (Pathping): Combina as funções de ping e tracert para identificar em qual salto da rede está ocorrendo perda de pacotes ou latência excessiva.

🛠️ Requisitos

Sistema Operacional: Windows 10 ou 11 (versões que suportam nativamente sequências de escape ANSI no console).

Permissões: Pode ser executado como usuário comum, mas privilégios de administrador podem ser necessários em redes com políticas restritivas de ICMP.

📖 Como Usar

Faça o download do arquivo .bat.

Execute o script.

Insira o endereço IP ou Host que deseja testar (ex: google.com ou 10.0.0.1). Caso pressione Enter sem digitar, o alvo padrão será o DNS do Google (8.8.8.8).

🔍 Detalhes Técnicos (Cybersecurity/TIC)

Para profissionais da área de TIC e Cibersegurança, este script é útil para:

Identificar rapidamente problemas de configuração de MTU em túneis VPN ou enlaces de rádio.

Mapear a topologia de rede externa de forma simplificada.

Gerar um relatório visual imediato durante incidentes de conectividade.

👨‍💻 Autor

Jeiel Lima Miranda

E-mail: jeielmiranda@duck.com

Site: jeielmiranda.com.br

Nota: Este script foi desenvolvido com foco em agilidade e clareza visual no terminal.
