object FHome: TFHome
  Left = 194
  Top = 101
  AutoScroll = False
  Caption = 'AZSIM - Sistema Integrado de Monitoramento - Vers'#227'o 1.2.2'
  ClientHeight = 638
  ClientWidth = 1240
  Color = clBtnFace
  Constraints.MinHeight = 592
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
    Top = 621
    Width = 1240
    Height = 17
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
    Width = 1240
    Height = 621
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object PGCHome: TPageControl
      Left = 1
      Top = 1
      Width = 1238
      Height = 619
      ActivePage = TSUltimoEstado
      Align = alClient
      MultiLine = True
      TabIndex = 2
      TabOrder = 0
      TabPosition = tpLeft
      object TSRegistroEventos: TTabSheet
        Caption = 'Atendimento'
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 353
          Width = 1211
          Height = 9
          Cursor = crVSplit
          Align = alTop
          Beveled = True
        end
        object pnlEventos: TPanel
          Left = 0
          Top = 362
          Width = 1211
          Height = 249
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object gridEventos: TDBGrid
            Left = 0
            Top = 30
            Width = 1211
            Height = 171
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = DSEventos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridEventosDrawColumnCell
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
          object pnlConsultaEventos: TPanel
            Left = 0
            Top = 201
            Width = 1211
            Height = 48
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label2: TLabel
              Left = 9
              Top = 4
              Width = 53
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label3: TLabel
              Left = 106
              Top = 4
              Width = 48
              Height = 13
              Caption = 'Data Final'
            end
            object Label6: TLabel
              Left = 203
              Top = 4
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
            object Label8: TLabel
              Left = 259
              Top = 4
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
            object Label4: TLabel
              Left = 446
              Top = 4
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
            object Label5: TLabel
              Left = 517
              Top = 4
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
              Left = 589
              Top = 4
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
            object BtnConsultar: TSpeedButton
              Left = 772
              Top = 18
              Width = 113
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
            object EdtDataInicial: TDateTimePicker
              Left = 9
              Top = 19
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
            object EdtDataFinal: TDateTimePicker
              Left = 106
              Top = 19
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
            object EdtCodCliente: TEdit
              Left = 202
              Top = 19
              Width = 53
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object EdtNome: TEdit
              Left = 257
              Top = 19
              Width = 185
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 3
            end
            object EdtCodificador: TEdit
              Left = 443
              Top = 19
              Width = 70
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 4
            end
            object EdtStatus: TEdit
              Left = 514
              Top = 19
              Width = 70
              Height = 21
              Hint = 'Exemplo: 0.0*'
              CharCase = ecUpperCase
              TabOrder = 5
            end
            object EdtStatusDescricao: TEdit
              Left = 585
              Top = 19
              Width = 185
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 6
            end
            object CkbAtualizar: TCheckBox
              Left = 889
              Top = 21
              Width = 111
              Height = 17
              Caption = 'Monitorar eventos'
              Checked = True
              State = cbChecked
              TabOrder = 7
              OnClick = CkbAtualizarClick
            end
          end
          object pnlSubTituloForm: TPanel
            Left = 0
            Top = 0
            Width = 1211
            Height = 30
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = ' Monitor de eventos'
            Color = clPurple
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object pnlOcorrencias: TPanel
          Left = 0
          Top = 0
          Width = 1211
          Height = 353
          Align = alTop
          TabOrder = 1
          object gridOcorrencias: TDBGrid
            Left = 1
            Top = 31
            Width = 1209
            Height = 321
            Align = alClient
            BorderStyle = bsNone
            Ctl3D = True
            DataSource = DSOcorrenciasAbertas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = gridOcorrenciasDrawColumnCell
            OnDblClick = gridOcorrenciasDblClick
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
          object pnlTituloForm: TPanel
            Left = 1
            Top = 1
            Width = 1209
            Height = 30
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = ' Atendimento de ocorr'#234'ncias'
            Color = clPurple
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TSResgistroOcorrencia: TTabSheet
        Caption = 'HIst'#243'rico'
        ImageIndex = 2
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1211
          Height = 611
          Align = alClient
          TabOrder = 0
          object BtnConsultarOC: TSpeedButton
            Left = 9
            Top = 107
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
            Top = 107
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
            Top = 40
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
            Left = 1
            Top = 136
            Width = 1209
            Height = 474
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
            Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGOcorrenciasHistDrawColumnCell
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
            Top = 40
            Width = 437
            Height = 62
            Caption = ' Cliente ou Codificador '
            TabOrder = 1
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
            Top = 40
            Width = 343
            Height = 62
            Caption = ' Estatus ou Descri'#231#227'o'
            TabOrder = 2
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
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 1209
            Height = 30
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = ' Hist'#243'rico de atendimentos'
            Color = clPurple
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object TSUltimoEstado: TTabSheet
        Caption = 'Centrais'
        ImageIndex = 2
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 1211
          Height = 611
          Align = alClient
          TabOrder = 0
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 1209
            Height = 30
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = ' '#218'ltimo estado das centrais'
            Color = clPurple
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object PageControl1: TPageControl
            Left = 1
            Top = 31
            Width = 1209
            Height = 579
            ActivePage = TSSemIdentificacao
            Align = alClient
            Style = tsFlatButtons
            TabIndex = 1
            TabOrder = 1
            object TSIdentificacao: TTabSheet
              Caption = 'Clientes identificados '#250'ltimos 30 dias'
              object Splitter2: TSplitter
                Left = 0
                Top = 413
                Width = 1201
                Height = 9
                Cursor = crVSplit
                Align = alTop
                Beveled = True
              end
              object DBGClientesUltimosEventos: TDBGrid
                Left = 0
                Top = 422
                Width = 1201
                Height = 126
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = DSIdentificacaoCliente
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGClientesUltimosEventosDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DATACADASTRO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Data cadastro'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATAIDENTIFICACAO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Data identifica'#231#227'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 230
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDENTIFICACAO'
                    Title.Caption = 'Identifica'#231#227'o'
                    Width = 300
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATAULTIMOEVENTO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Data '#250'ltimo evento recebido'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 230
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ULTIMOEVENTO'
                    Title.Caption = 'Evento'
                    Width = 1024
                    Visible = True
                  end>
              end
              object DBGClientesIdentificados: TDBGrid
                Left = 0
                Top = 113
                Width = 1201
                Height = 300
                Align = alTop
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = DSIdentificao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGClientesIdentificadosDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CDCLIENTE'
                    Title.Caption = 'Cod.'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NMCLIENTE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Cliente'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 380
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
                    Width = 100
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TOTAL30DIAS'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Alignment = taCenter
                    Title.Caption = 'Total '#250'ltimos 30 dias'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 130
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'PERCENTUAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Percentual'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clMaroon
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ULTIMADATA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Data '#250'ltimo evento'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDENTIFICACAO'
                    Title.Caption = 'Identifica'#231#227'o'
                    Width = 1024
                    Visible = True
                  end>
              end
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 1201
                Height = 113
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object BtnConsultarClientesIdentificados: TSpeedButton
                  Left = 9
                  Top = 74
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
                  OnClick = BtnConsultarClientesIdentificadosClick
                end
                object SpeedButton3: TSpeedButton
                  Left = 150
                  Top = 74
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
                object GroupBox4: TGroupBox
                  Left = 8
                  Top = 8
                  Width = 441
                  Height = 62
                  Caption = ' Cliente ou Codificador '
                  TabOrder = 0
                  object Label15: TLabel
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
                  object Label16: TLabel
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
                  object Label17: TLabel
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
                  object EdtCodClienteIdentificados: TEdit
                    Left = 12
                    Top = 32
                    Width = 70
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 0
                  end
                  object EdtNomeClienteIdentificados: TEdit
                    Left = 84
                    Top = 32
                    Width = 274
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 1
                  end
                  object EdtCodificadorIdentificados: TEdit
                    Left = 360
                    Top = 32
                    Width = 70
                    Height = 21
                    CharCase = ecUpperCase
                    TabOrder = 2
                  end
                end
              end
            end
            object TSSemIdentificacao: TTabSheet
              Caption = 'Clientes n'#227'o identificados '#250'ltimos 7 dias'
              ImageIndex = 1
              object Splitter3: TSplitter
                Left = 0
                Top = 353
                Width = 1201
                Height = 9
                Cursor = crVSplit
                Align = alTop
                Beveled = True
              end
              object DBGrid3: TDBGrid
                Left = 0
                Top = 362
                Width = 1201
                Height = 186
                Align = alClient
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = DSIdentificacaoCliente
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
                    FieldName = 'DATACADASTRO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Data cadastro'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATAIDENTIFICACAO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Data identifica'#231#227'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 230
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDENTIFICACAO'
                    Title.Caption = 'Identifica'#231#227'o'
                    Width = 300
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATAULTIMOEVENTO'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Data '#250'ltimo evento recebido'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 230
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ULTIMOEVENTO'
                    Title.Caption = 'Evento'
                    Width = 1024
                    Visible = True
                  end>
              end
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 1201
                Height = 53
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object BtnConsultarClientesNaoIdentificados: TSpeedButton
                  Left = 9
                  Top = 10
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
                  OnClick = BtnConsultarClientesNaoIdentificadosClick
                end
                object SpeedButton4: TSpeedButton
                  Left = 150
                  Top = 10
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
              end
              object DBGrid4: TDBGrid
                Left = 0
                Top = 53
                Width = 1201
                Height = 300
                Align = alTop
                BorderStyle = bsNone
                Ctl3D = True
                DataSource = DSIdentificao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CDCLIENTE'
                    Title.Caption = 'Cod.'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NMCLIENTE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Cliente'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 380
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
                    Width = 100
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'TOTAL30DIAS'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Alignment = taCenter
                    Title.Caption = 'Total '#250'ltimos 30 dias'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 130
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'PERCENTUAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMaroon
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Percentual'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clMaroon
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ULTIMADATA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    Title.Caption = 'Data '#250'ltimo evento'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDENTIFICACAO'
                    Title.Caption = 'Identifica'#231#227'o'
                    Width = 1024
                    Visible = True
                  end>
              end
            end
          end
        end
      end
    end
  end
  object MMenuHome: TMainMenu
    Left = 64
    Top = 219
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
      object N4: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Clientesativos1: TMenuItem
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
        Caption = 'Contratos ativos'
        OnClick = Clientesativos1Click
      end
      object Clientesinativos1: TMenuItem
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
        Caption = 'Contratos cancelados'
        OnClick = Clientesinativos1Click
      end
      object N5: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Codificadores1: TMenuItem
        Caption = 'Codificadores'
        Visible = False
      end
      object N6: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Consultasimplificadadeclientes1: TMenuItem
        Caption = ' Consulta simplificada de clientes'
        OnClick = Consultasimplificadadeclientes1Click
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
      object MnRelEventos: TMenuItem
        Caption = 'Relat'#243'rios de Eventos...'
        OnClick = MnRelEventosClick
      end
      object MnRelOcorrencias: TMenuItem
        Caption = 'Relat'#243'rio de Ocorr'#234'ncias...'
        OnClick = MnRelOcorrenciasClick
      end
      object N2: TMenuItem
        Caption = '-'
        Visible = False
      end
      object MnRelContratosAtivos: TMenuItem
        Caption = 'Relat'#243'rio de Clientes Ativos'
        Visible = False
      end
      object MnRelContratosInativos: TMenuItem
        Caption = 'Relat'#243'rio de Clientes Inativos'
        Visible = False
      end
    end
  end
  object TMRConsulta: TTimer
    Enabled = False
    OnTimer = TMRConsultaTimer
    Left = 296
    Top = 526
  end
  object DSEventos: TDataSource
    DataSet = CDSConsEventos
    Left = 296
    Top = 478
  end
  object CDSConsEventos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPEventos'
    Left = 296
    Top = 430
    object CDSConsEventosCTX: TIntegerField
      FieldName = 'CTX'
      Origin = 'LOGEVENTO.CTX'
    end
    object CDSConsEventosPORTACOM: TIntegerField
      FieldName = 'PORTACOM'
      Origin = 'LOGEVENTO.PORTACOM'
    end
    object CDSConsEventosEQUIPAMENTO: TIntegerField
      FieldName = 'EQUIPAMENTO'
      Origin = 'LOGEVENTO.EQUIPAMENTO'
    end
    object CDSConsEventosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'VLOGEVENTO.STATUS'
      ReadOnly = True
      Size = 4
    end
    object CDSConsEventosDESTATUS: TStringField
      FieldName = 'DESTATUS'
      Origin = 'LOGEVENTO.DESTATUS'
      Size = 70
    end
    object CDSConsEventosNMCLIENTE: TStringField
      DisplayWidth = 260
      FieldName = 'NMCLIENTE'
      Origin = 'LOGEVENTO.NMCLIENTE'
      Size = 260
    end
    object CDSConsEventosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'LOGEVENTO.ENDERECO'
      Size = 60
    end
    object CDSConsEventosCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'LOGEVENTO.CIDADE'
      Size = 30
    end
    object CDSConsEventosDATAEVENTO: TDateTimeField
      FieldName = 'DATAEVENTO'
      Origin = 'LOGEVENTO.DATAEVENTO'
    end
    object CDSConsEventosCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'VLOGEVENTO.CDCLIENTE'
    end
  end
  object DSPEventos: TDataSetProvider
    DataSet = IBQConsEventos
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 382
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
    Left = 296
    Top = 334
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
      Size = 260
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
    Left = 297
    Top = 286
  end
  object TMRMonitoramento: TTimer
    Enabled = False
    Interval = 180000
    OnTimer = TMRMonitoramentoTimer
    Left = 152
    Top = 528
  end
  object IBEOcorrencia: TIBEvents
    AutoRegister = False
    Database = DModule.IBCONAzsim
    Registered = False
    OnEventAlert = IBEOcorrenciaEventAlert
    Left = 152
    Top = 218
  end
  object DSRelAtendimento: TDataSource
    DataSet = CDSRelAtendimento
    Left = 392
    Top = 478
  end
  object CDSRelAtendimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRelAtendimento'
    Left = 392
    Top = 430
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
    Left = 392
    Top = 382
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
    Left = 392
    Top = 334
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
      Size = 256
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
    Left = 393
    Top = 286
  end
  object IBTOcorrenciasAbertas: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 505
    Top = 284
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
      
        '    O.DESTATUS, C.CDCLIENTE,  C.ENDERECO, C.BAIRRO, C.CIDADE, O.' +
        'CDOPERADORENCERRAMENTO,'
      
        '    CASE WHEN C.NMFANTASIA IS NULL THEN C.NMCLIENTE ELSE C.NMFAN' +
        'TASIA END AS NMCLIENTE, '
      '    O.CDTIPOOCORRENCIA, O.CDSUBTIPOOCORRENCIA, O.RESUMO'
      
        'FROM OCORRENCIA O INNER JOIN CLIENTE C ON O.CDCLIENTE = C.CDCLIE' +
        'NTE'
      
        'WHERE O.ISOCORRENCIAENCERRADA = 0 AND O.CDOCORRENCIAPAI = 0 ORDE' +
        'R BY O.DATAEVENTO, O.CDOCORRENCIA;')
    UniDirectional = True
    Left = 504
    Top = 332
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
      Size = 256
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
    Left = 504
    Top = 382
  end
  object CDSOcorrenciasAbertas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOcorrenciasAbertas'
    Left = 505
    Top = 430
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
    Left = 505
    Top = 477
  end
  object IBTConsFaltaComunicacao: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 153
    Top = 288
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
    Left = 152
    Top = 336
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
    Left = 152
    Top = 384
  end
  object CDSConsFaltaComunicacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsFaltaComunicacao'
    Left = 152
    Top = 432
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
    Left = 152
    Top = 480
  end
  object DSIdentificao: TDataSource
    DataSet = CDSIdentificao
    Left = 625
    Top = 525
  end
  object CDSIdentificao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPIdentificao'
    Left = 625
    Top = 478
    object CDSIdentificaoULTIMADATA: TDateTimeField
      FieldName = 'ULTIMADATA'
    end
    object CDSIdentificaoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSIdentificaoIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Size = 100
    end
    object CDSIdentificaoNMCLIENTE: TStringField
      FieldName = 'NMCLIENTE'
      Size = 60
    end
    object CDSIdentificaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object CDSIdentificaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object CDSIdentificaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object CDSIdentificaoTOTAL30DIAS: TIntegerField
      FieldName = 'TOTAL30DIAS'
      Required = True
    end
    object CDSIdentificaoIBQIdentificacaoCliente: TDataSetField
      FieldName = 'IBQIdentificacaoCliente'
    end
    object CDSIdentificaoPERCENTUAL: TBCDField
      FieldName = 'PERCENTUAL'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object DSPIdentificao: TDataSetProvider
    DataSet = IBQIdentificao
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 624
    Top = 430
  end
  object IBQIdentificao: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTIdentificao
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT MAX(L.DATAIDENTIFICACAO) AS ULTIMADATA, L.CDCLIENTE, L.ID' +
        'ENTIFICACAO, C.NMCLIENTE, C.ENDERECO, C.BAIRRO, C.CIDADE,'
      'COUNT((SELECT COUNT(LL.CDLOGULTIMOESTADO) '
      #9#9'FROM LOGULTIMOESTADO LL '
      #9#9'WHERE LL.CDCLIENTE=L.CDCLIENTE AND '
      #9#9#9'LL.DATACADASTRO > DATEADD(-20 DAY TO L.DATACADASTRO) '
      #9#9#9'AND LL.IDENTIFICACAO IS NOT NULL))AS TOTAL30DIAS,'
      
        '(CAST((100.00/30) AS NUMERIC(3,2)) *  COUNT((SELECT COUNT(LL.CDL' +
        'OGULTIMOESTADO) '
      #9#9'FROM LOGULTIMOESTADO LL '
      #9#9'WHERE LL.CDCLIENTE=L.CDCLIENTE AND '
      #9#9#9'LL.DATACADASTRO > DATEADD(-20 DAY TO L.DATACADASTRO) '
      #9#9#9'AND LL.IDENTIFICACAO IS NOT NULL))) AS PERCENTUAL'
      'FROM LOGULTIMOESTADO L '
      #9'JOIN CLIENTE C ON C.CDCLIENTE = L.CDCLIENTE'
      
        #9'JOIN CONTRATO CO ON CO.CDCLIENTE = L.CDCLIENTE AND CO.INATIVO =' +
        ' 0'
      
        'GROUP BY L.CDCLIENTE, L.IDENTIFICACAO, C.NMCLIENTE, C.ENDERECO, ' +
        'C.BAIRRO, C.CIDADE;')
    UniDirectional = True
    Left = 624
    Top = 332
    object IBQIdentificaoULTIMADATA: TDateTimeField
      FieldName = 'ULTIMADATA'
    end
    object IBQIdentificaoCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'LOGULTIMOESTADO.CDCLIENTE'
      Required = True
    end
    object IBQIdentificaoIDENTIFICACAO: TIBStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'LOGULTIMOESTADO.IDENTIFICACAO'
      Size = 100
    end
    object IBQIdentificaoNMCLIENTE: TIBStringField
      FieldName = 'NMCLIENTE'
      Origin = 'CLIENTE.NMCLIENTE'
      Size = 60
    end
    object IBQIdentificaoENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTE.ENDERECO'
      Size = 60
    end
    object IBQIdentificaoBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTE.BAIRRO'
      Size = 60
    end
    object IBQIdentificaoCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTE.CIDADE'
      Size = 60
    end
    object IBQIdentificaoTOTAL30DIAS: TIntegerField
      FieldName = 'TOTAL30DIAS'
      Required = True
    end
    object IBQIdentificaoPERCENTUAL: TIBBCDField
      FieldName = 'PERCENTUAL'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object IBTIdentificao: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 625
    Top = 284
  end
  object DSLinkIdentificacaoCliente: TDataSource
    DataSet = IBQIdentificao
    Left = 624
    Top = 381
  end
  object IBQIdentificacaoCliente: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTIdentificao
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSLinkIdentificacaoCliente
    SQL.Strings = (
      
        'SELECT L.CDLOGULTIMOESTADO, L.DATACADASTRO, L.DATAIDENTIFICACAO,' +
        ' L.CDCLIENTE, L.IDENTIFICACAO, L.DATAULTIMOEVENTO, L.ULTIMOEVENT' +
        'O'
      'FROM LOGULTIMOESTADO L '
      #9'JOIN CLIENTE C ON C.CDCLIENTE = L.CDCLIENTE'
      
        #9'JOIN CONTRATO CO ON CO.CDCLIENTE = L.CDCLIENTE AND CO.INATIVO =' +
        ' 0'
      
        'WHERE C.CDCLIENTE = :CDCLIENTE AND L.DATACADASTRO > DATEADD(-30 ' +
        'DAY TO L.DATACADASTRO) '
      'ORDER BY L.DATAIDENTIFICACAO;')
    Left = 749
    Top = 331
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
        Size = 4
      end>
    object IBQIdentificacaoClienteCDLOGULTIMOESTADO: TIntegerField
      FieldName = 'CDLOGULTIMOESTADO'
      Origin = 'LOGULTIMOESTADO.CDLOGULTIMOESTADO'
      Required = True
    end
    object IBQIdentificacaoClienteDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Origin = 'LOGULTIMOESTADO.DATACADASTRO'
      Required = True
    end
    object IBQIdentificacaoClienteDATAIDENTIFICACAO: TDateTimeField
      FieldName = 'DATAIDENTIFICACAO'
      Origin = 'LOGULTIMOESTADO.DATAIDENTIFICACAO'
    end
    object IBQIdentificacaoClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Origin = 'LOGULTIMOESTADO.CDCLIENTE'
      Required = True
    end
    object IBQIdentificacaoClienteIDENTIFICACAO: TIBStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'LOGULTIMOESTADO.IDENTIFICACAO'
      Size = 100
    end
    object IBQIdentificacaoClienteDATAULTIMOEVENTO: TDateTimeField
      FieldName = 'DATAULTIMOEVENTO'
      Origin = 'LOGULTIMOESTADO.DATAULTIMOEVENTO'
    end
    object IBQIdentificacaoClienteULTIMOEVENTO: TIBStringField
      FieldName = 'ULTIMOEVENTO'
      Origin = 'LOGULTIMOESTADO.ULTIMOEVENTO'
      Size = 100
    end
  end
  object DSPIdentificaoCliente: TDataSetProvider
    DataSet = IBQIdentificacaoCliente
    Constraints = True
    Left = 750
    Top = 381
  end
  object CDSIdentificaoCliente: TClientDataSet
    Aggregates = <>
    DataSetField = CDSIdentificaoIBQIdentificacaoCliente
    Params = <>
    Left = 752
    Top = 430
    object CDSIdentificaoClienteCDLOGULTIMOESTADO: TIntegerField
      FieldName = 'CDLOGULTIMOESTADO'
      Required = True
    end
    object CDSIdentificaoClienteDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
      Required = True
    end
    object CDSIdentificaoClienteDATAIDENTIFICACAO: TDateTimeField
      FieldName = 'DATAIDENTIFICACAO'
    end
    object CDSIdentificaoClienteCDCLIENTE: TIntegerField
      FieldName = 'CDCLIENTE'
      Required = True
    end
    object CDSIdentificaoClienteIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Size = 100
    end
    object CDSIdentificaoClienteDATAULTIMOEVENTO: TDateTimeField
      FieldName = 'DATAULTIMOEVENTO'
    end
    object CDSIdentificaoClienteULTIMOEVENTO: TStringField
      FieldName = 'ULTIMOEVENTO'
      Size = 100
    end
  end
  object DSIdentificacaoCliente: TDataSource
    DataSet = CDSIdentificaoCliente
    Left = 754
    Top = 477
  end
end
