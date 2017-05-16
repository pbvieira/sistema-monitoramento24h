/**********************************************************************************************************************************

   EMPRESA:   MMT

   PROJETO:   AZ - CTX 3.1

   PROGRAMA:  Biblioteca de Comunicação AZ para o CTX 3.1

   MODULO:    Ctx.h

   VERSAO:    1.0

   OBJETIVO:  Declarar tipos usados, definições e enumerações da DLL para o programa aplicativo.

   EQUIPE:    Marcelo Negreiros
              Fernando Martins Bauer
              Cícero Renato Lorenzi

   PLATAFORMA:
              PC rodando Windows 95/98 ou NT.

   LINGUAGEM: C++

   COMPILADOR:
              Borland C++ Builder V 3.0 Professional

   ULTIMA MODIFICAÇÃO

   DATA       DESCRIÇÃO

   23/10/2001 - Início a partir de BibliotecaComunicacao.h (projeto Springer).

**********************************************************************************************************************************/

#define MODE                 extern "C" __declspec(dllimport) __stdcall
#define NR_MAX_ESTACOES      1
#define TAM_MAX_BUFFER       256
#define STOVR                0x40
#define STCMD                0x30
#define STAPL                0x0F

const WM_MENSAGEM_ENVIADA   = WM_USER + 2000;
const WM_MENSAGEM_RECEBIDA  = WM_USER + 2001;
const WM_ERRO               = WM_USER + 2002;
const WM_CTX_CONECTADO      = WM_USER + 2003;
const WM_CTX_DESCONECTADO   = WM_USER + 2004;
const WM_MEMORIA_PERDIDA    = WM_USER + 2005;
const WM_TESTE              = WM_USER + 2006;
const WM_MENSAGEM_PROTOCOLO = WM_USER + 2100;
const WM_MENSAGEM_MONITOR   = WM_USER + 2200;

/**********************************************************************************************************************************
                                  ESTRUTURAS
**********************************************************************************************************************************/
typedef struct
    {
    BYTE  bByte;
    WORD  wWord;
    DWORD dwDword;
    BYTE  abBuffer[TAM_MAX_BUFFER];
    WORD  awBuffer[TAM_MAX_BUFFER/2];
    char  acString[TAM_MAX_BUFFER];
    }VALPAR;
/**********************************************************************************************************************************
                                  ENUMERAÇÕES
**********************************************************************************************************************************/
enum CODIGOS_COMANDOS
   {
   COM_READ_PARAMETER = 0,
   COM_WRITE_PARAMETER,
   COM_INIT_CTX,
   COM_RESET_CTX,
   COM_SEND_DTMF_MESSAGE,
   COM_OPEN_TELEPHONE_CONNECTION,
   COM_SET_TELEPHONE_COMMANDS,
   COM_READ_ALL_EVENTS_FROM,
   COM_READ_ALL_LOGS_FROM,
   COM_PRINT_STRING,
   COM_SET_OUTPUTS,
   COM_RESET_OUTPUTS,
   COM_PUT_EVENT,
   COM_PUT_LOG,
   COM_SET_DATE_TIME,
   COM_SAVE_CONFIGURATION,
   COM_LOAD_CONFIGURATION,
   COM_NR_COMANDOS
   };

enum CODIGOS_PARAMETROS
   {
   PRM_IDENTIFICACAO = 0,    // 0
   PRM_ASSINATURA,
   PRM_CODIGO_CTX,
   PRM_CONFIGURACAO_CTX,
   PRM_ESTADO_CTX,
   PRM_DATA_HORARIO,
   PRM_NOME_CLIENTE,
   PRM_CABECALHO,
   PRM_EVENTO,
   PRM_RELATORIO,
   PRM_AVISO,                // 10
   PRM_NUMERO_TELEFONE,
   PRM_COMANDOS_TELEFONE,
   PRM_CONFIGURACAO_CTF,
   PRM_ESTADO_CTF,
   PRM_CONEXAO_ABERTA,
   PRM_CONEXAO_FECHADA,
   PRM_PRAZO_VALIDADE,
   PRM_HABILITACAO_AUTOMATO,
   PRM_CONFIGURACAO_TOM,
   PRM_ESTADO_TOM,           // 20
   PRM_BUFFER_DTMF_RX,
   PRM_BUFFER_DTMF_TX,
   PRM_CONFIGURACAO_CTA,
   PRM_ESTADO_CTA,
   PRM_CONFIGURACAO_CTD,
   PRM_ESTADO_CTD,
   PRM_CONFIGURACAO_FONTE,
   PRM_ESTADO_FONTE,
   PRM_CONFIGURACAO_IMPRESSAO,
   PRM_ESTADO_IMPRESSAO,     // 30
   PRM_BUFFER_IMPRESSAO,
   PRM_SAIDAS,
   PRM_TECLA,
   PRM_STATUS_CTX,
   PRM_NR_PARAMETROS
   };

enum CODIGOS_MENSAGENS_LOCAIS
   {
   MEN_MENSAGEM_ENVIADA = PRM_NR_PARAMETROS, // = 35
   MEN_MENSAGEM_RECEBIDA,
   MEN_MENSAGEM_RECEBIDA_ERRO,
   MEN_MENSAGEM_NAO_RECEBIDA,
   MEN_ERRO,
   MEN_MEMORIA_PERDIDA
   };

enum CODIGOS_ERROS_COMUNICACAO
   {
   ERRO_CTX_DESCONECTADO,
   ERRO_COMANDO_INEXISTENTE,
   ERRO_COMANDO_PARAMETRO_INVALIDO,
   ERRO_COMANDO_NAO_DISPONIVEL,
   ERRO_ACESSO_SERIAL,
   ERRO_MODULO_INVALIDO,
   ERRO_VERSAO_CTX_INVALIDA,
   ERRO_PARAMETRO_INVALIDO,
   ERRO_DEPURACAO
   };

enum ERROS_BIBLIOTECA_COMUNICACAO
   {
   BIBCOM_SEM_ERRO,
   BIBCOM_ENDERECO_INVALIDO,
   BIBCOM_SERVICO_NAO_EMPILHADO,
   BIBCOM_PARAMETRO_INVALIDO,
   BIBCOM_ERRO_INICIALIZACAO_REDE,
   BIBCOM_ERRO_ENCERRAMENTO_REDE,
   BIBCOM_ACESSO_NEGADO,
   BIBCOM_MENSAGEM_INVALIDA
   };

enum ERROS_ADICIONAIS
   {
   DLL_SEM_ERRO,
   DLL_ERRO_ABERTURA_PORTA_COMUNICACAO,
   DLL_ERRO_FECHAMENTO_PORTA_COMUNICACAO,
   DLL_ERRO_CONFIGURACAO_PORTA_COMUNICACAO,
   DLL_ERRO_CRIACAO_EVENTO,
   DLL_ERRO_HABILITACAO_TRANSMISSOR,
   DLL_ERRO_DESABILITACAO_TRANSMISSOR,
   DLL_ERRO_SERIAL_API_WINDOWS,
   DLL_ERRO_HANDLE_INVALIDO,
   DLL_ERRO_NUMERO_ESTACOES_INVALIDO,
   DLL_ERRO_CRIACAO_MMTIMER,
   DLL_ERRO_SERVICO_EM_ANDAMENTO,
   DLL_ERRO_ALOCACAO_MEMORIA
   };

enum BLOCOS_BIBLIOTECA_COMUNICACAO
   {
   BBC_MAQ_SERIAL,
   BBC_MAQ_COM,
   BBC_TIMER,
   BBC_SEQUENCIADOR,
   BBC_FUNCOES_ACESSO
   };

enum MENSAGENS_PARAMETROS_CTX
   {
   WM_IDENTIFICACAO = WM_MENSAGEM_PROTOCOLO,
   WM_ASSINATURA,
   WM_CODIGO_CTX,
   WM_CONFIGURACAO_CTX,
   WM_ESTADO_CTX,
   WM_DATA_HORARIO,
   WM_NOME_CLIENTE,
   WM_CABECALHO,
   WM_EVENTO,
   WM_RELATORIO,
   WM_AVISO,
   WM_NUMERO_TELEFONE,
   WM_COMANDOS_TELEFONE,
   WM_CONFIGURACAO_CTF,
   WM_ESTADO_CTF,
   WM_CONEXAO_ABERTA,
   WM_CONEXAO_FECHADA,
   WM_PRAZO_VALIDADE,
   WM_HABILITACAO_AUTOMATO,
   WM_CONFIGURACAO_TOM,
   WM_ESTADO_TOM,
   WM_BUFFER_DTMF_RX,
   WM_BUFFER_DTMF_TX,
   WM_CONFIGURACAO_CTA,
   WM_ESTADO_CTA,
   WM_CONFIGURACAO_CTD,
   WM_ESTADO_CTD,
   WM_CONFIGURACAO_FONTE,
   WM_ESTADO_FONTE,
   WM_CONFIGURACAO_IMPRESSAO,
   WM_ESTADO_IMPRESSAO,
   WM_BUFFER_IMPRESSAO,
   WM_SAIDAS,
   WM_TECLA,
   WM_STATUS_CTX
   };

enum MENSAGENS_PARAMETROS_MONITOR
   {
   WM_INICIA_COMUNICACAO = WM_MENSAGEM_MONITOR

   };

enum COMANDOS_TELEFONICOS
   {
   TEL_ABRE_SESSAO,          // Abre a sessão
   TEL_ARMA_MTA,             // Arma o MTA
   TEL_DESARMA_MTA,          // Desarma o MTA
   TEL_BLOQUEIA_SETOR,       // Bloqueia setor
   TEL_DESBLOQUEIA_SETOR,    // Desbloqueia setor
   TEL_AJUSTA_HORA,          // Ajusta hora do MTA
   TEL_AJUSTA_DATA,          // Ajusta data do MTA
   TEL_SOLICITA_RELATORIO,   // Solicita ao MTA envio de relatório nível n
   TEL_ACIONA_RELE,          // Aciona relé
   TEL_AJUSTA_HORA_SEM_AVISO,// Ajusta hora do MTA (sem aviso)
   TEL_BLOQUEADOS,           // Envia situação dos setores bloqueados
   TEL_DESABILITA_MTA,       // Desabilita o uso do MTA
   TEL_HABILITA_MTA,         // Habilita o uso do MTA
   TEL_SOLICITA_ID,          // Solicita ao MTA a transmissão por rádio da identificação
   TEL_AVISA_COMANDO,        // Avisa quando um comando é executado.
   TEL_NAO_AVISA_COMANDO     // Não avisa ao executar um comando.
   };
