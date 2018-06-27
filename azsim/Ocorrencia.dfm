object FOcorrencia: TFOcorrencia
  Left = 189
  Top = 102
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Atendimento'
  ClientHeight = 705
  ClientWidth = 950
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 4
    Top = 2
    Width = 476
    Height = 509
    TabOrder = 0
    object Label8: TLabel
      Left = 7
      Top = 7
      Width = 51
      Height = 13
      Caption = 'Origem OC'
    end
    object Label3: TLabel
      Left = 8
      Top = 46
      Width = 30
      Height = 13
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 48
      Top = 46
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 82
      Width = 25
      Height = 13
      Caption = 'Setor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 48
      Top = 82
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 120
      Width = 127
      Height = 13
      Caption = '*Nome / Raz'#227'o Social'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 7
      Top = 159
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 314
      Top = 198
      Width = 27
      Height = 13
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 7
      Top = 198
      Width = 33
      Height = 13
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 8
      Top = 235
      Width = 98
      Height = 13
      Caption = 'Ponto de Refer'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 148
      Top = 7
      Width = 89
      Height = 13
      Caption = '*Data Hora OC.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 79
      Top = 7
      Width = 53
      Height = 13
      Caption = 'Codificador'
    end
    object Label7: TLabel
      Left = 266
      Top = 7
      Width = 138
      Height = 13
      Caption = '*Data Hora Atendimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 431
      Top = 7
      Width = 31
      Height = 13
      Caption = 'Chave'
    end
    object Label1: TLabel
      Left = 8
      Top = 272
      Width = 36
      Height = 13
      Caption = 'Fone(1)'
      FocusControl = EdtFone1
    end
    object Label34: TLabel
      Left = 8
      Top = 310
      Width = 36
      Height = 13
      Caption = 'Fone(2)'
      FocusControl = EdtFone2
    end
    object Label35: TLabel
      Left = 8
      Top = 346
      Width = 36
      Height = 13
      Caption = 'Fone(3)'
      FocusControl = EdtFone3
    end
    object Label36: TLabel
      Left = 91
      Top = 272
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (1)'
      FocusControl = EdtFone1Obs
    end
    object Label37: TLabel
      Left = 91
      Top = 310
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (2)'
      FocusControl = EdtFone2Obs
    end
    object Label38: TLabel
      Left = 91
      Top = 346
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (3)'
      FocusControl = EdtFone3Obs
    end
    object Label39: TLabel
      Left = 241
      Top = 272
      Width = 36
      Height = 13
      Caption = 'Fone(4)'
      FocusControl = EdtFone4
    end
    object Label40: TLabel
      Left = 241
      Top = 310
      Width = 36
      Height = 13
      Caption = 'Fone(5)'
      FocusControl = EdtFone5
    end
    object Label41: TLabel
      Left = 241
      Top = 346
      Width = 36
      Height = 13
      Caption = 'Fone(6)'
      FocusControl = EdtFone6
    end
    object Label42: TLabel
      Left = 324
      Top = 272
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (4)'
      FocusControl = EdtFone4Obs
    end
    object Label43: TLabel
      Left = 324
      Top = 310
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (5)'
      FocusControl = EdtFone5Obs
    end
    object Label44: TLabel
      Left = 324
      Top = 346
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (6)'
      FocusControl = EdtFone6Obs
    end
    object BtnLocalizarCliente: TSpeedButton
      Left = 444
      Top = 135
      Width = 23
      Height = 22
      Enabled = False
      Flat = True
      Glyph.Data = {
        C6040000424DC60400000000000036040000280000000C0000000C0000000100
        0800000000009000000000000000000000000001000000000000AC650000FCF1
        DD00B36D0000BE770000A35E0000FCF2E000F3CE8A00FDF7EB00CA871200DAA0
        3C00BA730000B56E0000C27B0000EABB6400A5600000F0C57500AA6500009F5A
        0000FEFBF500AF6A0000FFFEFB00FAE6C300F6DAA600FAEACC00C37C0000F8E4
        BD00BB740000A05B0000FFFFFF00FFFFFF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001C1C1C1C1C1C
        1C1C1C1C04041C1C1C1C1C1C1C1C1C0008001C1C1C1C1C1C1C1C0209021C1C1C
        1C1C1C1C1C1A0D1A1C1C1C1C1B1B111B1A0F0C1C1C1C1C0E191919191A1A1C1C
        1C1C101717060617171B1C1C1C1C130116161616011B1C1C1C1C0B0715151515
        071B1C1C1C1C0A1414050512141B1C1C1C1C1C031C1C1C1C031C1C1C1C1C1C1C
        181818181C1C1C1C1C1C}
      Transparent = False
      OnClick = BtnLocalizarClienteClick
    end
    object Label46: TLabel
      Left = 10
      Top = 421
      Width = 241
      Height = 13
      Caption = 'Observa'#231#245'es do Cliente dados de Viagens'
      FocusControl = EdtFone3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label47: TLabel
      Left = 8
      Top = 382
      Width = 36
      Height = 13
      Caption = 'Fone(7)'
      FocusControl = EdtFone3
    end
    object Label48: TLabel
      Left = 91
      Top = 382
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (7)'
      FocusControl = EdtFone3Obs
    end
    object Label49: TLabel
      Left = 241
      Top = 382
      Width = 36
      Height = 13
      Caption = 'Fone(8)'
      FocusControl = EdtFone6
    end
    object Label50: TLabel
      Left = 324
      Top = 382
      Width = 73
      Height = 13
      Caption = 'Observa'#231#227'o (8)'
      FocusControl = EdtFone6Obs
    end
    object Label51: TLabel
      Left = 234
      Top = 120
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdtStatus: TDBEdit
      Left = 7
      Top = 60
      Width = 40
      Height = 21
      TabStop = False
      DataField = 'STATUS'
      DataSource = DSOcorrencia
      TabOrder = 0
    end
    object EdtDescricaoStatus: TDBEdit
      Left = 49
      Top = 60
      Width = 415
      Height = 21
      TabStop = False
      DataField = 'DESTATUS'
      DataSource = DSOcorrencia
      TabOrder = 1
    end
    object EdtSetor: TDBEdit
      Left = 7
      Top = 96
      Width = 40
      Height = 21
      TabStop = False
      DataField = 'NUMSETOR'
      DataSource = DSOcorrencia
      TabOrder = 2
    end
    object EdtLocalSetor: TDBEdit
      Left = 49
      Top = 96
      Width = 415
      Height = 21
      TabStop = False
      DataField = 'LOCAL'
      DataSource = DSOcorrencia
      TabOrder = 3
    end
    object EdtNmCliente: TDBEdit
      Left = 7
      Top = 136
      Width = 226
      Height = 21
      TabStop = False
      DataField = 'NMCLIENTE'
      DataSource = DSCliente
      TabOrder = 4
    end
    object EdtEndereco: TDBEdit
      Left = 7
      Top = 175
      Width = 457
      Height = 21
      TabStop = False
      DataField = 'ENDERECO'
      DataSource = DSCliente
      TabOrder = 5
    end
    object EdtBairro: TDBEdit
      Left = 315
      Top = 214
      Width = 149
      Height = 21
      TabStop = False
      DataField = 'BAIRRO'
      DataSource = DSCliente
      TabOrder = 6
    end
    object EdtCidade: TDBEdit
      Left = 7
      Top = 214
      Width = 305
      Height = 21
      TabStop = False
      DataField = 'CIDADE'
      DataSource = DSCliente
      TabOrder = 7
    end
    object EdtPontoRef: TDBEdit
      Left = 8
      Top = 250
      Width = 456
      Height = 21
      TabStop = False
      DataField = 'PONTOREF'
      DataSource = DSCliente
      TabOrder = 8
    end
    object EdtDataEvento: TDBEdit
      Left = 148
      Top = 23
      Width = 115
      Height = 21
      Hint = 'Duplo clique para setar a data e hora atual'
      DataField = 'DATAEVENTO'
      DataSource = DSOcorrencia
      TabOrder = 9
      OnDblClick = EdtDataEventoDblClick
    end
    object EdtTipoCtx: TDBEdit
      Left = 7
      Top = 23
      Width = 29
      Height = 21
      TabStop = False
      DataField = 'TIPOCTX'
      DataSource = DSOcorrencia
      TabOrder = 10
    end
    object EdtCodificador: TDBEdit
      Left = 79
      Top = 23
      Width = 67
      Height = 21
      TabStop = False
      DataField = 'EQUIPAMENTO'
      DataSource = DSOcorrencia
      TabOrder = 11
    end
    object EdtCtx: TDBEdit
      Left = 38
      Top = 23
      Width = 39
      Height = 21
      TabStop = False
      DataField = 'CTX'
      DataSource = DSOcorrencia
      TabOrder = 12
    end
    object EdtDataAberturaOcorrencia: TDBEdit
      Left = 265
      Top = 23
      Width = 115
      Height = 21
      Hint = 'Duplo clique para setar a data e hora atual'
      DataField = 'DATAATENDIMENTO'
      DataSource = DSOcorrencia
      TabOrder = 13
      OnDblClick = EdtDataAberturaOcorrenciaDblClick
    end
    object EdtChave: TDBEdit
      Left = 382
      Top = 23
      Width = 82
      Height = 21
      TabStop = False
      DataField = 'CHAVE'
      DataSource = DSOcorrencia
      TabOrder = 14
    end
    object EdtFone1: TDBEdit
      Left = 8
      Top = 288
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'FONE1'
      DataSource = DSCliente
      TabOrder = 15
    end
    object EdtFone2: TDBEdit
      Left = 8
      Top = 325
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'FONE2'
      DataSource = DSCliente
      TabOrder = 16
    end
    object EdtFone3: TDBEdit
      Left = 8
      Top = 361
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'FONE3'
      DataSource = DSCliente
      TabOrder = 17
    end
    object EdtFone1Obs: TDBEdit
      Left = 91
      Top = 288
      Width = 148
      Height = 21
      TabStop = False
      DataField = 'FONEOBS1'
      DataSource = DSCliente
      TabOrder = 18
    end
    object EdtFone2Obs: TDBEdit
      Left = 91
      Top = 325
      Width = 148
      Height = 21
      TabStop = False
      DataField = 'FONEOBS2'
      DataSource = DSCliente
      TabOrder = 19
    end
    object EdtFone3Obs: TDBEdit
      Left = 91
      Top = 361
      Width = 148
      Height = 21
      TabStop = False
      DataField = 'FONEOBS3'
      DataSource = DSCliente
      TabOrder = 20
    end
    object EdtFone4: TDBEdit
      Left = 241
      Top = 288
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'FONE4'
      DataSource = DSCliente
      TabOrder = 21
    end
    object EdtFone5: TDBEdit
      Left = 241
      Top = 325
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'FONE5'
      DataSource = DSCliente
      TabOrder = 22
    end
    object EdtFone6: TDBEdit
      Left = 241
      Top = 361
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'FONE6'
      DataSource = DSCliente
      TabOrder = 23
    end
    object EdtFone4Obs: TDBEdit
      Left = 324
      Top = 288
      Width = 140
      Height = 21
      TabStop = False
      DataField = 'FONEOBS4'
      DataSource = DSCliente
      TabOrder = 24
    end
    object EdtFone5Obs: TDBEdit
      Left = 324
      Top = 325
      Width = 140
      Height = 21
      TabStop = False
      DataField = 'FONEOBS5'
      DataSource = DSCliente
      TabOrder = 25
    end
    object EdtFone6Obs: TDBEdit
      Left = 324
      Top = 361
      Width = 140
      Height = 21
      TabStop = False
      DataField = 'FONEOBS6'
      DataSource = DSCliente
      TabOrder = 26
    end
    object EdtObs: TDBMemo
      Left = 8
      Top = 437
      Width = 456
      Height = 67
      TabStop = False
      DataField = 'OBSERVACAO'
      DataSource = DSCliente
      ScrollBars = ssVertical
      TabOrder = 27
    end
    object EdtFone7: TDBEdit
      Left = 10
      Top = 397
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'FONE7'
      DataSource = DSCliente
      TabOrder = 28
    end
    object EdtFone7Obs: TDBEdit
      Left = 93
      Top = 397
      Width = 148
      Height = 21
      TabStop = False
      DataField = 'FONEOBS7'
      DataSource = DSCliente
      TabOrder = 29
    end
    object EdtFone8: TDBEdit
      Left = 243
      Top = 397
      Width = 81
      Height = 21
      TabStop = False
      DataField = 'FONE8'
      DataSource = DSCliente
      TabOrder = 30
    end
    object EdtFone8Obs: TDBEdit
      Left = 326
      Top = 397
      Width = 140
      Height = 21
      TabStop = False
      DataField = 'FONEOBS8'
      DataSource = DSCliente
      TabOrder = 31
    end
    object EdtNomeFantasia: TDBEdit
      Left = 235
      Top = 136
      Width = 207
      Height = 21
      TabStop = False
      DataField = 'NMFANTASIA'
      DataSource = DSCliente
      TabOrder = 32
    end
  end
  object Panel2: TPanel
    Left = 483
    Top = 2
    Width = 462
    Height = 509
    TabOrder = 1
    object Label13: TLabel
      Left = 11
      Top = 129
      Width = 70
      Height = 13
      Caption = 'H. Sa'#237'da Emp.'
    end
    object Label14: TLabel
      Left = 11
      Top = 153
      Width = 72
      Height = 13
      Caption = 'H. Sa'#237'da Local'
    end
    object Label16: TLabel
      Left = 11
      Top = 177
      Width = 72
      Height = 13
      Caption = 'H. Abert. Lacre'
    end
    object Label18: TLabel
      Left = 11
      Top = 202
      Width = 62
      Height = 13
      Caption = 'Km de Sa'#237'da'
    end
    object Label19: TLabel
      Left = 144
      Top = 129
      Width = 86
      Height = 13
      Caption = 'H. Chegada Local'
    end
    object Label21: TLabel
      Left = 144
      Top = 153
      Width = 81
      Height = 13
      Caption = 'H. Chegada Emp'
    end
    object Label22: TLabel
      Left = 144
      Top = 177
      Width = 27
      Height = 13
      Caption = 'Lacre'
    end
    object Label23: TLabel
      Left = 144
      Top = 202
      Width = 71
      Height = 13
      Caption = 'Km de Retorno'
    end
    object Label24: TLabel
      Left = 290
      Top = 129
      Width = 104
      Height = 13
      Caption = 'Tempo Deslocamento'
    end
    object Label25: TLabel
      Left = 290
      Top = 153
      Width = 89
      Height = 13
      Caption = 'Tempo de Retorno'
    end
    object Label26: TLabel
      Left = 290
      Top = 177
      Width = 94
      Height = 13
      Caption = 'Tempo atendimento'
    end
    object Label27: TLabel
      Left = 290
      Top = 202
      Width = 93
      Height = 13
      Caption = 'Km Total Percorrido'
    end
    object Label28: TLabel
      Left = 10
      Top = 217
      Width = 51
      Height = 13
      Caption = '*Resumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 11
      Top = 279
      Width = 70
      Height = 13
      Caption = 'Procedimentos'
    end
    object Label31: TLabel
      Left = 11
      Top = 426
      Width = 88
      Height = 13
      Caption = 'Ocorr'#234'ncia Policial'
    end
    object Label30: TLabel
      Left = 10
      Top = 6
      Width = 115
      Height = 13
      Caption = '*Tipo de Ocorr'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 10
      Top = 85
      Width = 73
      Height = 13
      Caption = '*Operador(a)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 209
      Top = 85
      Width = 34
      Height = 13
      Caption = 'Agente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label45: TLabel
      Left = 231
      Top = 6
      Width = 141
      Height = 13
      Caption = '*Sub-Tipo da Ocorr'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnOrdemServico: TSpeedButton
      Left = 9
      Top = 49
      Width = 442
      Height = 33
      Caption = 'Abrir ordem de servi'#231'o a partir desta ocorr'#234'ncia'
      Enabled = False
      Flat = True
      Glyph.Data = {
        C6040000424DC60400000000000036040000280000000C0000000C0000000100
        080000000000900000000000000000000000000100000000000004BEF30003BF
        F40014A9DD002495C70009B7EC000EB1E5001F9BCD0060DFFC0006BDF20008BA
        EF00C8FCFF0000C3F8000EC7F90079EEFD0001C2F70062DFFC00AEF5FF001BCB
        F9001CCDF9003FD5FB0045DBFB008AEBFD001AA2D500288FC100FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000171717171717
        1717171717170312121212121212121212030614141414141414141414061616
        161616160D0D0D0D0D16020C0C0C0C0C16161616160205111111111111111111
        1105041313131313131313131304090F0F0F0F070F0F0F0F0F00081515151515
        1515151515000110101010101010101010010E0E0A0A0A0E0E0E0E0E0E0E1818
        0B0B0B0B181818181818}
      OnClick = BtnOrdemServicoClick
    end
    object EdtKmRetorno: TDBEdit
      Left = 234
      Top = 197
      Width = 52
      Height = 21
      DataField = 'KMRETORNO'
      DataSource = DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
    end
    object EdtKmTotalPercorrido: TDBEdit
      Left = 396
      Top = 197
      Width = 53
      Height = 21
      Hint = 'Preenchimento autom'#225'tico ao preencher o resumo da ocorr'#234'ncia.'
      DataField = 'KMTOTALPERCORRIDO'
      DataSource = DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
    end
    object EdtResumo: TDBMemo
      Left = 10
      Top = 231
      Width = 440
      Height = 47
      DataField = 'RESUMO'
      DataSource = DSOcorrencia
      ScrollBars = ssVertical
      TabOrder = 17
      OnEnter = EdtResumoEnter
    end
    object EdtProcedimentos: TDBMemo
      Left = 10
      Top = 294
      Width = 440
      Height = 131
      DataField = 'PROCEDIMENTOS'
      DataSource = DSProcedimeto
      ScrollBars = ssVertical
      TabOrder = 18
    end
    object EdtOcorrenciaPolicial: TDBMemo
      Left = 10
      Top = 441
      Width = 440
      Height = 57
      DataField = 'OCORRENCIAPOLICIAL'
      DataSource = DSOcorrencia
      ScrollBars = ssVertical
      TabOrder = 19
      OnExit = EdtOcorrenciaPolicialExit
    end
    object CmbSubTipoOcorrencia: TDBLookupComboBox
      Left = 229
      Top = 23
      Width = 221
      Height = 21
      DataField = 'DESUBTIPOOCORRENCIA'
      DataSource = DSOcorrencia
      TabOrder = 1
    end
    object CmbTipoOcorrencia: TDBLookupComboBox
      Left = 10
      Top = 23
      Width = 216
      Height = 21
      DataField = 'DETIPOOCORRENCIA'
      DataSource = DSOcorrencia
      TabOrder = 0
      OnExit = CmbTipoOcorrenciaExit
    end
    object CmbOperadora: TDBLookupComboBox
      Left = 10
      Top = 100
      Width = 197
      Height = 21
      DataField = 'NMOPERADORA'
      DataSource = DSOcorrencia
      TabOrder = 2
    end
    object CmbAgente: TDBLookupComboBox
      Left = 250
      Top = 100
      Width = 199
      Height = 21
      DataField = 'NMAGENTE'
      DataSource = DSOcorrencia
      TabOrder = 4
    end
    object EdtCodAgente: TDBEdit
      Left = 209
      Top = 100
      Width = 39
      Height = 21
      DataField = 'CDAGENTE'
      DataSource = DSOcorrencia
      TabOrder = 3
    end
    object EdtSaidaEmp: TMaskEdit
      Left = 86
      Top = 127
      Width = 52
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 5
      Text = '  :  '
    end
    object EdtChegadaLocal: TMaskEdit
      Left = 234
      Top = 126
      Width = 52
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 6
      Text = '  :  '
    end
    object EdtTempoDeslocamento: TMaskEdit
      Left = 396
      Top = 126
      Width = 52
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 7
      Text = '  :  '
    end
    object EdtSaidaLocal: TMaskEdit
      Left = 86
      Top = 150
      Width = 52
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 8
      Text = '  :  '
    end
    object EdtChegadaEmpresa: TMaskEdit
      Left = 234
      Top = 150
      Width = 52
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 9
      Text = '  :  '
    end
    object EdtTempoRetorno: TMaskEdit
      Left = 396
      Top = 150
      Width = 52
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 10
      Text = '  :  '
    end
    object EdtTempoAtendimento: TMaskEdit
      Left = 396
      Top = 174
      Width = 52
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 13
      Text = '  :  '
    end
    object EdtLacre: TDBEdit
      Left = 234
      Top = 174
      Width = 52
      Height = 21
      DataField = 'LACRE'
      DataSource = DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
    end
    object EdtKmSaida: TDBEdit
      Left = 86
      Top = 197
      Width = 53
      Height = 21
      DataField = 'KMSAIDA'
      DataSource = DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
    end
    object EdtHoraLacre: TDBEdit
      Left = 86
      Top = 174
      Width = 52
      Height = 21
      DataField = 'HORAABERTURALACRE'
      DataSource = DSOcorrencia
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
    end
  end
  object PCGrids: TPageControl
    Left = 3
    Top = 519
    Width = 946
    Height = 179
    ActivePage = TSSetores
    Style = tsFlatButtons
    TabIndex = 1
    TabOrder = 2
    TabStop = False
    object TSContatos: TTabSheet
      Caption = '&Usu'#225'rios'
      object DBGContatos: TDBGrid
        Left = 0
        Top = 0
        Width = 938
        Height = 148
        TabStop = False
        Align = alClient
        DataSource = DSContato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NMCONTATO'
            Title.Caption = 'Nome'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATANASCIMENTO'
            Title.Caption = 'Data Nasc.'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SENHA'
            Title.Caption = 'Senha'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTRASENHA'
            Title.Caption = 'Contra-Senha'
            Width = 800
            Visible = True
          end>
      end
    end
    object TSSetores: TTabSheet
      Caption = '&Setores'
      ImageIndex = 2
      object DBGSetores: TDBGrid
        Left = 0
        Top = 0
        Width = 938
        Height = 148
        TabStop = False
        Align = alClient
        DataSource = DSSetores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMSETOR'
            Title.Caption = 'Setor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOCAL'
            Title.Caption = 'Localiza'#231#227'o'
            Width = 860
            Visible = True
          end>
      end
    end
  end
  object IBTCliente: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 168
    Top = 564
  end
  object IBQCliente: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTCliente
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C.CDCLIENTE, C.NMCLIENTE, C.NMFANTASIA, C.ENDERECO, C.BAI' +
        'RRO, C.CIDADE, C.PONTOREF, '
      
        '    C.FONE1, C.FONEOBS1, C.FONE2, C.FONEOBS2, C.FONE3,C.FONEOBS3' +
        ',C.FONE4,C.FONEOBS4,'
      
        '    C.FONE5,C.FONEOBS5,C.FONE6,C.FONEOBS6,  C.FONE7,C.FONEOBS7,C' +
        '.FONE8,C.FONEOBS8, C.OBSERVACAO'
      'FROM CLIENTE C WHERE C.CDCLIENTE = :CDCLIENTE;')
    UniDirectional = True
    Left = 264
    Top = 564
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
      end>
    object IBQClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQClienteNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQClienteENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Size = 60
    end
    object IBQClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Size = 60
    end
    object IBQClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Size = 60
    end
    object IBQClientePONTOREF: TIBStringField
      FieldName = 'PONTOREF'
      Origin = 'CLIENTE.PONTOREF'
      Size = 200
    end
    object IBQClienteFONE1: TIBStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTE.FONE1'
      Size = 13
    end
    object IBQClienteFONEOBS1: TIBStringField
      FieldName = 'FONEOBS1'
      Origin = 'CLIENTE.FONEOBS1'
      Size = 200
    end
    object IBQClienteFONE2: TIBStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTE.FONE2'
      Size = 13
    end
    object IBQClienteFONEOBS2: TIBStringField
      FieldName = 'FONEOBS2'
      Origin = 'CLIENTE.FONEOBS2'
      Size = 200
    end
    object IBQClienteFONE3: TIBStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTE.FONE3'
      Size = 13
    end
    object IBQClienteFONEOBS3: TIBStringField
      FieldName = 'FONEOBS3'
      Origin = 'CLIENTE.FONEOBS3'
      Size = 200
    end
    object IBQClienteFONE4: TIBStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTE.FONE4'
      Size = 13
    end
    object IBQClienteFONEOBS4: TIBStringField
      FieldName = 'FONEOBS4'
      Origin = 'CLIENTE.FONEOBS4'
      Size = 200
    end
    object IBQClienteFONE5: TIBStringField
      FieldName = 'FONE5'
      Origin = 'CLIENTE.FONE5'
      Size = 13
    end
    object IBQClienteFONEOBS5: TIBStringField
      FieldName = 'FONEOBS5'
      Origin = 'CLIENTE.FONEOBS5'
      Size = 200
    end
    object IBQClienteFONE6: TIBStringField
      FieldName = 'FONE6'
      Origin = 'CLIENTE.FONE6'
      Size = 13
    end
    object IBQClienteFONEOBS6: TIBStringField
      FieldName = 'FONEOBS6'
      Origin = 'CLIENTE.FONEOBS6'
      Size = 200
    end
    object IBQClienteOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTE.OBSERVACAO'
      Size = 2000
    end
    object IBQClienteFONE7: TIBStringField
      FieldName = 'FONE7'
      Origin = 'CLIENTE.FONE7'
      Size = 13
    end
    object IBQClienteFONEOBS7: TIBStringField
      FieldName = 'FONEOBS7'
      Origin = 'CLIENTE.FONEOBS7'
      Size = 200
    end
    object IBQClienteFONE8: TIBStringField
      FieldName = 'FONE8'
      Origin = 'CLIENTE.FONE8'
      Size = 13
    end
    object IBQClienteFONEOBS8: TIBStringField
      FieldName = 'FONEOBS8'
      Origin = 'CLIENTE.FONEOBS8'
      Size = 200
    end
    object IBQClienteNMFANTASIA: TIBStringField
      FieldName = 'NMFANTASIA'
      Origin = 'CLIENTE.NMFANTASIA'
      Size = 256
    end
  end
  object DSPCliente: TDataSetProvider
    DataSet = IBQCliente
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 564
  end
  object CDSCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCliente'
    ReadOnly = True
    Left = 327
    Top = 564
    object CDSClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSClienteNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object CDSClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object CDSClientePONTOREF: TStringField
      FieldName = 'PONTOREF'
      Size = 200
    end
    object CDSClienteFONE1: TStringField
      FieldName = 'FONE1'
      Size = 13
    end
    object CDSClienteFONEOBS1: TStringField
      FieldName = 'FONEOBS1'
      Size = 200
    end
    object CDSClienteFONE2: TStringField
      FieldName = 'FONE2'
      Size = 13
    end
    object CDSClienteFONEOBS2: TStringField
      FieldName = 'FONEOBS2'
      Size = 200
    end
    object CDSClienteFONE3: TStringField
      FieldName = 'FONE3'
      Size = 13
    end
    object CDSClienteFONEOBS3: TStringField
      FieldName = 'FONEOBS3'
      Size = 200
    end
    object CDSClienteFONE4: TStringField
      FieldName = 'FONE4'
      Size = 13
    end
    object CDSClienteFONEOBS4: TStringField
      FieldName = 'FONEOBS4'
      Size = 200
    end
    object CDSClienteFONE5: TStringField
      FieldName = 'FONE5'
      Size = 13
    end
    object CDSClienteFONEOBS5: TStringField
      FieldName = 'FONEOBS5'
      Size = 200
    end
    object CDSClienteFONE6: TStringField
      FieldName = 'FONE6'
      Size = 13
    end
    object CDSClienteFONEOBS6: TStringField
      FieldName = 'FONEOBS6'
      Size = 200
    end
    object CDSClienteOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 2000
    end
    object CDSClienteIBQContato: TDataSetField
      FieldName = 'IBQContato'
    end
    object CDSClienteFONE7: TStringField
      FieldName = 'FONE7'
      Size = 13
    end
    object CDSClienteFONEOBS7: TStringField
      FieldName = 'FONEOBS7'
      Size = 200
    end
    object CDSClienteFONE8: TStringField
      FieldName = 'FONE8'
      Size = 13
    end
    object CDSClienteFONEOBS8: TStringField
      FieldName = 'FONEOBS8'
      Size = 200
    end
    object CDSClienteNMFANTASIA: TStringField
      FieldName = 'NMFANTASIA'
      Size = 256
    end
  end
  object DSCliente: TDataSource
    DataSet = CDSCliente
    Left = 230
    Top = 564
  end
  object CDSContato: TClientDataSet
    Aggregates = <>
    DataSetField = CDSClienteIBQContato
    Params = <>
    ReadOnly = True
    Left = 229
    Top = 595
    object CDSContatoNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Origin = 'CLIENTECONTATO.NMCONTATO'
      Required = True
      Size = 60
    end
    object CDSContatoCDTIPOCONTATO: TIntegerField
      FieldName = 'CDTIPOCONTATO'
      Origin = 'CLIENTECONTATO.CDTIPOCONTATO'
      Required = True
    end
    object CDSContatoPARENTESCO: TStringField
      FieldName = 'PARENTESCO'
      Origin = 'CLIENTECONTATO.PARENTESCO'
      Size = 30
    end
    object CDSContatoFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTECONTATO.FONE1'
      Size = 13
    end
    object CDSContatoFONE1OBS: TStringField
      FieldName = 'FONE1OBS'
      Origin = 'CLIENTECONTATO.FONE1OBS'
      Size = 30
    end
    object CDSContatoFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTECONTATO.FONE2'
      Size = 13
    end
    object CDSContatoFONE2OBS: TStringField
      FieldName = 'FONE2OBS'
      Origin = 'CLIENTECONTATO.FONE2OBS'
      Size = 30
    end
    object CDSContatoFONE3: TStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTECONTATO.FONE3'
      Size = 13
    end
    object CDSContatoFONE3OBS: TStringField
      FieldName = 'FONE3OBS'
      Origin = 'CLIENTECONTATO.FONE3OBS'
      Size = 30
    end
    object CDSContatoFONE4: TStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTECONTATO.FONE4'
      Size = 13
    end
    object CDSContatoFONE4OBS: TStringField
      FieldName = 'FONE4OBS'
      Origin = 'CLIENTECONTATO.FONE4OBS'
      Size = 30
    end
    object CDSContatoSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'CLIENTECONTATO.SENHA'
      Size = 100
    end
    object CDSContatoCONTRASENHA: TStringField
      FieldName = 'CONTRASENHA'
      Origin = 'CLIENTECONTATO.CONTRASENHA'
      Size = 100
    end
    object CDSContatoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'CLIENTECONTATO.DATANASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object DSContato: TDataSource
    DataSet = CDSContato
    Left = 167
    Top = 596
  end
  object IBTAgente: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 24
    Top = 563
  end
  object IBQAgente: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTAgente
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDUSUARIO, LOGIN FROM USUARIO WHERE CDTIPOUSUARIO = 2 ORD' +
        'ER BY LOGIN')
    UniDirectional = True
    Left = 56
    Top = 563
    object IBQAgenteCDUSUARIO: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQAgenteLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object DSPAgente: TDataSetProvider
    DataSet = IBQAgente
    Constraints = True
    Left = 88
    Top = 563
  end
  object CDSAgente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPAgente'
    Left = 120
    Top = 563
    object CDSAgenteCDUSUARIO: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSAgenteLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object IBTOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 371
    Top = 564
  end
  object IBQOcorrencia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOcorrencia
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT '
      
        '    O.CDOCORRENCIA, O.CDOCORRENCIAPAI, O.PORTACOM, O.NREVENTO, O' +
        '.TIPOCTX, O.CTX, O.EQUIPAMENTO, O.STATUS || '#39'.'#39' || REPLACE(O.REF' +
        'ERENCIA, '#39'F'#39', '#39'*'#39') AS STATUS, '
      
        '    O.DESTATUS, O.NUMSETOR, O.LOCAL, O.CDCLIENTE, O.CDORDEMSERVI' +
        'CO, O.DATACADASTRO, O.DATAEVENTO,'
      '    CASE'
      '       WHEN DATAATENDIMENTO IS NULL THEN CURRENT_TIMESTAMP'
      '       ELSE  DATAATENDIMENTO'
      
        '    END AS DATAATENDIMENTO, O.CDAGENTE, O.CDOPERADORABERTURA, O.' +
        'CDOPERADORENCERRAMENTO, O.HORASAIDAEMP, O.HORASAIDALOCAL, '
      
        '    O.HORAABERTURALACRE, O.KMSAIDA, O.HORACHEGADALOCAL, O.HORACH' +
        'EGADAEMP, O.LACRE, O.KMRETORNO, O.TEMPODESOLOCAMENTO, '
      
        '    O.TEMPORETORNO, O.TEMPOATENDIMENTO, O.KMTOTALPERCORRIDO, O.R' +
        'ESUMO, O.CDTIPOOCORRENCIA, O.CDSUBTIPOOCORRENCIA, '
      
        '    O.OCORRENCIAPOLICIAL, O.ISOCORRENCIAPOLICIAL, O.DATAENCERRAM' +
        'ENTO, O.ISOCORRENCIAENCERRADA, CN.CHAVE'
      
        'FROM OCORRENCIA O  LEFT JOIN CONTRATO CN ON O.EQUIPAMENTO = CN.C' +
        'DCODIFICADOR WHERE O.CDOCORRENCIA = :CDOCORRENCIA;')
    UniDirectional = True
    Left = 430
    Top = 564
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDOCORRENCIA'
        ParamType = ptUnknown
      end>
    object IBQOcorrenciaCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
      Origin = 'OCORRENCIA.CDOCORRENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQOcorrenciaCDOCORRENCIAPAI: TIntegerField
      FieldName = 'CDOCORRENCIAPAI'
      Origin = 'OCORRENCIA.CDOCORRENCIAPAI'
    end
    object IBQOcorrenciaPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'OCORRENCIA.PORTACOM'
    end
    object IBQOcorrenciaNREVENTO: TIntegerField
      FieldName = 'NREVENTO'
      Origin = 'OCORRENCIA.NREVENTO'
    end
    object IBQOcorrenciaTIPOCTX: TIBStringField
      FieldName = 'TIPOCTX'
      Origin = 'OCORRENCIA.TIPOCTX'
      Size = 3
    end
    object IBQOcorrenciaCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'OCORRENCIA.CTX'
    end
    object IBQOcorrenciaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQOcorrenciaSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object IBQOcorrenciaDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'OCORRENCIA.DESTATUS'
      Size = 70
    end
    object IBQOcorrenciaNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'OCORRENCIA.NUMSETOR'
    end
    object IBQOcorrenciaLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'OCORRENCIA.LOCAL'
      Size = 100
    end
    object IBQOcorrenciaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'OCORRENCIA.CDCLIENTE'
    end
    object IBQOcorrenciaCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
      Origin = 'OCORRENCIA.CDORDEMSERVICO'
    end
    object IBQOcorrenciaDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'OCORRENCIA.DATACADASTRO'
    end
    object IBQOcorrenciaDATAEVENTO: TDateTimeField
      DisplayWidth = 20
      FieldName = 'DATAEVENTO'
      Origin = 'OCORRENCIA.DATAEVENTO'
    end
    object IBQOcorrenciaDATAATENDIMENTO: TDateTimeField
      FieldName = 'DATAATENDIMENTO'
    end
    object IBQOcorrenciaCDAGENTE: TIntegerField
      FieldName = 'CDAGENTE'
      Origin = 'OCORRENCIA.CDAGENTE'
    end
    object IBQOcorrenciaCDOPERADORABERTURA: TIntegerField
      FieldName = 'CDOPERADORABERTURA'
      Origin = 'OCORRENCIA.CDOPERADORABERTURA'
    end
    object IBQOcorrenciaCDOPERADORENCERRAMENTO: TIntegerField
      FieldName = 'CDOPERADORENCERRAMENTO'
      Origin = 'OCORRENCIA.CDOPERADORENCERRAMENTO'
    end
    object IBQOcorrenciaHORASAIDAEMP: TTimeField
      FieldName = 'HORASAIDAEMP'
      Origin = 'OCORRENCIA.HORASAIDAEMP'
    end
    object IBQOcorrenciaHORASAIDALOCAL: TTimeField
      FieldName = 'HORASAIDALOCAL'
      Origin = 'OCORRENCIA.HORASAIDALOCAL'
    end
    object IBQOcorrenciaHORAABERTURALACRE: TTimeField
      FieldName = 'HORAABERTURALACRE'
      Origin = 'OCORRENCIA.HORAABERTURALACRE'
    end
    object IBQOcorrenciaKMSAIDA: TIBBCDField
      FieldName = 'KMSAIDA'
      Origin = 'OCORRENCIA.KMSAIDA'
      Precision = 18
      Size = 4
    end
    object IBQOcorrenciaHORACHEGADALOCAL: TTimeField
      FieldName = 'HORACHEGADALOCAL'
      Origin = 'OCORRENCIA.HORACHEGADALOCAL'
    end
    object IBQOcorrenciaHORACHEGADAEMP: TTimeField
      FieldName = 'HORACHEGADAEMP'
      Origin = 'OCORRENCIA.HORACHEGADAEMP'
    end
    object IBQOcorrenciaLACRE: TIBStringField
      FieldName = 'LACRE'
      Origin = 'OCORRENCIA.LACRE'
    end
    object IBQOcorrenciaKMRETORNO: TIBBCDField
      FieldName = 'KMRETORNO'
      Origin = 'OCORRENCIA.KMRETORNO'
      Precision = 18
      Size = 4
    end
    object IBQOcorrenciaTEMPODESOLOCAMENTO: TTimeField
      FieldName = 'TEMPODESOLOCAMENTO'
      Origin = 'OCORRENCIA.TEMPODESOLOCAMENTO'
    end
    object IBQOcorrenciaTEMPORETORNO: TTimeField
      FieldName = 'TEMPORETORNO'
      Origin = 'OCORRENCIA.TEMPORETORNO'
    end
    object IBQOcorrenciaTEMPOATENDIMENTO: TTimeField
      FieldName = 'TEMPOATENDIMENTO'
      Origin = 'OCORRENCIA.TEMPOATENDIMENTO'
    end
    object IBQOcorrenciaKMTOTALPERCORRIDO: TIBBCDField
      FieldName = 'KMTOTALPERCORRIDO'
      Origin = 'OCORRENCIA.KMTOTALPERCORRIDO'
      Precision = 18
      Size = 4
    end
    object IBQOcorrenciaRESUMO: TIBStringField
      FieldName = 'RESUMO'
      Origin = 'OCORRENCIA.RESUMO'
      Size = 1000
    end
    object IBQOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'OCORRENCIA.CDTIPOOCORRENCIA'
    end
    object IBQOcorrenciaCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
      Origin = 'OCORRENCIA.CDSUBTIPOOCORRENCIA'
    end
    object IBQOcorrenciaOCORRENCIAPOLICIAL: TIBStringField
      FieldName = 'OCORRENCIAPOLICIAL'
      Origin = 'OCORRENCIA.OCORRENCIAPOLICIAL'
      Size = 1000
    end
    object IBQOcorrenciaISOCORRENCIAPOLICIAL: TIntegerField
      FieldName = 'ISOCORRENCIAPOLICIAL'
      Origin = 'OCORRENCIA.ISOCORRENCIAPOLICIAL'
    end
    object IBQOcorrenciaDATAENCERRAMENTO: TDateTimeField
      FieldName = 'DATAENCERRAMENTO'
      Origin = 'OCORRENCIA.DATAENCERRAMENTO'
    end
    object IBQOcorrenciaISOCORRENCIAENCERRADA: TIntegerField
      FieldName = 'ISOCORRENCIAENCERRADA'
      Origin = 'OCORRENCIA.ISOCORRENCIAENCERRADA'
    end
    object IBQOcorrenciaCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = 'CONTRATO.CHAVE'
    end
  end
  object DSPOcorrencia: TDataSetProvider
    DataSet = IBQOcorrencia
    Constraints = True
    UpdateMode = upWhereKeyOnly
    OnGetTableName = DSPOcorrenciaGetTableName
    Left = 460
    Top = 564
  end
  object CDSOcorrencia: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CDOCORRENCIA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CDOCORRENCIAPAI'
        DataType = ftInteger
      end
      item
        Name = 'PORTACOM'
        DataType = ftInteger
      end
      item
        Name = 'NREVENTO'
        DataType = ftInteger
      end
      item
        Name = 'TIPOCTX'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CTX'
        DataType = ftInteger
      end
      item
        Name = 'EQUIPAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DESTATUS'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'NUMSETOR'
        DataType = ftInteger
      end
      item
        Name = 'LOCAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'CDORDEMSERVICO'
        DataType = ftInteger
      end
      item
        Name = 'DATACADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAEVENTO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAATENDIMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'CDAGENTE'
        DataType = ftInteger
      end
      item
        Name = 'CDOPERADORABERTURA'
        DataType = ftInteger
      end
      item
        Name = 'CDOPERADORENCERRAMENTO'
        DataType = ftInteger
      end
      item
        Name = 'HORASAIDAEMP'
        DataType = ftTime
      end
      item
        Name = 'HORASAIDALOCAL'
        DataType = ftTime
      end
      item
        Name = 'HORAABERTURALACRE'
        DataType = ftTime
      end
      item
        Name = 'KMSAIDA'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'HORACHEGADALOCAL'
        DataType = ftTime
      end
      item
        Name = 'HORACHEGADAEMP'
        DataType = ftTime
      end
      item
        Name = 'LACRE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KMRETORNO'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'TEMPODESOLOCAMENTO'
        DataType = ftTime
      end
      item
        Name = 'TEMPORETORNO'
        DataType = ftTime
      end
      item
        Name = 'TEMPOATENDIMENTO'
        DataType = ftTime
      end
      item
        Name = 'KMTOTALPERCORRIDO'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'RESUMO'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'CDTIPOOCORRENCIA'
        DataType = ftInteger
      end
      item
        Name = 'CDSUBTIPOOCORRENCIA'
        DataType = ftInteger
      end
      item
        Name = 'OCORRENCIAPOLICIAL'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'ISOCORRENCIAPOLICIAL'
        DataType = ftInteger
      end
      item
        Name = 'DATAENCERRAMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'ISOCORRENCIAENCERRADA'
        DataType = ftInteger
      end
      item
        Name = 'CHAVE'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSPOcorrencia'
    StoreDefs = True
    Left = 490
    Top = 564
    object CDSOcorrenciaCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
      Required = True
    end
    object CDSOcorrenciaCDOCORRENCIAPAI: TIntegerField
      FieldName = 'CDOCORRENCIAPAI'
    end
    object CDSOcorrenciaPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      ReadOnly = True
    end
    object CDSOcorrenciaNREVENTO: TIntegerField
      FieldName = 'NREVENTO'
      ReadOnly = True
    end
    object CDSOcorrenciaTIPOCTX: TStringField
      FieldName = 'TIPOCTX'
      ReadOnly = True
      Size = 3
    end
    object CDSOcorrenciaCTX: TIntegerField
      FieldName = 'CTX'
      ReadOnly = True
    end
    object CDSOcorrenciaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      ReadOnly = True
    end
    object CDSOcorrenciaSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 4
    end
    object CDSOcorrenciaDESTATUS: TStringField
      FieldName = 'DESTATUS'
      ReadOnly = True
      Size = 70
    end
    object CDSOcorrenciaNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      ReadOnly = True
    end
    object CDSOcorrenciaLOCAL: TStringField
      FieldName = 'LOCAL'
      ReadOnly = True
      Size = 100
    end
    object CDSOcorrenciaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      OnChange = CDSOcorrenciaCDCLIENTEChange
    end
    object CDSOcorrenciaCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
    end
    object CDSOcorrenciaDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object CDSOcorrenciaDATAEVENTO: TDateTimeField
      DisplayWidth = 20
      FieldName = 'DATAEVENTO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
      EditMask = '99/99/9999 99:99;1;_'
    end
    object CDSOcorrenciaDATAATENDIMENTO: TDateTimeField
      FieldName = 'DATAATENDIMENTO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
      EditMask = '99/99/9999 99:99;1;_'
    end
    object CDSOcorrenciaCDAGENTE: TIntegerField
      FieldName = 'CDAGENTE'
    end
    object CDSOcorrenciaCDOPERADORABERTURA: TIntegerField
      FieldName = 'CDOPERADORABERTURA'
    end
    object CDSOcorrenciaCDOPERADORENCERRAMENTO: TIntegerField
      FieldName = 'CDOPERADORENCERRAMENTO'
    end
    object CDSOcorrenciaHORASAIDAEMP: TTimeField
      FieldName = 'HORASAIDAEMP'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaHORASAIDALOCAL: TTimeField
      FieldName = 'HORASAIDALOCAL'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaHORAABERTURALACRE: TTimeField
      FieldName = 'HORAABERTURALACRE'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaKMSAIDA: TBCDField
      FieldName = 'KMSAIDA'
      Precision = 18
    end
    object CDSOcorrenciaHORACHEGADALOCAL: TTimeField
      FieldName = 'HORACHEGADALOCAL'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaHORACHEGADAEMP: TTimeField
      FieldName = 'HORACHEGADAEMP'
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object CDSOcorrenciaLACRE: TStringField
      FieldName = 'LACRE'
    end
    object CDSOcorrenciaKMRETORNO: TBCDField
      FieldName = 'KMRETORNO'
      Precision = 18
    end
    object CDSOcorrenciaTEMPODESOLOCAMENTO: TTimeField
      FieldName = 'TEMPODESOLOCAMENTO'
    end
    object CDSOcorrenciaTEMPORETORNO: TTimeField
      FieldName = 'TEMPORETORNO'
    end
    object CDSOcorrenciaTEMPOATENDIMENTO: TTimeField
      FieldName = 'TEMPOATENDIMENTO'
    end
    object CDSOcorrenciaKMTOTALPERCORRIDO: TBCDField
      FieldName = 'KMTOTALPERCORRIDO'
      Precision = 18
    end
    object CDSOcorrenciaRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 1000
    end
    object CDSOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
    end
    object CDSOcorrenciaCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
    end
    object CDSOcorrenciaOCORRENCIAPOLICIAL: TStringField
      FieldName = 'OCORRENCIAPOLICIAL'
      Size = 1000
    end
    object CDSOcorrenciaISOCORRENCIAPOLICIAL: TIntegerField
      FieldName = 'ISOCORRENCIAPOLICIAL'
    end
    object CDSOcorrenciaDATAENCERRAMENTO: TDateTimeField
      FieldName = 'DATAENCERRAMENTO'
    end
    object CDSOcorrenciaISOCORRENCIAENCERRADA: TIntegerField
      FieldName = 'ISOCORRENCIAENCERRADA'
    end
    object CDSOcorrenciaCHAVE: TStringField
      FieldName = 'CHAVE'
      ReadOnly = True
    end
    object CDSOcorrenciaNMAGENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NMAGENTE'
      LookupDataSet = CDSAgente
      LookupKeyFields = 'CDUSUARIO'
      LookupResultField = 'LOGIN'
      KeyFields = 'CDAGENTE'
      Lookup = True
    end
    object CDSOcorrenciaNMOPERADORA: TStringField
      FieldKind = fkLookup
      FieldName = 'NMOPERADORA'
      LookupDataSet = CDSOperador
      LookupKeyFields = 'CDUSUARIO'
      LookupResultField = 'LOGIN'
      KeyFields = 'CDOPERADORABERTURA'
      Lookup = True
    end
    object CDSOcorrenciaDETIPOOCORRENCIA: TStringField
      FieldKind = fkLookup
      FieldName = 'DETIPOOCORRENCIA'
      LookupDataSet = CDSTipoOcorrencia
      LookupKeyFields = 'CDTIPOOCORRENCIA'
      LookupResultField = 'DETIPOOCORRENCIA'
      KeyFields = 'CDTIPOOCORRENCIA'
      Lookup = True
    end
    object CDSOcorrenciaDESUBTIPOOCORRENCIA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESUBTIPOOCORRENCIA'
      LookupDataSet = CDSSubTipoOcorrencia
      LookupKeyFields = 'CDSUBTIPOOCORRENCIA'
      LookupResultField = 'DESUBTIPOOCORRENCIA'
      KeyFields = 'CDSUBTIPOOCORRENCIA'
      Lookup = True
    end
  end
  object DSOcorrencia: TDataSource
    DataSet = CDSOcorrencia
    Left = 400
    Top = 564
  end
  object IBTOperador: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 24
    Top = 595
  end
  object IBQOperador: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOperador
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDUSUARIO, LOGIN FROM USUARIO WHERE CDTIPOUSUARIO = 1 ORD' +
        'ER BY LOGIN')
    UniDirectional = True
    Left = 56
    Top = 595
    object IntegerField9: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQOperadorLOGIN: TIBStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object DSPOperador: TDataSetProvider
    DataSet = IBQOperador
    Constraints = True
    Left = 88
    Top = 595
  end
  object CDSOperador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOperador'
    Left = 120
    Top = 595
    object IntegerField10: TIntegerField
      FieldName = 'CDUSUARIO'
      Origin = 'USUARIO.CDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSOperadorLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'USUARIO.LOGIN'
    end
  end
  object IBQProcedimeto: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTProcedimento
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDCLIENTE, PROCEDIMENTOS FROM CLIENTE WHERE CDCLIENTE = :' +
        'CDCLIENTE;')
    UniDirectional = True
    Left = 729
    Top = 566
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQProcedimetoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQProcedimetoPROCEDIMENTOS: TIBStringField
      FieldName = 'PROCEDIMENTOS'
      Origin = 'CLIENTE.PROCEDIMENTOS'
      Size = 2000
    end
  end
  object CDSProcedimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPProcedimento'
    Left = 788
    Top = 566
    object CDSProcedimentoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSProcedimentoPROCEDIMENTOS: TStringField
      FieldName = 'PROCEDIMENTOS'
      Size = 2000
    end
  end
  object DSProcedimeto: TDataSource
    DataSet = CDSProcedimento
    Left = 669
    Top = 566
  end
  object DSPProcedimento: TDataSetProvider
    DataSet = IBQProcedimeto
    Constraints = True
    Left = 758
    Top = 566
  end
  object DSLinkCliente: TDataSource
    DataSet = IBQCliente
    Left = 199
    Top = 564
  end
  object CDSTipoOcorrencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTipoOcorrencia'
    Left = 627
    Top = 565
    object CDSTipoOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA.CDTIPOOCORRENCIA'
      Required = True
    end
    object CDSTipoOcorrenciaDETIPOOCORRENCIA: TStringField
      FieldName = 'DETIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA.DETIPOOCORRENCIA'
      Size = 30
    end
  end
  object DSPTipoOcorrencia: TDataSetProvider
    DataSet = IBQTipoOcorrencia
    Constraints = True
    Left = 595
    Top = 565
  end
  object IBQTipoOcorrencia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTTipoOcorrencia
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDTIPOOCORRENCIA, DETIPOOCORRENCIA FROM TIPOOCORRENCIA OR' +
        'DER BY DETIPOOCORRENCIA;')
    UniDirectional = True
    Left = 563
    Top = 565
    object IBQTipoOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA.CDTIPOOCORRENCIA'
      Required = True
    end
    object IBQTipoOcorrenciaDETIPOOCORRENCIA: TIBStringField
      FieldName = 'DETIPOOCORRENCIA'
      Origin = 'TIPOOCORRENCIA.DETIPOOCORRENCIA'
      Size = 30
    end
  end
  object IBTTipoOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 531
    Top = 565
  end
  object IBTSubTipoOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 531
    Top = 596
  end
  object IBQSubTipoOcorrencia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSubTipoOcorrencia
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDSUBTIPOOCORRENCIA, CDTIPOOCORRENCIA, DESUBTIPOOCORRENCI' +
        'A FROM SUBTIPOOCORRENCIA ORDER BY DESUBTIPOOCORRENCIA;')
    UniDirectional = True
    Left = 563
    Top = 596
    object IBQSubTipoOcorrenciaCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.CDSUBTIPOOCORRENCIA'
      Required = True
    end
    object IBQSubTipoOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.CDTIPOOCORRENCIA'
    end
    object IBQSubTipoOcorrenciaDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
  end
  object DSPSubTipoOcorrencia: TDataSetProvider
    DataSet = IBQSubTipoOcorrencia
    Constraints = True
    Left = 595
    Top = 596
  end
  object CDSSubTipoOcorrencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSubTipoOcorrencia'
    Left = 627
    Top = 596
    object CDSSubTipoOcorrenciaCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.CDSUBTIPOOCORRENCIA'
      Required = True
    end
    object CDSSubTipoOcorrenciaCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.CDTIPOOCORRENCIA'
    end
    object CDSSubTipoOcorrenciaDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
  end
  object DSSetores: TDataSource
    DataSet = CDSSetores
    Left = 400
    Top = 596
  end
  object IBQSetores: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSetores
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT S.NUMSETOR, S.LOCAL FROM SETOR S'
      'INNER JOIN CONTRATO CO ON CO.CDCONTRATO = S.CDCONTRATO'
      'WHERE CO.CDCODIFICADOR = :CDCODIFICADOR ORDER BY S.NUMSETOR;')
    UniDirectional = True
    Left = 430
    Top = 596
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDCODIFICADOR'
        ParamType = ptUnknown
      end>
    object IBQSetoresLOCAL: TIBStringField
      FieldName = 'LOCAL'
      Origin = 'SETOR.LOCAL'
      Size = 100
    end
    object IBQSetoresNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Origin = 'SETOR.NUMSETOR'
      Required = True
    end
  end
  object DSPSetores: TDataSetProvider
    DataSet = IBQSetores
    Constraints = True
    Left = 460
    Top = 596
  end
  object CDSSetores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSetores'
    Left = 490
    Top = 596
    object CDSSetoresLOCAL: TStringField
      FieldName = 'LOCAL'
      Size = 100
    end
    object CDSSetoresNUMSETOR: TIntegerField
      FieldName = 'NUMSETOR'
      Required = True
    end
  end
  object IBTSetores: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 370
    Top = 596
  end
  object IBTProcedimento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 699
    Top = 566
  end
  object IBSPGenIdOcorrencia: TIBStoredProc
    Database = DModule.IBCONAzsim
    Transaction = IBTGenIdOcorrencia
    StoredProcName = 'SP_GEN_OCORRENCIA_ID'
    Left = 490
    Top = 533
  end
  object IBTGenIdOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 459
    Top = 533
  end
  object IBQContato: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTCliente
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSLinkCliente
    SQL.Strings = (
      
        'SELECT CDCLIENTECONTATO, CDCLIENTE, NMCONTATO, CDTIPOCONTATO, PA' +
        'RENTESCO, ENDERECO, BAIRRO, CIDADE, UF, CEP, FONE1, FONE1OBS, FO' +
        'NE2, FONE2OBS, FONE3, FONE3OBS, FONE4, FONE4OBS, OBSERVACAO, SEN' +
        'HA, CONTRASENHA, DATANASCIMENTO FROM CLIENTECONTATO WHERE CDCLIE' +
        'NTE= :CDCLIENTE')
    UniDirectional = True
    Left = 198
    Top = 596
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQContatoCDCLIENTECONTATO: TIntegerField
      FieldName = 'CDCLIENTECONTATO'
      Origin = 'CLIENTECONTATO.CDCLIENTECONTATO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQContatoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTECONTATO.CDCLIENTE'
    end
    object IBQContatoNMCONTATO: TIBStringField
      FieldName = 'NMCONTATO'
      Origin = 'CLIENTECONTATO.NMCONTATO'
      Size = 60
    end
    object IBQContatoCDTIPOCONTATO: TIntegerField
      FieldName = 'CDTIPOCONTATO'
      Origin = 'CLIENTECONTATO.CDTIPOCONTATO'
    end
    object IBQContatoPARENTESCO: TIBStringField
      FieldName = 'PARENTESCO'
      Origin = 'CLIENTECONTATO.PARENTESCO'
      Size = 30
    end
    object IBQContatoENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTECONTATO.ENDERECO'
      Size = 60
    end
    object IBQContatoBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTECONTATO.BAIRRO'
      Size = 30
    end
    object IBQContatoCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTECONTATO.CIDADE'
      Size = 30
    end
    object IBQContatoUF: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIENTECONTATO.UF'
      Size = 2
    end
    object IBQContatoCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTECONTATO.CEP'
      Size = 9
    end
    object IBQContatoOBSERVACAO: TIBStringField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTECONTATO.OBSERVACAO'
      Size = 600
    end
    object IBQContatoFONE1: TIBStringField
      FieldName = 'FONE1'
      Origin = 'CLIENTECONTATO.FONE1'
      Size = 13
    end
    object IBQContatoFONE1OBS: TIBStringField
      FieldName = 'FONE1OBS'
      Origin = 'CLIENTECONTATO.FONE1OBS'
      Size = 30
    end
    object IBQContatoFONE2: TIBStringField
      FieldName = 'FONE2'
      Origin = 'CLIENTECONTATO.FONE2'
      Size = 13
    end
    object IBQContatoFONE2OBS: TIBStringField
      FieldName = 'FONE2OBS'
      Origin = 'CLIENTECONTATO.FONE2OBS'
      Size = 30
    end
    object IBQContatoFONE3: TIBStringField
      FieldName = 'FONE3'
      Origin = 'CLIENTECONTATO.FONE3'
      Size = 13
    end
    object IBQContatoFONE3OBS: TIBStringField
      FieldName = 'FONE3OBS'
      Origin = 'CLIENTECONTATO.FONE3OBS'
      Size = 30
    end
    object IBQContatoFONE4: TIBStringField
      FieldName = 'FONE4'
      Origin = 'CLIENTECONTATO.FONE4'
      Size = 13
    end
    object IBQContatoFONE4OBS: TIBStringField
      FieldName = 'FONE4OBS'
      Origin = 'CLIENTECONTATO.FONE4OBS'
      Size = 30
    end
    object IBQContatoSENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = 'CLIENTECONTATO.SENHA'
      Size = 100
    end
    object IBQContatoCONTRASENHA: TIBStringField
      FieldName = 'CONTRASENHA'
      Origin = 'CLIENTECONTATO.CONTRASENHA'
      Size = 100
    end
    object IBQContatoDATANASCIMENTO: TDateField
      FieldName = 'DATANASCIMENTO'
      Origin = 'CLIENTECONTATO.DATANASCIMENTO'
    end
  end
end
