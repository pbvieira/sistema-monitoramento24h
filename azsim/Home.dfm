object FHome: TFHome
  Left = 190
  Top = 127
  AutoScroll = False
  Caption = 'AZSIM - Sistema Integrado de Monitoramento - Vers'#227'o 1.0.0.34'
  ClientHeight = 595
  ClientWidth = 1169
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MMenuHome
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SBarHome: TStatusBar
    Left = 0
    Top = 576
    Width = 1169
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 250
      end
      item
        Width = 100
      end>
    SimplePanel = False
  end
  object PHome: TPanel
    Left = 0
    Top = 0
    Width = 1169
    Height = 576
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object PGCHome: TPageControl
      Left = 1
      Top = 1
      Width = 1167
      Height = 574
      ActivePage = TSRegistroManutencao
      Align = alClient
      TabIndex = 2
      TabOrder = 0
      object TSRegistroEventos: TTabSheet
        Caption = 'Registro de Eventos'
        ImageIndex = 1
        object BtnConsultar: TSpeedButton
          Left = 9
          Top = 67
          Width = 138
          Height = 22
          Caption = '&Executar Consulta'
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
          OnClick = BtnConsultarClick
        end
        object GBData: TGroupBox
          Left = 8
          Top = 0
          Width = 209
          Height = 62
          Caption = 'Selecione o Intervalo da Consulta'
          TabOrder = 0
          object Label3: TLabel
            Left = 106
            Top = 17
            Width = 48
            Height = 13
            Caption = 'Data Final'
          end
          object Label2: TLabel
            Left = 9
            Top = 17
            Width = 53
            Height = 13
            Caption = 'Data Inicial'
          end
          object EdtDataFinal: TDateTimePicker
            Left = 106
            Top = 32
            Width = 96
            Height = 21
            CalAlignment = dtaLeft
            Date = 42183.6729884259
            Format = 'dd/MM/yyyy'
            Time = 42183.6729884259
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
          object EdtDataInicial: TDateTimePicker
            Left = 9
            Top = 32
            Width = 96
            Height = 21
            CalAlignment = dtaLeft
            Date = 42183.6729884259
            Format = 'dd/MM/yyyy'
            Time = 42183.6729884259
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
        end
        object GBCliente: TGroupBox
          Left = 220
          Top = 0
          Width = 437
          Height = 62
          Caption = ' Cliente ou Codificador '
          TabOrder = 1
          object Label6: TLabel
            Left = 13
            Top = 17
            Width = 47
            Height = 13
            Caption = 'N'#186' Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 361
            Top = 17
            Width = 68
            Height = 13
            Caption = 'N'#186' Codificador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 85
            Top = 17
            Width = 78
            Height = 13
            Caption = 'Nome do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EdtCodCliente: TEdit
            Left = 12
            Top = 32
            Width = 70
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object EdtNome: TEdit
            Left = 84
            Top = 32
            Width = 274
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object EdtCodificador: TEdit
            Left = 360
            Top = 32
            Width = 70
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
        end
        object GBEstatus: TGroupBox
          Left = 660
          Top = 0
          Width = 343
          Height = 62
          Caption = ' Estatus ou Descri'#231#227'o'
          TabOrder = 2
          object Label5: TLabel
            Left = 9
            Top = 17
            Width = 35
            Height = 13
            Caption = 'Estatus'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 81
            Top = 17
            Width = 101
            Height = 13
            Caption = 'Descri'#231#227'o do Estatus'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EdtStatus: TEdit
            Left = 8
            Top = 33
            Width = 70
            Height = 21
            Hint = 'Exemplo: 0.0*'
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object EdtStatusDescricao: TEdit
            Left = 80
            Top = 33
            Width = 254
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object CkbAtualizar: TCheckBox
          Left = 150
          Top = 70
          Width = 268
          Height = 17
          Caption = 'Atualizar consulta automaticamente a cada segundo'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = CkbAtualizarClick
        end
        object PNLEventos: TPanel
          Left = 0
          Top = 96
          Width = 1159
          Height = 450
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 4
          object Splitter1: TSplitter
            Left = 0
            Top = 241
            Width = 1159
            Height = 8
            Cursor = crVSplit
            Align = alTop
            Beveled = True
          end
          object DBGEventos: TDBGrid
            Left = 0
            Top = 0
            Width = 1159
            Height = 241
            Align = alTop
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = DSEventos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
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
                FieldName = 'DATAEVENTO'
                Title.Caption = 'Data Evento'
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'CTX'
                Title.Caption = 'Ctx'
                Width = 35
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'PORTACOM'
                Title.Caption = 'Com'
                Width = 25
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'EQUIPAMENTO'
                Title.Caption = 'Codificador'
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CDCLIENTE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Caption = 'C'#243'd.'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMCLIENTE'
                Title.Caption = 'Cliente'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Caption = 'Status'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESTATUS'
                Title.Caption = 'Descri'#231#227'o'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ENDERECO'
                Title.Caption = 'Endere'#231'o'
                Width = 290
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CIDADE'
                Title.Caption = 'Cidade'
                Width = 1024
                Visible = True
              end>
          end
          object TPanel
            Left = 0
            Top = 249
            Width = 1159
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
          end
          object DBGOcorrencias: TDBGrid
            Left = 0
            Top = 290
            Width = 1159
            Height = 160
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = DSOcorrenciasAbertas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGOcorrenciasDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'DATAEVENTO'
                Title.Caption = 'Data Evento'
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'CTX'
                Title.Caption = 'Ctx'
                Width = 35
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'PORTACOM'
                Title.Caption = 'Com'
                Width = 25
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'EQUIPAMENTO'
                Title.Caption = 'Codificador'
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'CDCLIENTE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Caption = 'C'#243'd.'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMCLIENTE'
                Title.Caption = 'Cliente'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Caption = 'Status'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESTATUS'
                Title.Caption = 'Descri'#231#227'o'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ENDERECO'
                Title.Caption = 'Endere'#231'o'
                Width = 290
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CIDADE'
                Title.Caption = 'Cidade'
                Width = 1024
                Visible = True
              end>
          end
        end
      end
      object TSResgistroOcorrencia: TTabSheet
        Caption = 'Registro de Ocorr'#234'ncias'
        ImageIndex = 2
        object BtnConsultarOC: TSpeedButton
          Left = 9
          Top = 67
          Width = 138
          Height = 22
          Caption = '&Executar Consulta'
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
          OnClick = BtnConsultarOCClick
        end
        object BtnImprimirOC: TSpeedButton
          Left = 150
          Top = 67
          Width = 115
          Height = 22
          Caption = 'Imprimir'
          Enabled = False
          Flat = True
          Glyph.Data = {
            C6040000424DC60400000000000036040000280000000C0000000C0000000100
            0800000000009000000000000000000000000001000000000000E3A32700DE97
            0A00E6CB9D00E7AE3F00EDBE6600863B1A00EDE9E300EEDAB400EAD0A100C37C
            0000ECE1D0009F5A0000FFFFFF00FFFFFF000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000C0C09090909
            090909090C0C0C0B090C0C0C0C0C0C090B0C0B020505050505050505020B0B08
            0808080808080808080B0B070707070707070707070B0B0A0A0A0A0A0A0A0A0A
            0A0B0B060606060606060606060B0C0B0B0B0B0B0B0B0B0B0B0C0C0C010C0C0C
            0C0C0C010C0C0C0C000C0C0C0C0C0C030C0C0C0C000C0C0C0C0C03030C0C0C0C
            040404040404040C0C0C}
          Visible = False
          OnClick = BtnImprimirOCClick
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 0
          Width = 209
          Height = 62
          Caption = 'Selecione o Intervalo da Consulta'
          TabOrder = 0
          object Label1: TLabel
            Left = 106
            Top = 17
            Width = 48
            Height = 13
            Caption = 'Data Final'
          end
          object Label7: TLabel
            Left = 9
            Top = 17
            Width = 53
            Height = 13
            Caption = 'Data Inicial'
          end
          object EdtDataFinalOC: TDateTimePicker
            Left = 106
            Top = 32
            Width = 96
            Height = 21
            CalAlignment = dtaLeft
            Date = 42183.6729884259
            Format = 'dd/MM/yyyy'
            Time = 42183.6729884259
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
          object EdtDataInicialOC: TDateTimePicker
            Left = 9
            Top = 32
            Width = 96
            Height = 21
            CalAlignment = dtaLeft
            Date = 42183.6729884259
            Format = 'dd/MM/yyyy'
            Time = 42183.6729884259
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
        end
        object DBGOcorrenciasHist: TDBGrid
          Left = 0
          Top = 96
          Width = 1159
          Height = 450
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          Ctl3D = True
          DataSource = DSRelAtendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGOcorrenciasHistDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'DATAEVENTO'
              Title.Caption = 'Data Evento'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CTX'
              Title.Caption = 'Ctx'
              Width = 35
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PORTACOM'
              Title.Alignment = taCenter
              Title.Caption = 'Com'
              Width = 25
              Visible = True
            end
            item
              Alignment = taLeftJustify
              Expanded = False
              FieldName = 'EQUIPAMENTO'
              Title.Caption = 'Codificador'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CDCLIENTE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Caption = 'C'#243'd.'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMCLIENTE'
              Title.Caption = 'Cliente'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Title.Caption = 'Status'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESTATUS'
              Title.Caption = 'Descri'#231#227'o'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 290
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE'
              Title.Caption = 'Cidade'
              Width = 1024
              Visible = True
            end>
        end
        object GroupBox2: TGroupBox
          Left = 220
          Top = 0
          Width = 437
          Height = 62
          Caption = ' Cliente ou Codificador '
          TabOrder = 2
          object Label10: TLabel
            Left = 13
            Top = 17
            Width = 47
            Height = 13
            Caption = 'N'#186' Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 361
            Top = 17
            Width = 68
            Height = 13
            Caption = 'N'#186' Codificador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 85
            Top = 17
            Width = 78
            Height = 13
            Caption = 'Nome do Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EdtCodClienteOC: TEdit
            Left = 12
            Top = 32
            Width = 70
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object EdtNomeOC: TEdit
            Left = 84
            Top = 32
            Width = 274
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object EdtCodificadorOC: TEdit
            Left = 360
            Top = 32
            Width = 70
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
          end
        end
        object GroupBox3: TGroupBox
          Left = 660
          Top = 0
          Width = 343
          Height = 62
          Caption = ' Estatus ou Descri'#231#227'o'
          TabOrder = 3
          object Label13: TLabel
            Left = 9
            Top = 17
            Width = 35
            Height = 13
            Caption = 'Estatus'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 81
            Top = 17
            Width = 101
            Height = 13
            Caption = 'Descri'#231#227'o do Estatus'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object EdtStatusOC: TEdit
            Left = 8
            Top = 33
            Width = 70
            Height = 21
            Hint = 'Exemplo: 0.0*'
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object EdtStatusDescricaoOC: TEdit
            Left = 80
            Top = 33
            Width = 254
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
      end
      object TSRegistroManutencao: TTabSheet
        Caption = 'Registro de Manuten'#231#245'es Preventivas'
        ImageIndex = 1
        object Splitter3: TSplitter
          Left = 270
          Top = 41
          Width = 3
          Height = 505
          Cursor = crHSplit
        end
        object Panel2: TPanel
          Left = 273
          Top = 41
          Width = 886
          Height = 505
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 0
            Top = 300
            Width = 886
            Height = 8
            Cursor = crVSplit
            Align = alTop
            Beveled = True
          end
          object DBGClientesManutencao: TDBGrid
            Left = 0
            Top = 0
            Width = 886
            Height = 300
            Align = alTop
            BorderStyle = bsNone
            DataSource = DSIdentificaZero
            DefaultDrawing = False
            Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGClientesManutencaoDrawColumnCell
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'TOTAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Title.Caption = 'Total'
                Width = 50
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'PERCENTUAL'
                Title.Caption = 'Percentual'
                Width = 60
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'EQUIPAMENTO'
                Title.Caption = 'Codificador'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMCLIENTE'
                Title.Caption = 'Nome / Raz'#227'o Social'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBSERVACAO'
                Title.Caption = 'Observa'#231#227'o'
                Width = 2000
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 0
            Top = 308
            Width = 886
            Height = 29
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
          end
          object PGCOrdemServico: TPageControl
            Left = 0
            Top = 337
            Width = 886
            Height = 168
            ActivePage = TSEventos
            Align = alClient
            Style = tsFlatButtons
            TabIndex = 0
            TabOrder = 2
            object TSEventos: TTabSheet
              Caption = 'Todos Eventos'
              ImageIndex = 3
              object DBGCliConsEventos: TDBGrid
                Left = 0
                Top = 0
                Width = 878
                Height = 137
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = DSCliConsLogEvento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
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
                    FieldName = 'DATAEVENTO'
                    Title.Caption = 'Data Evento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CTX'
                    Title.Caption = 'Ctx'
                    Width = 35
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'PORTACOM'
                    Title.Caption = 'Com'
                    Width = 25
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'EQUIPAMENTO'
                    Title.Caption = 'Codificador'
                    Width = 60
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CDCLIENTE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'C'#243'd.'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NMCLIENTE'
                    Title.Caption = 'Cliente'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STATUS'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Status'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESTATUS'
                    Title.Caption = 'Descri'#231#227'o'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ENDERECO'
                    Title.Caption = 'Endere'#231'o'
                    Width = 290
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CIDADE'
                    Title.Caption = 'Cidade'
                    Width = 1024
                    Visible = True
                  end>
              end
            end
            object TSOrdensServico: TTabSheet
              Caption = 'Ordens Servi'#231'o'
              object DBGCliConsOrdensAbertas: TDBGrid
                Left = 0
                Top = 0
                Width = 872
                Height = 137
                Align = alClient
                BorderStyle = bsNone
                DataSource = DSCliConsOrdemServico
                Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = DBGCliConsOrdensAbertasDblClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SITUACAO'
                    Title.Caption = 'Situa'#231#227'o'
                    Width = 70
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CDORDEMSERVICO'
                    Title.Caption = 'C'#243'd.'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATACADASTRO'
                    Title.Caption = 'Data OS'
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'EQUIPAMENTO'
                    Title.Caption = 'Codificador'
                    Visible = True
                  end
                  item
                    Alignment = taLeftJustify
                    Expanded = False
                    FieldName = 'CDCLIENTE'
                    Title.Caption = 'C'#243'digo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NMCLIENTE'
                    Title.Caption = 'Cliente'
                    Width = 300
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DEORDEMSERVICO'
                    Title.Caption = 'Ordem Servi'#231'o'
                    Width = 800
                    Visible = True
                  end>
              end
            end
            object TSArmeDesarme: TTabSheet
              Caption = 'Arme Desarme'
              ImageIndex = 1
              object DBGCliConsArmeDesarme: TDBGrid
                Left = 0
                Top = 0
                Width = 872
                Height = 137
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = DSCliConsArmeDesarme
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
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
                    FieldName = 'DATAEVENTO'
                    Title.Caption = 'Data Evento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CTX'
                    Title.Caption = 'Ctx'
                    Width = 35
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'PORTACOM'
                    Title.Caption = 'Com'
                    Width = 25
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'EQUIPAMENTO'
                    Title.Caption = 'Codificador'
                    Width = 60
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CDCLIENTE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'C'#243'd.'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NMCLIENTE'
                    Title.Caption = 'Cliente'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STATUS'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Status'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESTATUS'
                    Title.Caption = 'Descri'#231#227'o'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ENDERECO'
                    Title.Caption = 'Endere'#231'o'
                    Width = 290
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CIDADE'
                    Title.Caption = 'Cidade'
                    Width = 1024
                    Visible = True
                  end>
              end
            end
            object TSOcorrencias: TTabSheet
              Caption = 'Ocorr'#234'ncias'
              ImageIndex = 2
              object DBGCliConsOcorrencias: TDBGrid
                Left = 0
                Top = 0
                Width = 878
                Height = 137
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = DSCliConsOcorrencia
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDblClick = DBGCliConsOcorrenciasDblClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DATAEVENTO'
                    Title.Caption = 'Data Evento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CTX'
                    Title.Caption = 'Ctx'
                    Width = 35
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'PORTACOM'
                    Title.Caption = 'Com'
                    Width = 25
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'EQUIPAMENTO'
                    Title.Caption = 'Codificador'
                    Width = 60
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CDCLIENTE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'C'#243'd.'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NMCLIENTE'
                    Title.Caption = 'Cliente'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'STATUS'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Status'
                    Width = 35
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESTATUS'
                    Title.Caption = 'Descri'#231#227'o'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ENDERECO'
                    Title.Caption = 'Endere'#231'o'
                    Width = 290
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CIDADE'
                    Title.Caption = 'Cidade'
                    Width = 1024
                    Visible = True
                  end>
              end
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 1159
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label15: TLabel
            Left = 160
            Top = 16
            Width = 693
            Height = 13
            Caption = 
              'Consulta realizada no intervalo dos '#250'ltimos 30 dias, basedo nas ' +
              'ordens de servi'#231'os, ocorr'#234'ncias atendidas e eventos de identific' +
              'a'#231#227'o das centrais. '
          end
          object BtnConsultarManutPreventivas: TSpeedButton
            Left = 9
            Top = 11
            Width = 138
            Height = 22
            Caption = '&Executar Consulta'
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
            OnClick = BtnConsultarManutPreventivasClick
          end
        end
        object TVEventosAnalisados: TTreeView
          Left = 0
          Top = 41
          Width = 270
          Height = 505
          Align = alLeft
          Images = DModule.ILForm12
          Indent = 19
          ReadOnly = True
          TabOrder = 2
          OnClick = TVEventosAnalisadosClick
        end
      end
    end
  end
  object MMenuHome: TMainMenu
    Left = 969
    Top = 171
    object MnCadastros: TMenuItem
      Caption = '&Cadastros'
      object MnCadCliente: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000C8FCFF0010AE
          E20001C1F6002692C40000C3F800AC6600009FF1FD00B36D000008B8ED0005BD
          F20017A5D8001E9BCE00A7610000B77000000AB6EA009BEFFD001BA0D30004C4
          F8006AE1FB0011ADE10015A7DA007AE5FC0010C7F8001B9FD20019A1D4002197
          CA002791C30055DBFB00FDF5E600F8E3BC0036D2F900FBEDD200FFFEFA00A25D
          0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000222121212103
          110321212122220C1D1D1D0B1E0B1D1D0C2222051F1F1F0A120A1F1F05222207
          1C1C1C010F011C1C0722220D20202008000820200D221A041A2222020202221A
          041A19161619222222221916161922171E1E172222171E1E17222210141B1B14
          141B1B142222221800181515151501222222221800180E06060E222222222213
          13132209092222222222}
        Caption = '&Clientes'
        ShortCut = 113
        OnClick = MnCadClienteClick
      end
      object MnCadContrato: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000F2E4CB00BC86
          3500E4B66500FEFCFB00C5914000D1984B00E6CEA900F1E2C900F9F2E5009B5F
          0C00F0E2CA00FFFFFE00A2651500FAF5ED00F9EEE900C98E4300E5CFA900FEFD
          FB00FEFCFA00F7EBDB00F6EBD900AA712000DEAF6300EEDDBE00F2E4CE00CF9C
          4B00A3681600F4E6D700D3995500EAD6B600FDFAF900ECD7B500FCFAF400F4E8
          D500DBA85900D6A65400B47B2900E9D2AE009B5C0D00CE9C4B00F8F1E500DFB7
          8B00F5EBD900FBF5ED00F9EFE800CE9B4A00DEAE5D00F4E6D100EEDCBB00F8F1
          E300F7EBE100FBF6F400EAD0B400CE9B4B00FCF9F500F6EDDC00FBF5EC00ECD8
          B600F7EDDC00AA6F1E00E6CFA900EDDBBF00F8EFE800F0E0C700B47B2A00EFDF
          C600F9EFEA00F6E8DD00F2E3CB00F6EDDD00E8BB6A0091520000FFFFFF000000
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
          0000000000000000000000000000000000000000000000000000484747474747
          474747474848480939301F063C1025264848481A1747474747471D0C48484815
          3F44440044003D3B484848402F474747474707244848480114453A3745452101
          484848043128082A180A410448484819380D2B1B0F35272D484848233E203643
          0534291C4848482E4211030E2213161E48484802320B122C0246334848484846
          46464646460348484848}
        Caption = 'C&ontratos'
        ShortCut = 114
        OnClick = MnCadContratoClick
      end
      object MnCadProcedimento: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000CE8C1500F2C9
          7B00E2AE5100D4972900B36D0000A15C0000C37C0000FFFFFF00FFFFFF000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000070707070505
          0707070707070707070505050507070707070707050500000505070707070705
          0503030303050507070707040303030303030505070707040202040402020205
          0407070402040404040202020407070606060707060601010607070606070707
          0706060106070706070707070707060606070707070707070707070606070707
          07070707070707070607}
        Caption = '&Procedimentos'
        OnClick = MnCadProcedimentoClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MnUsuarios: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          08000000000090000000000000000000000000010000000000001AA1D4000FB0
          E30012ACDF0052DAFA000BB4E90004BDF20008B8ED0041D5FA0016A6D9002494
          C6002099CC002790C3001EA0D3001D9ED0001ACAF8002ED0F900278FC20005C4
          F800B6F6FE0001C2F6008DEBFC007AE6FC00A0F0FD0068E0FB0044548F00FFFF
          FF00FFFFFF000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000191919101010
          10100B191919191909111111111111091919190A0E0E181818180E0E0A190C0F
          0F1819191919180F0F0D00071819191919191918070008031818181818181818
          0308021717171717171717171702011515151815151815151501041414141814
          1418141414041906161616161616161606191919051212121212120519191919
          19131313131313191919}
        Caption = '&Usu'#225'rios'
        OnClick = MnUsuariosClick
      end
      object MnFiliais: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          080000000000900000000000000000000000000100000000000000186F00879C
          EF005160E4001D25DA00FFFFFF00000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000040004040404
          0404040404040400040404040404040404040400040404040404040404040400
          0404040404030303040404030404040403020102030404030303030303020102
          0304040302020102030201020304040302020102030201020304040302020102
          0303030303040403020201020304040403040403030201030304040404040404
          03030303040404040404}
        Caption = '&Filiais'
        OnClick = MnFiliaisClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MnSair: TMenuItem
        Caption = '&Sair'
        OnClick = MnSairClick
      end
    end
    object MnConsultas: TMenuItem
      Caption = 'C&onsultas'
      object MnConsClientes: TMenuItem
        Bitmap.Data = {
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
        Caption = '&Clientes'
        ShortCut = 16460
        OnClick = MnConsClientesClick
      end
    end
    object MnMonitorSerial: TMenuItem
      Caption = 'Monitor Serial'
      object MnMonitor1: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM1'
        OnClick = MnMonitor1Click
      end
      object MnMonitor2: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM2'
        OnClick = MnMonitor2Click
      end
      object MnMonitor3: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM3'
        OnClick = MnMonitor3Click
      end
      object MnMonitor4: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM4'
        OnClick = MnMonitor4Click
      end
      object MnMonitor5: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM5'
        OnClick = MnMonitor5Click
      end
      object MnMonitor6: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM6'
        OnClick = MnMonitor6Click
      end
      object MnMonitor7: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM7'
        OnClick = MnMonitor7Click
      end
      object MnMonitor8: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM8'
        Visible = False
        OnClick = MnMonitor8Click
      end
      object MnMonitor9: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM9'
        Visible = False
        OnClick = MnMonitor9Click
      end
      object MnMonitor10: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM10'
        Visible = False
        OnClick = MnMonitor10Click
      end
      object MnMonitor11: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM11'
        Visible = False
        OnClick = MnMonitor11Click
      end
      object MnMonitor12: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM12'
        Visible = False
        OnClick = MnMonitor12Click
      end
      object MnMonitor13: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM13'
        Visible = False
        OnClick = MnMonitor13Click
      end
      object MnMonitor14: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM14'
        Visible = False
        OnClick = MnMonitor14Click
      end
      object MnMonitor15: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM15'
        Visible = False
        OnClick = MnMonitor15Click
      end
      object MnMonitor16: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000B7700000CB89
          16009F5A0000E5B35900AB650000C9923D00BF852F00B2741C00EBBD6800D599
          2E00FDF6E800BF780000A35E0000DDAD5B00FAE8C900F8E3BB00EABE6D00FFFD
          F900A15D0300FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000131313131312
          0303121313131313131313020101021313131313101010101010101010101313
          0D0F0F0F0F0F0F0F0F0D10100D0E0C0C0C0C0C0C0E0D0D0F050E040909090904
          0E050D0E060A0008080808000A06050E070A0B0B0B0B0B0B0A07060A12111111
          111111111112070A121212121212121212121211111111111111111213131212
          12121212121212121313}
        Caption = 'Monitor Serial COM16'
        Visible = False
        OnClick = MnMonitor16Click
      end
    end
    object MnConfiguracao: TMenuItem
      Caption = 'Co&nfigura'#231#227'o'
      Visible = False
      object MnCadCodificador: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          08000000000090000000000000000000000000010000000000007373EB009898
          FA00DEAC4A0023C380001BB27300F1C56F00D2942100F1C574001D25DA000092
          1F009F5A0000FFFFFF0000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000070707070707
          07070707070708000008090404090A06060A08000008090404090A06060A0800
          0108090404090A06060A08010108090403090A06020A08010108090303090A02
          020A08080808090303090A02020A0B0B0B0B090303090A02050A0B0B0B0B0909
          09090A05050A0B0B0B0B0B0B0B0B0A05050A0B0B0B0B0B0B0B0B0A05050A0B0B
          0B0B0B0B0B0B0A0A0A0A}
        Caption = 'Cadastrar Codificadores'
        OnClick = MnCadCodificadorClick
      end
    end
    object MnAtendimento: TMenuItem
      Caption = 'Atendimento'
      object MnAbrirOcorrencia: TMenuItem
        Caption = 'Abrir Ocorr'#234'ncia'
        OnClick = MnAbrirOcorrenciaClick
      end
    end
    object MnOrdemServico: TMenuItem
      Caption = 'Ordem de &Servi'#231'o'
      object MnCadastrarOS: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          080000000000900000000000000000000000000100000000000009B7EC00C8FC
          FF0003BFF40014A9DD001F9BCD001AA2D5002495C70060DFFC0008BAEF0006BD
          F20000C3F8003FD5FB008FF6FE0062DFFC007AEEFD000EB1E50065E7FC008AEB
          FD0004BEF30001C2F700AEF5FF0050DFFB000FC8F80039D7FA0024D0F900288F
          C100FFFFFF000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000191919191919
          1919191919190616161616161616161616060418181818181818181818040517
          171717171717171717050315151515151515151515030F0F0F0F0F1010101010
          100F000B0B0B0B000E0E0E0E0E00080D0D0D0D07120C0C0C0C12091111111111
          1112121212120214141414141414141414021313010101131313131313131A1A
          0A0A0A0A1A1A1A1A1A1A}
        Caption = 'Cadastrar OS'
        ShortCut = 16463
        OnClick = MnCadastrarOSClick
      end
      object MnConsultarOS: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000E3A32700DE97
          0A00E6CB9D00E7AE3F00EDBE6600863B1A00EDE9E300EEDAB400EAD0A100C37C
          0000ECE1D0009F5A0000FFFFFF00FFFFFF000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000C0C09090909
          090909090C0C0C0B090C0C0C0C0C0C090B0C0B020505050505050505020B0B08
          0808080808080808080B0B070707070707070707070B0B0A0A0A0A0A0A0A0A0A
          0A0B0B060606060606060606060B0C0B0B0B0B0B0B0B0B0B0B0C0C0C010C0C0C
          0C0C0C010C0C0C0C000C0C0C0C0C0C030C0C0C0C000C0C0C0C0C03030C0C0C0C
          040404040404040C0C0C}
        Caption = 'Consultar OS'
        ShortCut = 16464
        OnClick = MnConsultarOSClick
      end
    end
    object MnRelatorios: TMenuItem
      Caption = '&Relat'#243'rios'
      object MnRelAtendimento: TMenuItem
        Bitmap.Data = {
          C6040000424DC60400000000000036040000280000000C0000000C0000000100
          0800000000009000000000000000000000000001000000000000E3A32700DE97
          0A00E6CB9D00E7AE3F00EDBE6600863B1A00EDE9E300EEDAB400EAD0A100C37C
          0000ECE1D0009F5A0000FFFFFF00FFFFFF000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000C0C09090909
          090909090C0C0C0B090C0C0C0C0C0C090B0C0B020505050505050505020B0B08
          0808080808080808080B0B070707070707070707070B0B0A0A0A0A0A0A0A0A0A
          0A0B0B060606060606060606060B0C0B0B0B0B0B0B0B0B0B0B0C0C0C010C0C0C
          0C0C0C010C0C0C0C000C0C0C0C0C0C030C0C0C0C000C0C0C0C0C03030C0C0C0C
          040404040404040C0C0C}
        Caption = 'Relat'#243'rios de Atendimento'
        OnClick = MnRelAtendimentoClick
      end
    end
    object MnAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object TMRConsulta: TTimer
    Enabled = False
    OnTimer = TMRConsultaTimer
    Left = 1128
    Top = 230
  end
  object DSEventos: TDataSource
    DataSet = CDSConsEventos
    Left = 1096
    Top = 230
  end
  object CDSConsEventos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEventos'
    Left = 1064
    Top = 230
    object CDSConsEventosCTX: TIntegerField
      FieldName = 'CTX'
    end
    object CDSConsEventosPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
    end
    object CDSConsEventosEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSConsEventosSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 4
    end
    object CDSConsEventosDESTATUS: TStringField
      FieldName = 'DESTATUS'
      Size = 70
    end
    object CDSConsEventosNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSConsEventosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSConsEventosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object CDSConsEventosDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
    end
    object CDSConsEventosCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
    end
  end
  object DSPEventos: TDataSetProvider
    DataSet = IBQConsEventos
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 1032
    Top = 230
  end
  object IBQConsEventos: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsEventos
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT DATAEVENTO, CTX, PORTACOM, EQUIPAMENTO, STATUS,  DESTATUS' +
        ', CDCLIENTE, NMCLIENTE, ENDERECO, CIDADE '
      
        'FROM VLOGEVENTO WHERE DATAEVENTO BETWEEN :DATAINICIAL AND :DATAF' +
        'INAL ORDER BY DATAEVENTO DESC;')
    UniDirectional = True
    Left = 1000
    Top = 230
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATAINICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFINAL'
        ParamType = ptUnknown
      end>
    object IBQConsEventosCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'LOGEVENTO.CTX'
    end
    object IBQConsEventosPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'LOGEVENTO.PORTACOM'
    end
    object IBQConsEventosEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'LOGEVENTO.EQUIPAMENTO'
    end
    object IBQConsEventosSTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STATUS'
      Origin = 'VLOGEVENTO.STATUS'
      ReadOnly = True
      Size = 4
    end
    object IBQConsEventosDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'LOGEVENTO.DESTATUS'
      Size = 70
    end
    object IBQConsEventosNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'LOGEVENTO.NMCLIENTE'
      Size = 60
    end
    object IBQConsEventosENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'LOGEVENTO.ENDERECO'
      Size = 60
    end
    object IBQConsEventosCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'LOGEVENTO.CIDADE'
      Size = 30
    end
    object IBQConsEventosDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
      Origin = 'LOGEVENTO.DATAEVENTO'
    end
    object IBQConsEventosCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VLOGEVENTO.CDCLIENTE'
    end
  end
  object IBTConsEventos: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 969
    Top = 230
  end
  object TMRMonitoramento: TTimer
    Enabled = False
    Interval = 180000
    OnTimer = TMRMonitoramentoTimer
    Left = 1128
    Top = 200
  end
  object IBEOcorrencia: TIBEvents
    AutoRegister = False
    Database = DModule.IBCONAzsim
    Registered = False
    OnEventAlert = IBEOcorrenciaEventAlert
    Left = 1000
    Top = 170
  end
  object DSRelAtendimento: TDataSource
    DataSet = CDSRelAtendimento
    Left = 1096
    Top = 262
  end
  object CDSRelAtendimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRelAtendimento'
    Left = 1064
    Top = 262
    object CDSRelAtendimentoDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
    end
    object CDSRelAtendimentoCTX: TIntegerField
      FieldName = 'CTX'
    end
    object CDSRelAtendimentoPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
    end
    object CDSRelAtendimentoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSRelAtendimentoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
    end
    object CDSRelAtendimentoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSRelAtendimentoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSRelAtendimentoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object CDSRelAtendimentoSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 4
    end
    object CDSRelAtendimentoDESTATUS: TStringField
      FieldName = 'DESTATUS'
      Size = 70
    end
    object CDSRelAtendimentoLOCAL: TStringField
      FieldName = 'LOCAL'
      ReadOnly = True
      Size = 114
    end
    object CDSRelAtendimentoRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 1000
    end
    object CDSRelAtendimentoOPERADORABERTURA: TStringField
      FieldName = 'OPERADORABERTURA'
    end
    object CDSRelAtendimentoOPERADORENCERRAMENTO: TStringField
      FieldName = 'OPERADORENCERRAMENTO'
    end
    object CDSRelAtendimentoAGENTE: TStringField
      FieldName = 'AGENTE'
    end
    object CDSRelAtendimentoKMTOTALPERCORRIDO: TBCDField
      FieldName = 'KMTOTALPERCORRIDO'
      Precision = 18
    end
    object CDSRelAtendimentoCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
    end
  end
  object DSPRelAtendimento: TDataSetProvider
    DataSet = IBQRelAtendimento
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 1032
    Top = 262
  end
  object IBQRelAtendimento: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTRelAtendimento
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CDOCORRENCIA, DATAEVENTO, CTX, PORTACOM, EQUIPAMENTO, CDC' +
        'LIENTE, NMCLIENTE, ENDERECO, CIDADE, STATUS,'
      
        '    DESTATUS, LOCAL, RESUMO, OPERADORABERTURA, OPERADORENCERRAME' +
        'NTO, AGENTE, KMTOTALPERCORRIDO'
      'FROM VOCORRENCIAS_ENCERRADAS;')
    UniDirectional = True
    Left = 1000
    Top = 262
    object IBQRelAtendimentoDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.DATAEVENTO'
    end
    object IBQRelAtendimentoCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'VOCORRENCIAS_ENCERRADAS.CTX'
    end
    object IBQRelAtendimentoPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'VOCORRENCIAS_ENCERRADAS.PORTACOM'
    end
    object IBQRelAtendimentoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.EQUIPAMENTO'
    end
    object IBQRelAtendimentoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VOCORRENCIAS_ENCERRADAS.CDCLIENTE'
    end
    object IBQRelAtendimentoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VOCORRENCIAS_ENCERRADAS.NMCLIENTE'
      Size = 60
    end
    object IBQRelAtendimentoENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.ENDERECO'
      Size = 60
    end
    object IBQRelAtendimentoCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'VOCORRENCIAS_ENCERRADAS.CIDADE'
      Size = 60
    end
    object IBQRelAtendimentoSTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STATUS'
      Origin = 'VOCORRENCIAS_ENCERRADAS.STATUS'
      ReadOnly = True
      Size = 4
    end
    object IBQRelAtendimentoDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'VOCORRENCIAS_ENCERRADAS.DESTATUS'
      Size = 70
    end
    object IBQRelAtendimentoLOCAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'LOCAL'
      Origin = 'VOCORRENCIAS_ENCERRADAS.LOCAL'
      ReadOnly = True
      Size = 114
    end
    object IBQRelAtendimentoRESUMO: TIBStringField
      FieldName = 'RESUMO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.RESUMO'
      Size = 1000
    end
    object IBQRelAtendimentoOPERADORABERTURA: TIBStringField
      FieldName = 'OPERADORABERTURA'
      Origin = 'VOCORRENCIAS_ENCERRADAS.OPERADORABERTURA'
    end
    object IBQRelAtendimentoOPERADORENCERRAMENTO: TIBStringField
      FieldName = 'OPERADORENCERRAMENTO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.OPERADORENCERRAMENTO'
    end
    object IBQRelAtendimentoAGENTE: TIBStringField
      FieldName = 'AGENTE'
      Origin = 'VOCORRENCIAS_ENCERRADAS.AGENTE'
    end
    object IBQRelAtendimentoKMTOTALPERCORRIDO: TIBBCDField
      FieldName = 'KMTOTALPERCORRIDO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.KMTOTALPERCORRIDO'
      Precision = 18
      Size = 4
    end
    object IBQRelAtendimentoCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
      Origin = 'VOCORRENCIAS_ENCERRADAS.CDOCORRENCIA'
    end
  end
  object IBTRelAtendimento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 969
    Top = 262
  end
  object IBTOcorrenciasAbertas: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 969
    Top = 292
  end
  object IBQOcorrenciasAbertas: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOcorrenciasAbertas
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      
        '    O.DATAEVENTO, O.CDOCORRENCIA, O.CTX, O.PORTACOM, O.EQUIPAMEN' +
        'TO, O.STATUS || '#39'.'#39' || REPLACE(O.REFERENCIA, '#39'F'#39', '#39'*'#39') AS STATUS' +
        ','
      
        '    O.DESTATUS, C.CDCLIENTE, C.NMCLIENTE, C.ENDERECO, C.BAIRRO, ' +
        'C.CIDADE, O.CDOPERADORENCERRAMENTO,'
      '    O.CDTIPOOCORRENCIA, O.CDSUBTIPOOCORRENCIA, O.RESUMO'
      
        'FROM OCORRENCIA O INNER JOIN CLIENTE C ON O.CDCLIENTE = C.CDCLIE' +
        'NTE'
      
        'WHERE O.ISOCORRENCIAENCERRADA = 0 AND O.CDOCORRENCIAPAI = 0 ORDE' +
        'R BY O.DATAEVENTO, O.CDOCORRENCIA;')
    UniDirectional = True
    Left = 1000
    Top = 292
    object IBQOcorrenciasAbertasCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
      Origin = 'OCORRENCIA.CDOCORRENCIA'
      Required = True
    end
    object IBQOcorrenciasAbertasCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'OCORRENCIA.CTX'
    end
    object IBQOcorrenciasAbertasPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'OCORRENCIA.PORTACOM'
    end
    object IBQOcorrenciasAbertasEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQOcorrenciasAbertasSTATUS: TIBStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object IBQOcorrenciasAbertasDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'OCORRENCIA.DESTATUS'
      Size = 70
    end
    object IBQOcorrenciasAbertasNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQOcorrenciasAbertasENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Size = 60
    end
    object IBQOcorrenciasAbertasBAIRRO: TIBStringField
      DisplayWidth = 60
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Size = 60
    end
    object IBQOcorrenciasAbertasCIDADE: TIBStringField
      DisplayWidth = 60
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Size = 60
    end
    object IBQOcorrenciasAbertasCDOPERADORENCERRAMENTO: TIntegerField
      FieldName = 'CDOPERADORENCERRAMENTO'
      Origin = 'OCORRENCIA.CDOPERADORENCERRAMENTO'
    end
    object IBQOcorrenciasAbertasCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'OCORRENCIA.CDTIPOOCORRENCIA'
    end
    object IBQOcorrenciasAbertasCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
      Origin = 'OCORRENCIA.CDSUBTIPOOCORRENCIA'
    end
    object IBQOcorrenciasAbertasRESUMO: TIBStringField
      FieldName = 'RESUMO'
      Origin = 'OCORRENCIA.RESUMO'
      Size = 1000
    end
    object IBQOcorrenciasAbertasDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
      Origin = 'OCORRENCIA.DATAEVENTO'
    end
    object IBQOcorrenciasAbertasCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
  end
  object DSPOcorrenciasAbertas: TDataSetProvider
    DataSet = IBQOcorrenciasAbertas
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 1032
    Top = 292
  end
  object CDSOcorrenciasAbertas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOcorrenciasAbertas'
    Left = 1064
    Top = 292
    object CDSOcorrenciasAbertasCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
      Origin = 'OCORRENCIA.CDOCORRENCIA'
      Required = True
    end
    object CDSOcorrenciasAbertasCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'OCORRENCIA.CTX'
    end
    object CDSOcorrenciasAbertasPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'OCORRENCIA.PORTACOM'
    end
    object CDSOcorrenciasAbertasEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object CDSOcorrenciasAbertasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4
    end
    object CDSOcorrenciasAbertasDESTATUS: TStringField
      FieldName = 'DESTATUS'
      Origin = 'OCORRENCIA.DESTATUS'
      Size = 70
    end
    object CDSOcorrenciasAbertasNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object CDSOcorrenciasAbertasENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Size = 60
    end
    object CDSOcorrenciasAbertasBAIRRO: TStringField
      DisplayWidth = 60
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Size = 60
    end
    object CDSOcorrenciasAbertasCIDADE: TStringField
      DisplayWidth = 60
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Size = 60
    end
    object CDSOcorrenciasAbertasCDOPERADORENCERRAMENTO: TIntegerField
      FieldName = 'CDOPERADORENCERRAMENTO'
      Origin = 'OCORRENCIA.CDOPERADORENCERRAMENTO'
    end
    object CDSOcorrenciasAbertasCDTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDTIPOOCORRENCIA'
      Origin = 'OCORRENCIA.CDTIPOOCORRENCIA'
    end
    object CDSOcorrenciasAbertasCDSUBTIPOOCORRENCIA: TIntegerField
      FieldName = 'CDSUBTIPOOCORRENCIA'
      Origin = 'OCORRENCIA.CDSUBTIPOOCORRENCIA'
    end
    object CDSOcorrenciasAbertasRESUMO: TStringField
      FieldName = 'RESUMO'
      Origin = 'OCORRENCIA.RESUMO'
      Size = 1000
    end
    object CDSOcorrenciasAbertasDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
    end
    object CDSOcorrenciasAbertasCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
  end
  object DSOcorrenciasAbertas: TDataSource
    DataSet = CDSOcorrenciasAbertas
    Left = 1096
    Top = 292
  end
  object IBTConsFaltaComunicacao: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 969
    Top = 200
  end
  object IBQConsFaltaComunicacao: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsFaltaComunicacao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CTX, PORTACOM, TIPOCTX, DATACONEXAO, DATA_ULTIMOEVENTO,  ' +
        'CDUSUARIO_DESATIVOU, MONITORAMENTO_ATIVO, MOTIVO_DESATIVOU, MINU' +
        'TOS_SEM_COMUNICACAO FROM VLOGCTX_SEM_COMUNICACAO;')
    UniDirectional = True
    Left = 1000
    Top = 200
    object IBQConsFaltaComunicacaoCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.CTX'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IBQConsFaltaComunicacaoPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.PORTACOM'
    end
    object IBQConsFaltaComunicacaoTIPOCTX: TIntegerField
      FieldName = 'TIPOCTX'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.TIPOCTX'
    end
    object IBQConsFaltaComunicacaoDATACONEXAO: TDateTimeField
      FieldName = 'DATACONEXAO'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.DATACONEXAO'
    end
    object IBQConsFaltaComunicacaoDATA_ULTIMOEVENTO: TDateTimeField
      FieldName = 'DATA_ULTIMOEVENTO'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.DATA_ULTIMOEVENTO'
    end
    object IBQConsFaltaComunicacaoMINUTOS_SEM_COMUNICACAO: TLargeintField
      FieldKind = fkInternalCalc
      FieldName = 'MINUTOS_SEM_COMUNICACAO'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.MINUTOS_SEM_COMUNICACAO'
      ReadOnly = True
    end
    object IBQConsFaltaComunicacaoCDUSUARIO_DESATIVOU: TIntegerField
      FieldName = 'CDUSUARIO_DESATIVOU'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.CDUSUARIO_DESATIVOU'
    end
    object IBQConsFaltaComunicacaoMOTIVO_DESATIVOU: TIBStringField
      FieldName = 'MOTIVO_DESATIVOU'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.MOTIVO_DESATIVOU'
      Size = 400
    end
    object IBQConsFaltaComunicacaoMONITORAMENTO_ATIVO: TIntegerField
      FieldName = 'MONITORAMENTO_ATIVO'
      Origin = 'VLOGCTX_SEM_COMUNICACAO.MONITORAMENTO_ATIVO'
    end
  end
  object DSPConsFaltaComunicacao: TDataSetProvider
    DataSet = IBQConsFaltaComunicacao
    Constraints = True
    UpdateMode = upWhereKeyOnly
    OnGetTableName = DSPConsFaltaComunicacaoGetTableName
    Left = 1032
    Top = 200
  end
  object CDSConsFaltaComunicacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsFaltaComunicacao'
    Left = 1064
    Top = 200
    object CDSConsFaltaComunicacaoCTX: TIntegerField
      FieldName = 'CTX'
    end
    object CDSConsFaltaComunicacaoPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
    end
    object CDSConsFaltaComunicacaoTIPOCTX: TIntegerField
      FieldName = 'TIPOCTX'
    end
    object CDSConsFaltaComunicacaoDATACONEXAO: TDateTimeField
      FieldName = 'DATACONEXAO'
    end
    object CDSConsFaltaComunicacaoDATA_ULTIMOEVENTO: TDateTimeField
      FieldName = 'DATA_ULTIMOEVENTO'
    end
    object CDSConsFaltaComunicacaoMINUTOS_SEM_COMUNICACAO: TLargeintField
      FieldName = 'MINUTOS_SEM_COMUNICACAO'
      ReadOnly = True
    end
    object CDSConsFaltaComunicacaoCDUSUARIO_DESATIVOU: TIntegerField
      FieldName = 'CDUSUARIO_DESATIVOU'
    end
    object CDSConsFaltaComunicacaoMOTIVO_DESATIVOU: TStringField
      FieldName = 'MOTIVO_DESATIVOU'
      Size = 400
    end
    object CDSConsFaltaComunicacaoMONITORAMENTO_ATIVO: TIntegerField
      FieldName = 'MONITORAMENTO_ATIVO'
    end
  end
  object DSConsFaltaComunicacao: TDataSource
    DataSet = CDSConsFaltaComunicacao
    Left = 1096
    Top = 200
  end
  object DSSetorCurto: TDataSource
    DataSet = CDSSetorCurto
    Left = 152
    Top = 219
  end
  object CDSSetorCurto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSetorCurto'
    OnCalcFields = CDSSetorCurtoCalcFields
    Left = 120
    Top = 219
    object CDSSetorCurtoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSSetorCurtoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSSetorCurtoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSSetorCurtoDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSSetorCurtoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSSetorCurtoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSSetorCurtoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSSetorCurtoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSSetorCurtoOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSSetorCurtoIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSSetorCurtoIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSSetorCurtoIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSSetorCurtoIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSPSetorCurto: TDataSetProvider
    DataSet = IBQSetorCurto
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 219
  end
  object IBQSetorCurto: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSetorCurto
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 1 AND O.DATAEVENTO BETWEEN DATEADD' +
        '(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 219
    object IBQSetorCurtoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQSetorCurtoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQSetorCurtoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQSetorCurtoDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQSetorCurtoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQSetorCurtoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQSetorCurtoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQSetorCurtoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object IBTSetorCurto: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 219
  end
  object IBTBateriaFraca: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 251
  end
  object IBQBateriaFraca: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTBateriaFraca
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 8 AND O.DATAEVENTO BETWEEN DATEADD' +
        '(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 251
    object IBQBateriaFracaTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQBateriaFracaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQBateriaFracaNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQBateriaFracaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQBateriaFracaDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQBateriaFracaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQBateriaFracaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQBateriaFracaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPBateriaFraca: TDataSetProvider
    DataSet = IBQBateriaFraca
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 251
  end
  object CDSBateriaFraca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPBateriaFraca'
    OnCalcFields = CDSBateriaFracaCalcFields
    Left = 120
    Top = 251
    object CDSBateriaFracaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object IntegerField4: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object StringField2: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSBateriaFracaTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSBateriaFracaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSBateriaFracaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSBateriaFracaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSBateriaFracaOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSBateriaFracaIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSBateriaFracaIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSBateriaFracaIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSBateriaFracaIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSBateriaFraca: TDataSource
    DataSet = CDSBateriaFraca
    Left = 152
    Top = 251
  end
  object DSSensorIRContPreso: TDataSource
    DataSet = CDSSensorIRContPreso
    Left = 152
    Top = 283
  end
  object CDSSensorIRContPreso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSensorIRContPreso'
    OnCalcFields = CDSSensorIRContPresoCalcFields
    Left = 120
    Top = 283
    object CDSSensorIRContPresoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object IntegerField6: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object StringField4: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSSensorIRContPresoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSSensorIRContPresoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSSensorIRContPresoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSSensorIRContPresoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSSensorIRContPresoOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSSensorIRContPresoIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSSensorIRContPresoIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSSensorIRContPresoIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSSensorIRContPresoIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSPSensorIRContPreso: TDataSetProvider
    DataSet = IBQSensorIRContPreso
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 283
  end
  object IBQSensorIRContPreso: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSensorIRContPreso
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 10 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 283
    object IBQSensorIRContPresoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQSensorIRContPresoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQSensorIRContPresoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQSensorIRContPresoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQSensorIRContPresoDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQSensorIRContPresoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQSensorIRContPresoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQSensorIRContPresoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object IBTSensorIRContPreso: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 283
  end
  object DSIdentifica: TDataSource
    DataSet = CDSIdentifica
    Left = 152
    Top = 187
  end
  object CDSIdentifica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPIdentifica'
    OnCalcFields = CDSIdentificaCalcFields
    Left = 120
    Top = 187
    object CDSIdentificaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VCLIENTES_ATIVOS.CDCLIENTE'
    end
    object CDSIdentificaNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VCLIENTES_ATIVOS.NMCLIENTE'
      Size = 60
    end
    object CDSIdentificaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VCLIENTES_ATIVOS.EQUIPAMENTO'
    end
    object CDSIdentificaTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSIdentificaPERCENTUAL: TStringField
      FieldKind = fkCalculated
      FieldName = 'PERCENTUAL'
      Calculated = True
    end
    object CDSIdentificaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSIdentificaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSIdentificaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSIdentificaOBSERVACAO: TStringField
      DisplayWidth = 200
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSIdentificaIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
    object CDSIdentificaIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSIdentificaIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSIdentificaIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
  end
  object DSPIdentifica: TDataSetProvider
    DataSet = IBQIdentifica
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 187
  end
  object IBQIdentifica: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTIdentifica
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CA.CDCLIENTE, CA.NMCLIENTE, CA.EQUIPAMENTO, '
      ''
      '  (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'8'#39' AND (L.REFERENCIA = '#39'4F'#39' OR L.RE' +
        'FERENCIA = '#39'40'#39'))'
      '            AND L.CDCLIENTE = CA.CDCLIENTE'
      '    ) AS TOTAL,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = CA.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = CA.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = CA.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM VCLIENTES_ATIVOS CA '
      'WHERE (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'8'#39' AND (L.REFERENCIA = '#39'4F'#39' OR L.RE' +
        'FERENCIA = '#39'40'#39'))'
      '            AND L.CDCLIENTE = CA.CDCLIENTE) > 0'
      'ORDER BY TOTAL, TOTAL_ATIVA;')
    UniDirectional = True
    Left = 56
    Top = 187
    object IBQIdentificaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VCLIENTES_ATIVOS.CDCLIENTE'
    end
    object IBQIdentificaNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VCLIENTES_ATIVOS.NMCLIENTE'
      Size = 60
    end
    object IBQIdentificaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VCLIENTES_ATIVOS.EQUIPAMENTO'
    end
    object IBQIdentificaTOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
    object IBQIdentificaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQIdentificaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQIdentificaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object IBTIdentifica: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 187
  end
  object DSIdentificaZero: TDataSource
    DataSet = CDSIdentificaZero
    Left = 152
    Top = 155
  end
  object CDSIdentificaZero: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPIdentificaZero'
    OnCalcFields = CDSIdentificaZeroCalcFields
    Left = 120
    Top = 155
    object CDSIdentificaZeroCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VCLIENTES_ATIVOS.CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSIdentificaZeroNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VCLIENTES_ATIVOS.NMCLIENTE'
      Size = 60
    end
    object CDSIdentificaZeroEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VCLIENTES_ATIVOS.EQUIPAMENTO'
    end
    object CDSIdentificaZeroTOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
    object CDSIdentificaZeroPERCENTUAL: TStringField
      DisplayWidth = 4
      FieldKind = fkCalculated
      FieldName = 'PERCENTUAL'
      Calculated = True
    end
    object CDSIdentificaZeroTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSIdentificaZeroTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSIdentificaZeroTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSIdentificaZeroOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSIdentificaZeroIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSIdentificaZeroIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
    object CDSIdentificaZeroIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSIdentificaZeroIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
  end
  object DSPIdentificaZero: TDataSetProvider
    DataSet = IBQIdentificaZero
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 155
  end
  object IBQIdentificaZero: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTIdentificaZero
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CA.CDCLIENTE, CA.NMCLIENTE, CA.EQUIPAMENTO, (SELECT COUNT' +
        '(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'8'#39' AND (L.REFERENCIA = '#39'4F'#39' OR L.RE' +
        'FERENCIA = '#39'40'#39'))'
      '            AND L.CDCLIENTE = CA.CDCLIENTE'
      '    ) AS TOTAL,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = CA.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = CA.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = CA.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM VCLIENTES_ATIVOS CA '
      'WHERE (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'8'#39' AND (L.REFERENCIA = '#39'4F'#39' OR L.RE' +
        'FERENCIA = '#39'40'#39'))'
      '            AND L.CDCLIENTE = CA.CDCLIENTE) = 0'
      'ORDER BY TOTAL, TOTAL_ATIVA;')
    UniDirectional = True
    Left = 56
    Top = 155
    object IBQIdentificaZeroCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VCLIENTES_ATIVOS.CDCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IBQIdentificaZeroNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VCLIENTES_ATIVOS.NMCLIENTE'
      Size = 60
    end
    object IBQIdentificaZeroEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VCLIENTES_ATIVOS.EQUIPAMENTO'
    end
    object IBQIdentificaZeroTOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
    object IBQIdentificaZeroTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQIdentificaZeroTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQIdentificaZeroTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object IBTIdentificaZero: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 155
  end
  object IBTConsertoSistema: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 314
  end
  object IBQConsertoSistema: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTConsertoSistema
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 4 AND O.DATAEVENTO BETWEEN DATEADD' +
        '(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 314
    object IBQConsertoSistemaTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQConsertoSistemaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQConsertoSistemaNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQConsertoSistemaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQConsertoSistemaDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQConsertoSistemaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQConsertoSistemaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQConsertoSistemaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPConsertoSistema: TDataSetProvider
    DataSet = IBQConsertoSistema
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 314
  end
  object CDSConsertoSistema: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsertoSistema'
    OnCalcFields = CDSConsertoSistemaCalcFields
    Left = 120
    Top = 314
    object CDSConsertoSistemaTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSConsertoSistemaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSConsertoSistemaNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSConsertoSistemaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSConsertoSistemaDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSConsertoSistemaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSConsertoSistemaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSConsertoSistemaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSConsertoSistemaOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSConsertoSistemaIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSConsertoSistemaIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSConsertoSistemaIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSConsertoSistemaIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSConsertoSistema: TDataSource
    DataSet = CDSConsertoSistema
    Left = 152
    Top = 314
  end
  object IBQCliConsOrdemServico: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTIdentificaZero
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSMasterCliConsOrdemServico
    SQL.Strings = (
      'SELECT DISTINCT '
      'CASE'
      '    WHEN V.ISORDEMENCERRADA = 0 THEN'
      '         '#39'PENDENTE'#39
      
        '    ELSE '#39'REALIZADO'#39' END AS SITUACAO, V.CDORDEMSERVICO, V.CDCLIE' +
        'NTE, V.NMCLIENTE, V.DATACADASTRO, V.DEORDEMSERVICO, V.EQUIPAMENT' +
        'O '
      'FROM VORDEMSERVICOS V'
      
        'WHERE V.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT_DATE) AND' +
        ' CURRENT_DATE AND CDCLIENTE = :CDCLIENTE;')
    UniDirectional = True
    Left = 758
    Top = 470
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQCliConsOrdemServicoSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 9
    end
    object IBQCliConsOrdemServicoCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
      Origin = 'VORDEMSERVICOS.CDORDEMSERVICO'
    end
    object IBQCliConsOrdemServicoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VORDEMSERVICOS.CDCLIENTE'
    end
    object IBQCliConsOrdemServicoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VORDEMSERVICOS.NMCLIENTE'
      Size = 60
    end
    object IBQCliConsOrdemServicoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
      Origin = 'VORDEMSERVICOS.DATACADASTRO'
    end
    object IBQCliConsOrdemServicoDEORDEMSERVICO: TIBStringField
      FieldName = 'DEORDEMSERVICO'
      Origin = 'VORDEMSERVICOS.DEORDEMSERVICO'
      Size = 800
    end
    object IBQCliConsOrdemServicoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VORDEMSERVICOS.EQUIPAMENTO'
    end
  end
  object CDSCliConsOrdemServico: TClientDataSet
    Aggregates = <>
    DataSetField = CDSIdentificaIBQCliConsOrdemServico
    Params = <>
    Left = 788
    Top = 470
    object CDSCliConsOrdemServicoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Required = True
      FixedChar = True
      Size = 9
    end
    object CDSCliConsOrdemServicoCDORDEMSERVICO: TIntegerField
      FieldName = 'CDORDEMSERVICO'
    end
    object CDSCliConsOrdemServicoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
    end
    object CDSCliConsOrdemServicoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSCliConsOrdemServicoDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object CDSCliConsOrdemServicoDEORDEMSERVICO: TStringField
      FieldName = 'DEORDEMSERVICO'
      Size = 800
    end
    object CDSCliConsOrdemServicoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
  end
  object DSCliConsOrdemServico: TDataSource
    DataSet = CDSCliConsOrdemServico
    Left = 818
    Top = 470
  end
  object DSMasterCliConsOrdemServico: TDataSource
    DataSet = IBQSinalIndesejado
    Left = 758
    Top = 502
  end
  object IBQCliConsArmeDesarme: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTIdentificaZero
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSMasterCliConsArmeDesarme
    SQL.Strings = (
      
        'SELECT L.DATAEVENTO, L.CTX,  L.PORTACOM, L.EQUIPAMENTO, L.STATUS' +
        ',  L.DESTATUS, L.CDCLIENTE, L.NMCLIENTE, L.ENDERECO, L.CIDADE '
      'FROM LOGEVENTO L'
      
        'WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DATE) AND C' +
        'URRENT_DATE AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39')) ' +
        ' AND L.CDCLIENTE = :CDCLIENTE;')
    UniDirectional = True
    Left = 862
    Top = 470
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQCliConsArmeDesarmeDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
      Origin = 'LOGEVENTO.DATAEVENTO'
    end
    object IBQCliConsArmeDesarmeCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'LOGEVENTO.CTX'
    end
    object IBQCliConsArmeDesarmePORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'LOGEVENTO.PORTACOM'
    end
    object IBQCliConsArmeDesarmeEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'LOGEVENTO.EQUIPAMENTO'
    end
    object IBQCliConsArmeDesarmeSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'LOGEVENTO.STATUS'
      Size = 1
    end
    object IBQCliConsArmeDesarmeDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'LOGEVENTO.DESTATUS'
      Size = 70
    end
    object IBQCliConsArmeDesarmeCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'LOGEVENTO.CDCLIENTE'
    end
    object IBQCliConsArmeDesarmeNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'LOGEVENTO.NMCLIENTE'
      Size = 60
    end
    object IBQCliConsArmeDesarmeENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'LOGEVENTO.ENDERECO'
      Size = 60
    end
    object IBQCliConsArmeDesarmeCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'LOGEVENTO.CIDADE'
      Size = 30
    end
  end
  object CDSCliConsArmeDesarme: TClientDataSet
    Aggregates = <>
    DataSetField = CDSIdentificaIBQCliConsArmeDesarme
    Params = <>
    Left = 892
    Top = 470
  end
  object DSCliConsArmeDesarme: TDataSource
    DataSet = CDSCliConsArmeDesarme
    Left = 922
    Top = 470
  end
  object DSCliConsLogEvento: TDataSource
    DataSet = CDSCliConsLogEvento
    Left = 1130
    Top = 470
  end
  object CDSCliConsLogEvento: TClientDataSet
    Aggregates = <>
    DataSetField = CDSIdentificaIBQCliConsLogEvento
    Params = <>
    Left = 1100
    Top = 470
    object CDSCliConsLogEventoDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
    end
    object CDSCliConsLogEventoCTX: TIntegerField
      FieldName = 'CTX'
    end
    object CDSCliConsLogEventoPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
    end
    object CDSCliConsLogEventoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSCliConsLogEventoSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 4
    end
    object CDSCliConsLogEventoDESTATUS: TStringField
      FieldName = 'DESTATUS'
      Size = 70
    end
    object CDSCliConsLogEventoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
    end
    object CDSCliConsLogEventoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSCliConsLogEventoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSCliConsLogEventoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
  end
  object IBQCliConsLogEvento: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTIdentificaZero
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSMasterCliConsLogEvento
    SQL.Strings = (
      
        'SELECT DATAEVENTO, CTX, PORTACOM, EQUIPAMENTO, STATUS,  DESTATUS' +
        ', CDCLIENTE, NMCLIENTE, ENDERECO, CIDADE '
      'FROM VLOGEVENTO '
      
        'WHERE DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DATE) AND CUR' +
        'RENT_DATE AND CDCLIENTE = :CDCLIENTE'
      'ORDER BY DATAEVENTO ASC;')
    UniDirectional = True
    Left = 1070
    Top = 470
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQCliConsLogEventoDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
      Origin = 'VLOGEVENTO.DATAEVENTO'
    end
    object IBQCliConsLogEventoCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'VLOGEVENTO.CTX'
    end
    object IBQCliConsLogEventoPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'VLOGEVENTO.PORTACOM'
    end
    object IBQCliConsLogEventoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VLOGEVENTO.EQUIPAMENTO'
    end
    object IBQCliConsLogEventoSTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STATUS'
      Origin = 'VLOGEVENTO.STATUS'
      ReadOnly = True
      Size = 4
    end
    object IBQCliConsLogEventoDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'VLOGEVENTO.DESTATUS'
      Size = 70
    end
    object IBQCliConsLogEventoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VLOGEVENTO.CDCLIENTE'
    end
    object IBQCliConsLogEventoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VLOGEVENTO.NMCLIENTE'
      Size = 60
    end
    object IBQCliConsLogEventoENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'VLOGEVENTO.ENDERECO'
      Size = 60
    end
    object IBQCliConsLogEventoCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'VLOGEVENTO.CIDADE'
      Size = 30
    end
  end
  object IBQCliConsOcorrencia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTIdentificaZero
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSMasterCliConsOcorrencia
    SQL.Strings = (
      
        'SELECT CDOCORRENCIA, DATAEVENTO, CTX, PORTACOM, EQUIPAMENTO, CDC' +
        'LIENTE, NMCLIENTE, ENDERECO, CIDADE, STATUS,  DESTATUS, LOCAL, R' +
        'ESUMO, OPERADORABERTURA, OPERADORENCERRAMENTO, AGENTE, KMTOTALPE' +
        'RCORRIDO'
      'FROM VOCORRENCIAS_ENCERRADAS'
      
        'WHERE DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DATE) AND CUR' +
        'RENT_DATE AND CDCLIENTE = :CDCLIENTE;')
    UniDirectional = True
    Left = 966
    Top = 470
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQCliConsOcorrenciaCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
      Origin = 'VOCORRENCIAS_ENCERRADAS.CDOCORRENCIA'
    end
    object IBQCliConsOcorrenciaDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.DATAEVENTO'
    end
    object IBQCliConsOcorrenciaCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'VOCORRENCIAS_ENCERRADAS.CTX'
    end
    object IBQCliConsOcorrenciaPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'VOCORRENCIAS_ENCERRADAS.PORTACOM'
    end
    object IBQCliConsOcorrenciaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.EQUIPAMENTO'
    end
    object IBQCliConsOcorrenciaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VOCORRENCIAS_ENCERRADAS.CDCLIENTE'
    end
    object IBQCliConsOcorrenciaNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'VOCORRENCIAS_ENCERRADAS.NMCLIENTE'
      Size = 60
    end
    object IBQCliConsOcorrenciaENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.ENDERECO'
      Size = 60
    end
    object IBQCliConsOcorrenciaCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'VOCORRENCIAS_ENCERRADAS.CIDADE'
      Size = 60
    end
    object IBQCliConsOcorrenciaSTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STATUS'
      Origin = 'VOCORRENCIAS_ENCERRADAS.STATUS'
      ReadOnly = True
      Size = 4
    end
    object IBQCliConsOcorrenciaDESTATUS: TIBStringField
      FieldName = 'DESTATUS'
      Origin = 'VOCORRENCIAS_ENCERRADAS.DESTATUS'
      Size = 70
    end
    object IBQCliConsOcorrenciaLOCAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'LOCAL'
      Origin = 'VOCORRENCIAS_ENCERRADAS.LOCAL'
      ReadOnly = True
      Size = 114
    end
    object IBQCliConsOcorrenciaRESUMO: TIBStringField
      FieldName = 'RESUMO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.RESUMO'
      Size = 1000
    end
    object IBQCliConsOcorrenciaOPERADORABERTURA: TIBStringField
      FieldName = 'OPERADORABERTURA'
      Origin = 'VOCORRENCIAS_ENCERRADAS.OPERADORABERTURA'
    end
    object IBQCliConsOcorrenciaOPERADORENCERRAMENTO: TIBStringField
      FieldName = 'OPERADORENCERRAMENTO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.OPERADORENCERRAMENTO'
    end
    object IBQCliConsOcorrenciaAGENTE: TIBStringField
      FieldName = 'AGENTE'
      Origin = 'VOCORRENCIAS_ENCERRADAS.AGENTE'
    end
    object IBQCliConsOcorrenciaKMTOTALPERCORRIDO: TIBBCDField
      FieldName = 'KMTOTALPERCORRIDO'
      Origin = 'VOCORRENCIAS_ENCERRADAS.KMTOTALPERCORRIDO'
      Precision = 18
      Size = 4
    end
  end
  object CDSCliConsOcorrencia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 996
    Top = 470
    object CDSCliConsOcorrenciaCDOCORRENCIA: TIntegerField
      FieldName = 'CDOCORRENCIA'
    end
    object CDSCliConsOcorrenciaDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
    end
    object CDSCliConsOcorrenciaCTX: TIntegerField
      FieldName = 'CTX'
    end
    object CDSCliConsOcorrenciaPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
    end
    object CDSCliConsOcorrenciaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSCliConsOcorrenciaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
    end
    object CDSCliConsOcorrenciaNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSCliConsOcorrenciaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSCliConsOcorrenciaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object CDSCliConsOcorrenciaSTATUS: TStringField
      FieldName = 'STATUS'
      ReadOnly = True
      Size = 4
    end
    object CDSCliConsOcorrenciaDESTATUS: TStringField
      FieldName = 'DESTATUS'
      Size = 70
    end
    object CDSCliConsOcorrenciaLOCAL: TStringField
      FieldName = 'LOCAL'
      ReadOnly = True
      Size = 114
    end
    object CDSCliConsOcorrenciaRESUMO: TStringField
      FieldName = 'RESUMO'
      Size = 1000
    end
    object CDSCliConsOcorrenciaOPERADORABERTURA: TStringField
      FieldName = 'OPERADORABERTURA'
    end
    object CDSCliConsOcorrenciaOPERADORENCERRAMENTO: TStringField
      FieldName = 'OPERADORENCERRAMENTO'
    end
    object CDSCliConsOcorrenciaAGENTE: TStringField
      FieldName = 'AGENTE'
    end
    object CDSCliConsOcorrenciaKMTOTALPERCORRIDO: TBCDField
      FieldName = 'KMTOTALPERCORRIDO'
      Precision = 18
    end
  end
  object DSCliConsOcorrencia: TDataSource
    DataSet = CDSCliConsOcorrencia
    Left = 1026
    Top = 470
  end
  object DSMasterCliConsArmeDesarme: TDataSource
    DataSet = IBQSinalIndesejado
    Left = 862
    Top = 502
  end
  object DSMasterCliConsOcorrencia: TDataSource
    DataSet = IBQSinalIndesejado
    Left = 966
    Top = 502
  end
  object DSMasterCliConsLogEvento: TDataSource
    DataSet = IBQSinalIndesejado
    Left = 1070
    Top = 502
  end
  object IBTRetiradaKit: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 346
  end
  object IBQRetiradaKit: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTRetiradaKit
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 11 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 346
    object IBQRetiradaKitTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQRetiradaKitCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQRetiradaKitNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQRetiradaKitEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQRetiradaKitDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQRetiradaKitTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQRetiradaKitTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQRetiradaKitTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPRetiradaKit: TDataSetProvider
    DataSet = IBQRetiradaKit
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 346
  end
  object CDSRetiradaKit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRetiradaKit'
    OnCalcFields = CDSRetiradaKitCalcFields
    Left = 120
    Top = 346
    object CDSRetiradaKitTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSRetiradaKitCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSRetiradaKitNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSRetiradaKitEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSRetiradaKitDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSRetiradaKitTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSRetiradaKitTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSRetiradaKitTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSRetiradaKitOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSRetiradaKitIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSRetiradaKitIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSRetiradaKitIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSRetiradaKitIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSRetiradaKit: TDataSource
    DataSet = CDSRetiradaKit
    Left = 152
    Top = 346
  end
  object IBTCanalRFAberto: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 378
  end
  object IBQCanalRFAberto: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTCanalRFAberto
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 12 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 378
    object IBQCanalRFAbertoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQCanalRFAbertoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQCanalRFAbertoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQCanalRFAbertoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQCanalRFAbertoDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQCanalRFAbertoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQCanalRFAbertoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQCanalRFAbertoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPCanalRFAberto: TDataSetProvider
    DataSet = IBQCanalRFAberto
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 378
  end
  object CDSCanalRFAberto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCanalRFAberto'
    OnCalcFields = CDSCanalRFAbertoCalcFields
    Left = 120
    Top = 378
    object CDSCanalRFAbertoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSCanalRFAbertoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSCanalRFAbertoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSCanalRFAbertoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSCanalRFAbertoDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSCanalRFAbertoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSCanalRFAbertoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSCanalRFAbertoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSCanalRFAbertoOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSCanalRFAbertoIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSCanalRFAbertoIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSCanalRFAbertoIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSCanalRFAbertoIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSCanalRFAberto: TDataSource
    DataSet = CDSCanalRFAberto
    Left = 152
    Top = 378
  end
  object IBTMauContato: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 410
  end
  object IBQMauContato: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTMauContato
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 13 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 410
    object IBQMauContatoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQMauContatoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQMauContatoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQMauContatoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQMauContatoDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQMauContatoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQMauContatoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQMauContatoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPMauContato: TDataSetProvider
    DataSet = IBQMauContato
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 410
  end
  object CDSMauContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPMauContato'
    OnCalcFields = CDSMauContatoCalcFields
    Left = 120
    Top = 410
    object CDSMauContatoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSMauContatoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSMauContatoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSMauContatoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSMauContatoDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSMauContatoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSMauContatoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSMauContatoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSMauContatoOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSMauContatoIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSMauContatoIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSMauContatoIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSMauContatoIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSMauContato: TDataSource
    DataSet = CDSMauContato
    Left = 152
    Top = 410
  end
  object IBTSemEnergia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 442
  end
  object IBQSemEnergia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSemEnergia
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 15 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 442
    object IBQSemEnergiaTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQSemEnergiaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQSemEnergiaNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQSemEnergiaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQSemEnergiaDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQSemEnergiaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQSemEnergiaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQSemEnergiaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPSemEnergia: TDataSetProvider
    DataSet = IBQSemEnergia
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 442
  end
  object CDSSemEnergia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSemEnergia'
    OnCalcFields = CDSSemEnergiaCalcFields
    Left = 120
    Top = 442
    object CDSSemEnergiaTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSSemEnergiaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSSemEnergiaNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSSemEnergiaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSSemEnergiaDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSSemEnergiaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSSemEnergiaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSSemEnergiaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSSemEnergiaIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSSemEnergiaIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSSemEnergiaIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSSemEnergiaIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
    object CDSSemEnergiaOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
  end
  object DSSemEnergia: TDataSource
    DataSet = CDSSemEnergia
    Left = 152
    Top = 442
  end
  object IBTAgenteLocal: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 474
  end
  object IBQAgenteLocal: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTAgenteLocal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 16 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 474
    object IBQAgenteLocalTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQAgenteLocalCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQAgenteLocalNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQAgenteLocalEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQAgenteLocalDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQAgenteLocalTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQAgenteLocalTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQAgenteLocalTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPAgenteLocal: TDataSetProvider
    DataSet = IBQAgenteLocal
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 474
  end
  object CDSAgenteLocal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPAgenteLocal'
    OnCalcFields = CDSAgenteLocalCalcFields
    Left = 120
    Top = 474
    object CDSAgenteLocalTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSAgenteLocalCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSAgenteLocalNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSAgenteLocalEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSAgenteLocalDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSAgenteLocalTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSAgenteLocalTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSAgenteLocalTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSAgenteLocalOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSAgenteLocalIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSAgenteLocalIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSAgenteLocalIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSAgenteLocalIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSAgenteLocal: TDataSource
    DataSet = CDSAgenteLocal
    Left = 152
    Top = 474
  end
  object IBTPresencaAnimais: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 506
  end
  object IBQPresencaAnimais: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTPresencaAnimais
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 17 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 506
    object IBQPresencaAnimaisTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQPresencaAnimaisCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQPresencaAnimaisNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQPresencaAnimaisEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQPresencaAnimaisDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQPresencaAnimaisTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQPresencaAnimaisTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQPresencaAnimaisTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPPresencaAnimais: TDataSetProvider
    DataSet = IBQPresencaAnimais
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 506
  end
  object CDSPresencaAnimais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPresencaAnimais'
    OnCalcFields = CDSPresencaAnimaisCalcFields
    Left = 120
    Top = 506
    object CDSPresencaAnimaisTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSPresencaAnimaisCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSPresencaAnimaisNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSPresencaAnimaisEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSPresencaAnimaisDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSPresencaAnimaisTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSPresencaAnimaisTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSPresencaAnimaisTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSPresencaAnimaisOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSPresencaAnimaisIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSPresencaAnimaisIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSPresencaAnimaisIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSPresencaAnimaisIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSPresencaAnimais: TDataSource
    DataSet = CDSPresencaAnimais
    Left = 152
    Top = 506
  end
  object IBTAlarmeAcidental: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 25
    Top = 537
  end
  object IBQAlarmeAcidental: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTAlarmeAcidental
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 18 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 56
    Top = 537
    object IBQAlarmeAcidentalTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQAlarmeAcidentalCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQAlarmeAcidentalNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQAlarmeAcidentalEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQAlarmeAcidentalDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQAlarmeAcidentalTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQAlarmeAcidentalTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQAlarmeAcidentalTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPAlarmeAcidental: TDataSetProvider
    DataSet = IBQAlarmeAcidental
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 537
  end
  object CDSAlarmeAcidental: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPAlarmeAcidental'
    OnCalcFields = CDSAlarmeAcidentalCalcFields
    Left = 120
    Top = 537
    object CDSAlarmeAcidentalTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSAlarmeAcidentalCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object CDSAlarmeAcidentalNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object CDSAlarmeAcidentalEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object CDSAlarmeAcidentalDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSAlarmeAcidentalTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSAlarmeAcidentalTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSAlarmeAcidentalTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSAlarmeAcidentalOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSAlarmeAcidentalIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSAlarmeAcidentalIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSAlarmeAcidentalIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSAlarmeAcidentalIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSAlarmeAcidental: TDataSource
    DataSet = CDSAlarmeAcidental
    Left = 152
    Top = 537
  end
  object IBTSuspeitoLocal: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 205
    Top = 155
  end
  object IBQSuspeitoLocal: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSuspeitoLocal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 21 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 236
    Top = 155
    object IBQSuspeitoLocalTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQSuspeitoLocalCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQSuspeitoLocalNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQSuspeitoLocalEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQSuspeitoLocalDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQSuspeitoLocalTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQSuspeitoLocalTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQSuspeitoLocalTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPSuspeitoLocal: TDataSetProvider
    DataSet = IBQSuspeitoLocal
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 267
    Top = 155
  end
  object CDSSuspeitoLocal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSuspeitoLocal'
    OnCalcFields = CDSSuspeitoLocalCalcFields
    Left = 297
    Top = 155
    object CDSSuspeitoLocalTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSSuspeitoLocalCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSSuspeitoLocalNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSSuspeitoLocalEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSSuspeitoLocalDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSSuspeitoLocalTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSSuspeitoLocalTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSSuspeitoLocalTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSSuspeitoLocalOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSSuspeitoLocalIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSSuspeitoLocalIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSSuspeitoLocalIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSSuspeitoLocalIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSSuspeitoLocal: TDataSource
    DataSet = CDSSuspeitoLocal
    Left = 328
    Top = 155
  end
  object IBTSinalArrombamento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 205
    Top = 187
  end
  object IBQSinalArrombamento: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSinalArrombamento
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 22 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 236
    Top = 187
    object IntegerField1: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IntegerField3: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBStringField2: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IntegerField5: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IntegerField7: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IntegerField8: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPSinalArrombamento: TDataSetProvider
    DataSet = IBQSinalArrombamento
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 267
    Top = 187
  end
  object CDSSinalArrombamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSinalArrombamento'
    OnCalcFields = CDSSinalArrombamentoCalcFields
    Left = 297
    Top = 187
    object CDSSinalArrombamentoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSSinalArrombamentoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSSinalArrombamentoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSSinalArrombamentoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSSinalArrombamentoDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSSinalArrombamentoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSSinalArrombamentoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSSinalArrombamentoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSSinalArrombamentoOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSSinalArrombamentoIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSSinalArrombamentoIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSSinalArrombamentoIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSSinalArrombamentoIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSSinalArrombamento: TDataSource
    DataSet = CDSSinalArrombamento
    Left = 328
    Top = 187
  end
  object IBTJanelaMalFechada: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 205
    Top = 219
  end
  object IBQJanelaMalFechada: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTJanelaMalFechada
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 23 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 236
    Top = 219
    object IntegerField9: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IntegerField10: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IntegerField11: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBStringField4: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IntegerField12: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IntegerField13: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IntegerField14: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPJanelaMalFechada: TDataSetProvider
    DataSet = IBQJanelaMalFechada
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 267
    Top = 219
  end
  object CDSJanelaMalFechada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPJanelaMalFechada'
    OnCalcFields = CDSJanelaMalFechadaCalcFields
    Left = 297
    Top = 219
    object CDSJanelaMalFechadaTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSJanelaMalFechadaCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSJanelaMalFechadaNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSJanelaMalFechadaEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSJanelaMalFechadaDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSJanelaMalFechadaTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSJanelaMalFechadaTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSJanelaMalFechadaTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSJanelaMalFechadaOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSJanelaMalFechadaIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSJanelaMalFechadaIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSJanelaMalFechadaIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSJanelaMalFechadaIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSJanelaMalFechada: TDataSource
    DataSet = CDSJanelaMalFechada
    Left = 328
    Top = 219
  end
  object IBTSinalIndesejado: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 205
    Top = 251
  end
  object IBQSinalIndesejado: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTSinalIndesejado
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT COUNT(O.CDCLIENTE) AS TOTAL, C.CDCLIENTE, C.NMCLIENTE, O.' +
        'EQUIPAMENTO, S.DESUBTIPOOCORRENCIA,'
      ''
      '    (SELECT COUNT(L.CDCLIENTE) '
      '        FROM LOGEVENTO L'
      
        '        WHERE L.DATAEVENTO BETWEEN DATEADD(DAY, -30, CURRENT_DAT' +
        'E) AND CURRENT_DATE'
      
        '            AND (L.STATUS = '#39'0'#39' AND (L.REFERENCIA = '#39'0F'#39' OR L.RE' +
        'FERENCIA = '#39'00'#39' OR L.REFERENCIA = '#39'8F'#39' OR L.REFERENCIA = '#39'80'#39'))'
      '            AND L.CDCLIENTE = C.CDCLIENTE'
      '    ) AS TOTAL_ATIVA,'
      ''
      '    (SELECT COUNT(OS1.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS1'
      
        '        WHERE OS1.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS1.ISORDEMENCERRADA = 0 AND OS1.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_PENDENTE,'
      ''
      '    (SELECT COUNT(OS2.CDCLIENTE)  '
      '        FROM ORDEMSERVICO OS2'
      
        '        WHERE OS2.DATACADASTRO BETWEEN DATEADD(DAY, -30, CURRENT' +
        '_DATE) AND CURRENT_DATE AND OS2.ISORDEMENCERRADA = 1 AND OS2.CDC' +
        'LIENTE = C.CDCLIENTE'
      '    )AS TOTAL_REALIZADO'
      ''
      'FROM OCORRENCIA O '
      
        'INNER JOIN SUBTIPOOCORRENCIA S ON S.CDSUBTIPOOCORRENCIA = O.CDSU' +
        'BTIPOOCORRENCIA'
      'INNER JOIN CLIENTE C ON C.CDCLIENTE = O.CDCLIENTE'
      
        'WHERE O.CDSUBTIPOOCORRENCIA = 24 AND O.DATAEVENTO BETWEEN DATEAD' +
        'D(DAY, -30, CURRENT_DATE) AND CURRENT_DATE'
      
        'GROUP BY C.CDCLIENTE, C.NMCLIENTE, O.EQUIPAMENTO, S.DESUBTIPOOCO' +
        'RRENCIA, TOTAL_ATIVA, TOTAL_PENDENTE, TOTAL_REALIZADO '
      'ORDER BY COUNT(O.CDCLIENTE) DESC;')
    UniDirectional = True
    Left = 236
    Top = 251
    object IBQSinalIndesejadoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object IBQSinalIndesejadoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'CLIENTE.CDCLIENTE'
      Required = True
    end
    object IBQSinalIndesejadoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQSinalIndesejadoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'OCORRENCIA.EQUIPAMENTO'
    end
    object IBQSinalIndesejadoDESUBTIPOOCORRENCIA: TIBStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Origin = 'SUBTIPOOCORRENCIA.DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object IBQSinalIndesejadoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object IBQSinalIndesejadoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object IBQSinalIndesejadoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
  end
  object DSPSinalIndesejado: TDataSetProvider
    DataSet = IBQSinalIndesejado
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 267
    Top = 251
  end
  object CDSSinalIndesejado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSinalIndesejado'
    OnCalcFields = CDSSinalIndesejadoCalcFields
    Left = 297
    Top = 251
    object CDSSinalIndesejadoTOTAL: TIntegerField
      FieldName = 'TOTAL'
      Required = True
    end
    object CDSSinalIndesejadoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSSinalIndesejadoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSSinalIndesejadoEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
    end
    object CDSSinalIndesejadoDESUBTIPOOCORRENCIA: TStringField
      FieldName = 'DESUBTIPOOCORRENCIA'
      Size = 100
    end
    object CDSSinalIndesejadoTOTAL_ATIVA: TIntegerField
      FieldName = 'TOTAL_ATIVA'
    end
    object CDSSinalIndesejadoTOTAL_PENDENTE: TIntegerField
      FieldName = 'TOTAL_PENDENTE'
    end
    object CDSSinalIndesejadoTOTAL_REALIZADO: TIntegerField
      FieldName = 'TOTAL_REALIZADO'
    end
    object CDSSinalIndesejadoOBSERVACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'OBSERVACAO'
      Size = 200
      Calculated = True
    end
    object CDSSinalIndesejadoIBQCliConsLogEvento: TDataSetField
      FieldName = 'IBQCliConsLogEvento'
    end
    object CDSSinalIndesejadoIBQCliConsOcorrencia: TDataSetField
      FieldName = 'IBQCliConsOcorrencia'
    end
    object CDSSinalIndesejadoIBQCliConsArmeDesarme: TDataSetField
      FieldName = 'IBQCliConsArmeDesarme'
    end
    object CDSSinalIndesejadoIBQCliConsOrdemServico: TDataSetField
      FieldName = 'IBQCliConsOrdemServico'
    end
  end
  object DSSinalIndesejado: TDataSource
    DataSet = CDSSinalIndesejado
    Left = 328
    Top = 251
  end
end
