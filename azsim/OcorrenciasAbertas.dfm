object FConsOcorrenciasAbertas: TFConsOcorrenciasAbertas
  Left = 450
  Top = 219
  Width = 891
  Height = 368
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Ocorr'#234'ncias Abertas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 883
    Height = 41
    Align = alTop
    Color = clWindow
    TabOrder = 0
    DesignSize = (
      883
      41)
    object Label1: TLabel
      Left = 565
      Top = 11
      Width = 143
      Height = 16
      Anchors = [akRight]
      Caption = 'Selecionar Atendimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 242
      Height = 24
      Caption = 'Atendimento de Ocorr'#234'ncias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 719
      Top = 9
      Width = 145
      Height = 21
      Anchors = [akRight]
      TabOrder = 0
      Visible = False
    end
  end
  object PGCOcorrencias: TPageControl
    Left = 0
    Top = 41
    Width = 883
    Height = 259
    ActivePage = TSOcorrencias
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object TSOcorrencias: TTabSheet
      Caption = 'Lista de Ocorr'#234'ncias'
      object DBGOcorrencias: TDBGrid
        Left = 0
        Top = 0
        Width = 875
        Height = 231
        Align = alClient
        BorderStyle = bsNone
        Ctl3D = True
        DataSource = DSOcorrenciasAbertas
        DefaultDrawing = False
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
        OnDrawColumnCell = DBGOcorrenciasDrawColumnCell
        OnDblClick = DBGOcorrenciasDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CDOCORRENCIA'
            Title.Caption = 'N'#250'mero OC.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTX'
            Title.Caption = 'Ctx'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PORTACOM'
            Title.Caption = 'Com'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EQUIPAMENTO'
            Title.Caption = 'Codificador'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESTATUS'
            Title.Caption = 'Descri'#231#227'o'
            Width = 200
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
            FieldName = 'ENDERECO'
            Title.Caption = 'Endere'#231'o'
            Width = 290
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Title.Caption = 'Bairro'
            Width = 180
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
  object Panel2: TPanel
    Left = 0
    Top = 300
    Width = 883
    Height = 41
    Align = alBottom
    TabOrder = 2
    object LblOcorrencia: TLabel
      Left = 13
      Top = 11
      Width = 76
      Height = 16
      Caption = 'Ocorr'#234'ncia #'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object DSOcorrenciasAbertas: TDataSource
    DataSet = CDSOcorrenciasAbertas
    Left = 840
    Top = 114
  end
  object IBTOcorrenciasAbertas: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 713
    Top = 114
  end
  object IBQOcorrenciasAbertas: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = IBTOcorrenciasAbertas
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      
        '    O.CDOCORRENCIA, O.CTX, O.PORTACOM, O.EQUIPAMENTO, O.STATUS |' +
        '| '#39'.'#39' || REPLACE(O.REFERENCIA, '#39'F'#39', '#39'*'#39') AS STATUS,'
      
        '    O.DESTATUS, C.NMCLIENTE, C.ENDERECO, C.BAIRRO, C.CIDADE, O.C' +
        'DOPERADORENCERRAMENTO,'
      '    O.CDTIPOOCORRENCIA, O.CDSUBTIPOOCORRENCIA, O.RESUMO'
      
        'FROM OCORRENCIA O INNER JOIN CLIENTE C ON O.CDCLIENTE = C.CDCLIE' +
        'NTE'
      
        'WHERE O.ISOCORRENCIAENCERRADA = 0 /*AND O.CDOCORRENCIAPAI = 0*/ ' +
        'ORDER BY O.DATAEVENTO, O.CDOCORRENCIA;')
    UniDirectional = True
    Left = 744
    Top = 114
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
  end
  object DSPOcorrenciasAbertas: TDataSetProvider
    DataSet = IBQOcorrenciasAbertas
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 776
    Top = 114
  end
  object CDSOcorrenciasAbertas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPOcorrenciasAbertas'
    AfterScroll = CDSOcorrenciasAbertasAfterScroll
    Left = 808
    Top = 114
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
  end
end
