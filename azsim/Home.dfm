object FHome: TFHome
  Left = 192
  Top = 104
  AutoScroll = False
  Caption = 'AZSIM - Sistema Integrado de Monitoramento - Vers'#227'o 1.0.0.35'
  ClientHeight = 719
  ClientWidth = 1242
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
    Top = 702
    Width = 1242
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
    Width = 1242
    Height = 702
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object PGCHome: TPageControl
      Left = 1
      Top = 1
      Width = 1240
      Height = 700
      ActivePage = TSRegistroEventos
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TSRegistroEventos: TTabSheet
        Caption = 'Registro de Eventos'
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 441
          Width = 1232
          Height = 9
          Cursor = crVSplit
          Align = alTop
          Beveled = True
        end
        object pnlEventos: TPanel
          Left = 0
          Top = 450
          Width = 1232
          Height = 222
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object gridEventos: TDBGrid
            Left = 0
            Top = 0
            Width = 1232
            Height = 174
            Align = alClient
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
          object pnlConsultaEventos: TPanel
            Left = 0
            Top = 174
            Width = 1232
            Height = 48
            Align = alBottom
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
              Left = 275
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
              Left = 495
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
              Left = 566
              Top = 3
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
              Left = 638
              Top = 3
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
              Left = 857
              Top = 18
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
              Width = 70
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
            end
            object EdtNome: TEdit
              Left = 274
              Top = 19
              Width = 219
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 3
            end
            object EdtCodificador: TEdit
              Left = 494
              Top = 19
              Width = 70
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 4
            end
            object EdtStatus: TEdit
              Left = 565
              Top = 19
              Width = 70
              Height = 21
              Hint = 'Exemplo: 0.0*'
              CharCase = ecUpperCase
              TabOrder = 5
            end
            object EdtStatusDescricao: TEdit
              Left = 637
              Top = 19
              Width = 219
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 6
            end
            object CkbAtualizar: TCheckBox
              Left = 1002
              Top = 20
              Width = 86
              Height = 17
              Caption = 'Ligar Monitor'
              Checked = True
              State = cbChecked
              TabOrder = 7
              OnClick = CkbAtualizarClick
            end
          end
        end
        object pnlOcorrencias: TPanel
          Left = 0
          Top = 0
          Width = 1232
          Height = 441
          Align = alTop
          TabOrder = 1
          object gridOcorrencias: TDBGrid
            Left = 1
            Top = 1
            Width = 1230
            Height = 439
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
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
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
          Width = 1232
          Height = 576
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
      FieldName = 'NMCLIENTE'
      Origin = 'LOGEVENTO.NMCLIENTE'
      Size = 60
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
  object IBQCliConsOrdemServico: TIBQuery
    Database = DModule.IBCONAzsim
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
    Left = 758
    Top = 502
  end
  object IBQCliConsArmeDesarme: TIBQuery
    Database = DModule.IBCONAzsim
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
    Left = 862
    Top = 502
  end
  object DSMasterCliConsOcorrencia: TDataSource
    Left = 966
    Top = 502
  end
  object DSMasterCliConsLogEvento: TDataSource
    Left = 1070
    Top = 502
  end
end
