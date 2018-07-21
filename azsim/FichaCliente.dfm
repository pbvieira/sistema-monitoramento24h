object FFichaCliente: TFFichaCliente
  Left = 452
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AZSIM'
  ClientHeight = 596
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTituloForm: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Consulta r'#225'pida - dados do cliente'
    Color = 11367990
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pcDadosCliente: TPageControl
    Left = 3
    Top = 40
    Width = 521
    Height = 552
    ActivePage = TSSetores
    Style = tsFlatButtons
    TabIndex = 2
    TabOrder = 1
    TabStop = False
    object tbsDadosBasicos: TTabSheet
      Caption = 'Cliente'
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 513
        Height = 521
        Align = alClient
        TabOrder = 0
        object Label2: TLabel
          Left = 7
          Top = 48
          Width = 102
          Height = 13
          Caption = 'Nome / Raz'#227'o Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 7
          Top = 87
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
          Top = 126
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
          Top = 126
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
          Top = 163
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
        object Label12: TLabel
          Left = 7
          Top = 7
          Width = 53
          Height = 13
          Caption = 'Codificador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 78
          Top = 7
          Width = 31
          Height = 13
          Caption = 'Chave'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 200
          Width = 36
          Height = 13
          Caption = 'Fone(1)'
          FocusControl = EdtFone1
        end
        object Label34: TLabel
          Left = 8
          Top = 238
          Width = 36
          Height = 13
          Caption = 'Fone(2)'
          FocusControl = EdtFone2
        end
        object Label35: TLabel
          Left = 8
          Top = 274
          Width = 36
          Height = 13
          Caption = 'Fone(3)'
          FocusControl = EdtFone3
        end
        object Label36: TLabel
          Left = 96
          Top = 200
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o (1)'
          FocusControl = EdtFone1Obs
        end
        object Label37: TLabel
          Left = 96
          Top = 238
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o (2)'
          FocusControl = EdtFone2Obs
        end
        object Label38: TLabel
          Left = 96
          Top = 274
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o (3)'
          FocusControl = EdtFone3Obs
        end
        object Label39: TLabel
          Left = 249
          Top = 200
          Width = 36
          Height = 13
          Caption = 'Fone(4)'
          FocusControl = EdtFone4
        end
        object Label40: TLabel
          Left = 249
          Top = 238
          Width = 36
          Height = 13
          Caption = 'Fone(5)'
          FocusControl = EdtFone5
        end
        object Label41: TLabel
          Left = 249
          Top = 274
          Width = 36
          Height = 13
          Caption = 'Fone(6)'
          FocusControl = EdtFone6
        end
        object Label42: TLabel
          Left = 337
          Top = 200
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o (4)'
          FocusControl = EdtFone4Obs
        end
        object Label43: TLabel
          Left = 337
          Top = 238
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o (5)'
          FocusControl = EdtFone5Obs
        end
        object Label44: TLabel
          Left = 337
          Top = 274
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o (6)'
          FocusControl = EdtFone6Obs
        end
        object Label46: TLabel
          Left = 10
          Top = 349
          Width = 201
          Height = 13
          Caption = 'Observa'#231#245'es do Cliente dados de Viagens'
          FocusControl = EdtFone3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 8
          Top = 310
          Width = 36
          Height = 13
          Caption = 'Fone(7)'
          FocusControl = EdtFone3
        end
        object Label48: TLabel
          Left = 96
          Top = 310
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o (7)'
          FocusControl = EdtFone3Obs
        end
        object Label49: TLabel
          Left = 249
          Top = 310
          Width = 36
          Height = 13
          Caption = 'Fone(8)'
          FocusControl = EdtFone6
        end
        object Label50: TLabel
          Left = 337
          Top = 310
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o (8)'
          FocusControl = EdtFone6Obs
        end
        object Label51: TLabel
          Left = 240
          Top = 48
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
        object EdtNmCliente: TDBEdit
          Left = 7
          Top = 64
          Width = 230
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'NMCLIENTE'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object EdtEndereco: TDBEdit
          Left = 7
          Top = 103
          Width = 480
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'ENDERECO'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 1
        end
        object EdtBairro: TDBEdit
          Left = 315
          Top = 142
          Width = 172
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'BAIRRO'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 2
        end
        object EdtCidade: TDBEdit
          Left = 7
          Top = 142
          Width = 305
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'CIDADE'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 3
        end
        object EdtPontoRef: TDBEdit
          Left = 8
          Top = 178
          Width = 479
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'PONTOREF'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 4
        end
        object EdtCodificador: TDBEdit
          Left = 7
          Top = 23
          Width = 67
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'CDCODIFICADOR'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 5
        end
        object EdtChave: TDBEdit
          Left = 76
          Top = 23
          Width = 105
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'CHAVE'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 6
        end
        object EdtFone1: TDBEdit
          Left = 8
          Top = 216
          Width = 85
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONE1'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object EdtFone2: TDBEdit
          Left = 8
          Top = 253
          Width = 85
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONE2'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object EdtFone3: TDBEdit
          Left = 8
          Top = 289
          Width = 85
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONE3'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object EdtFone1Obs: TDBEdit
          Left = 96
          Top = 216
          Width = 150
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONEOBS1'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 10
        end
        object EdtFone2Obs: TDBEdit
          Left = 96
          Top = 253
          Width = 150
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONEOBS2'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 11
        end
        object EdtFone3Obs: TDBEdit
          Left = 96
          Top = 289
          Width = 150
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONEOBS3'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 12
        end
        object EdtFone4: TDBEdit
          Left = 249
          Top = 216
          Width = 85
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONE4'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object EdtFone5: TDBEdit
          Left = 249
          Top = 253
          Width = 85
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONE5'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object EdtFone6: TDBEdit
          Left = 249
          Top = 289
          Width = 85
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONE6'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object EdtFone4Obs: TDBEdit
          Left = 337
          Top = 216
          Width = 150
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONEOBS4'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 16
        end
        object EdtFone5Obs: TDBEdit
          Left = 337
          Top = 253
          Width = 150
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONEOBS5'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 17
        end
        object EdtFone6Obs: TDBEdit
          Left = 337
          Top = 289
          Width = 150
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONEOBS6'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 18
        end
        object EdtObs: TDBMemo
          Left = 8
          Top = 365
          Width = 481
          Height = 132
          TabStop = False
          BevelKind = bkSoft
          BorderStyle = bsNone
          Color = 14155775
          DataField = 'OBSERVACAO'
          DataSource = DModuleCliente.DSConsCliente
          ScrollBars = ssVertical
          TabOrder = 19
        end
        object EdtFone7: TDBEdit
          Left = 8
          Top = 325
          Width = 85
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONE7'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
        object EdtFone7Obs: TDBEdit
          Left = 96
          Top = 325
          Width = 150
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONEOBS7'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 21
        end
        object EdtFone8: TDBEdit
          Left = 249
          Top = 325
          Width = 85
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONE8'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
        end
        object EdtFone8Obs: TDBEdit
          Left = 337
          Top = 325
          Width = 150
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'FONEOBS8'
          DataSource = DModuleCliente.DSConsCliente
          TabOrder = 23
        end
        object EdtNomeFantasia: TDBEdit
          Left = 240
          Top = 64
          Width = 247
          Height = 21
          TabStop = False
          Color = 14155775
          DataField = 'NMFANTASIA'
          DataSource = DModuleCliente.DSConsCliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
        end
      end
    end
    object TSContatos: TTabSheet
      Caption = '&Usu'#225'rios'
      object DBGContatos: TDBGrid
        Left = 0
        Top = 0
        Width = 513
        Height = 521
        TabStop = False
        Align = alClient
        DataSource = DModuleCliente.DSConsContato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGContatosDrawColumnCell
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
        Width = 513
        Height = 521
        TabStop = False
        Align = alClient
        DataSource = DModuleCliente.DSConsSetores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGSetoresDrawColumnCell
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
    object tbCentral: TTabSheet
      Caption = 'Central'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 513
        Height = 521
        Align = alClient
        TabOrder = 0
        DesignSize = (
          513
          521)
        object GrpNomeSelecionado: TGroupBox
          Left = 11
          Top = 12
          Width = 491
          Height = 133
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          object TXTModeloCentral: TDBText
            Left = 11
            Top = 45
            Width = 469
            Height = 17
            DataField = 'MODELOCENTRAL'
            DataSource = DModuleCliente.DSConsContrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object TXTLocalInstalacao: TDBText
            Left = 11
            Top = 88
            Width = 469
            Height = 17
            DataField = 'LOCALINSTALCENTRAL'
            DataSource = DModuleCliente.DSConsContrato
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label53: TLabel
            Left = 11
            Top = 24
            Width = 54
            Height = 16
            Caption = 'Central:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label54: TLabel
            Left = 11
            Top = 66
            Width = 119
            Height = 16
            Caption = 'Local instala'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
end
