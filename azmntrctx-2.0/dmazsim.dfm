object DModule: TDModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 1093
  Top = 198
  Height = 353
  Width = 741
  object IBTMonitor: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 408
    Top = 8
  end
  object IBCONAzsim: TIBDatabase
    DatabaseName = 'C:\Desenvolvimento\database\AZSIMDB-LAJEADO.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTMonitor
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 24
    Top = 8
  end
  object IBQMonitor: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTMonitor
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'INSERT INTO LOGEVENTO('
      '    CTX,'
      '    TIPOCTX,'
      '    PORTACOM,'
      '    EQUIPAMENTO,'
      '    NREVENTO,'
      '    STATUS,'
      '    REFERENCIA,'
      '    DESTATUS,'
      '    MONITOR,'
      '    IDENTIFICACAO,'
      '    DATAEVENTO,'
      '    CDCLIENTE,'
      '    NMCLIENTE,'
      '    NUMSETOR,'
      '    LOCAL,'
      '    ENDERECO,'
      '    CIDADE,'
      '    NMFILIAL'
      ')VALUES('
      '    :CTX,'
      '    :TIPOCTX,'
      '    :PORTACOM,'
      '    :EQUIPAMENTO,'
      '    :NREVENTO,'
      '    :STATUS,'
      '    :REFERENCIA,'
      '    :DESTATUS,'
      '    :MONITOR,'
      '    :IDENTIFICACAO,'
      '    :DATAEVENTO,'
      '    :CDCLIENTE,'
      '    :NMCLIENTE,'
      '    :NUMSETOR,'
      '    :LOCAL,'
      '    :ENDERECO,'
      '    :CIDADE,'
      '    :NMFILIAL'
      ');')
    Left = 408
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CTX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPOCTX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PORTACOM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EQUIPAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NREVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MONITOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDENTIFICACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NMCLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMSETOR'
        ParamType = ptInput
        Value = Null
      end
      item
        DataType = ftUnknown
        Name = 'LOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ENDERECO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CIDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NMFILIAL'
        ParamType = ptUnknown
      end>
  end
  object IBTStatus: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 88
    Top = 8
  end
  object IBQStatus: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTStatus
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT ALARME, CDSTATUS, COR, DESCRICAO, GRUPO, IDENTIFICACAO, M' +
        'ENSAGEM, MONITOR, OCORRENCIA, REFERENCIA1, REFERENCIA2, SETOR, E' +
        'STATUS FROM STATUS ORDER BY CDSTATUS')
    UniDirectional = True
    Left = 88
    Top = 64
    object IBQStatusALARME: TIntegerField
      FieldName = 'ALARME'
      Origin = 'STATUS.ALARME'
    end
    object IBQStatusCDSTATUS: TIntegerField
      FieldName = 'CDSTATUS'
      Origin = 'STATUS.CDSTATUS'
      Required = True
    end
    object IBQStatusCOR: TIntegerField
      FieldName = 'COR'
      Origin = 'STATUS.COR'
    end
    object IBQStatusDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'STATUS.DESCRICAO'
      Size = 70
    end
    object IBQStatusGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = 'STATUS.GRUPO'
      Size = 3
    end
    object IBQStatusIDENTIFICACAO: TIntegerField
      FieldName = 'IDENTIFICACAO'
      Origin = 'STATUS.IDENTIFICACAO'
    end
    object IBQStatusMENSAGEM: TIntegerField
      FieldName = 'MENSAGEM'
      Origin = 'STATUS.MENSAGEM'
    end
    object IBQStatusMONITOR: TIntegerField
      FieldName = 'MONITOR'
      Origin = 'STATUS.MONITOR'
    end
    object IBQStatusOCORRENCIA: TIntegerField
      FieldName = 'OCORRENCIA'
      Origin = 'STATUS.OCORRENCIA'
    end
    object IBQStatusREFERENCIA1: TIBStringField
      FieldName = 'REFERENCIA1'
      Origin = 'STATUS.REFERENCIA1'
      Size = 2
    end
    object IBQStatusREFERENCIA2: TIBStringField
      FieldName = 'REFERENCIA2'
      Origin = 'STATUS.REFERENCIA2'
      Size = 2
    end
    object IBQStatusSETOR: TIBStringField
      FieldName = 'SETOR'
      Origin = 'STATUS.SETOR'
      Size = 2
    end
    object IBQStatusESTATUS: TIBStringField
      FieldName = 'ESTATUS'
      Origin = 'STATUS.ESTATUS'
      Size = 1
    end
  end
  object DSStatus: TDataSource
    DataSet = CDSStatus
    Left = 88
    Top = 232
  end
  object DSPStatus: TDataSetProvider
    DataSet = IBQStatus
    Constraints = True
    Left = 88
    Top = 128
  end
  object CDSStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPStatus'
    Left = 88
    Top = 176
    object CDSStatusALARME: TIntegerField
      FieldName = 'ALARME'
    end
    object CDSStatusCDSTATUS: TIntegerField
      FieldName = 'CDSTATUS'
      Required = True
    end
    object CDSStatusCOR: TIntegerField
      FieldName = 'COR'
    end
    object CDSStatusDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object CDSStatusGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 3
    end
    object CDSStatusIDENTIFICACAO: TIntegerField
      FieldName = 'IDENTIFICACAO'
    end
    object CDSStatusMENSAGEM: TIntegerField
      FieldName = 'MENSAGEM'
    end
    object CDSStatusMONITOR: TIntegerField
      FieldName = 'MONITOR'
    end
    object CDSStatusOCORRENCIA: TIntegerField
      FieldName = 'OCORRENCIA'
    end
    object CDSStatusREFERENCIA1: TStringField
      FieldName = 'REFERENCIA1'
      Size = 2
    end
    object CDSStatusREFERENCIA2: TStringField
      FieldName = 'REFERENCIA2'
      Size = 2
    end
    object CDSStatusSETOR: TStringField
      FieldName = 'SETOR'
      Size = 2
    end
    object CDSStatusESTATUS: TStringField
      FieldName = 'ESTATUS'
      Size = 1
    end
  end
  object IBTStatusCliente: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 168
    Top = 8
  end
  object IBQStatusCliente: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTStatusCliente
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT C.CDCODIFICADOR, S.ESTATUS, S.REFERENCIA1, S.REFERENCIA2,' +
        ' S.SETOR, S.GRUPO, S.ALARME, S.MENSAGEM, S.MONITOR, S.IDENTIFICA' +
        'CAO, S.OCORRENCIA, S.DESCRICAO, S.COR'
      
        'FROM STATUSCLIENTE S INNER JOIN CONTRATO C ON S.CDCONTRATO = C.C' +
        'DCONTRATO'
      'ORDER BY CDSTATUSCLIENTE;')
    UniDirectional = True
    Left = 168
    Top = 64
    object IBQStatusClienteCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
      Origin = 'CONTRATO.CDCODIFICADOR'
    end
    object IBQStatusClienteESTATUS: TIBStringField
      FieldName = 'ESTATUS'
      Origin = 'STATUSCLIENTE.ESTATUS'
      Size = 1
    end
    object IBQStatusClienteREFERENCIA1: TIBStringField
      FieldName = 'REFERENCIA1'
      Origin = 'STATUSCLIENTE.REFERENCIA1'
      Size = 2
    end
    object IBQStatusClienteREFERENCIA2: TIBStringField
      FieldName = 'REFERENCIA2'
      Origin = 'STATUSCLIENTE.REFERENCIA2'
      Size = 2
    end
    object IBQStatusClienteSETOR: TIBStringField
      FieldName = 'SETOR'
      Origin = 'STATUSCLIENTE.SETOR'
      Size = 2
    end
    object IBQStatusClienteGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = 'STATUSCLIENTE.GRUPO'
      Size = 3
    end
    object IBQStatusClienteALARME: TIntegerField
      FieldName = 'ALARME'
      Origin = 'STATUSCLIENTE.ALARME'
    end
    object IBQStatusClienteMENSAGEM: TIntegerField
      FieldName = 'MENSAGEM'
      Origin = 'STATUSCLIENTE.MENSAGEM'
    end
    object IBQStatusClienteMONITOR: TIntegerField
      FieldName = 'MONITOR'
      Origin = 'STATUSCLIENTE.MONITOR'
    end
    object IBQStatusClienteIDENTIFICACAO: TIntegerField
      FieldName = 'IDENTIFICACAO'
      Origin = 'STATUSCLIENTE.IDENTIFICACAO'
    end
    object IBQStatusClienteOCORRENCIA: TIntegerField
      FieldName = 'OCORRENCIA'
      Origin = 'STATUSCLIENTE.OCORRENCIA'
    end
    object IBQStatusClienteDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'STATUSCLIENTE.DESCRICAO'
      Size = 70
    end
    object IBQStatusClienteCOR: TIntegerField
      FieldName = 'COR'
      Origin = 'STATUSCLIENTE.COR'
    end
  end
  object DSStatusCliente: TDataSource
    DataSet = CDSStatusCliente
    Left = 168
    Top = 232
  end
  object DSPStatusCliente: TDataSetProvider
    DataSet = IBQStatusCliente
    Constraints = True
    Left = 168
    Top = 128
  end
  object CDSStatusCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPStatusCliente'
    Left = 168
    Top = 176
    object CDSStatusClienteCDCODIFICADOR: TIntegerField
      FieldName = 'CDCODIFICADOR'
    end
    object CDSStatusClienteESTATUS: TStringField
      FieldName = 'ESTATUS'
      Size = 1
    end
    object CDSStatusClienteREFERENCIA1: TStringField
      FieldName = 'REFERENCIA1'
      Size = 2
    end
    object CDSStatusClienteREFERENCIA2: TStringField
      FieldName = 'REFERENCIA2'
      Size = 2
    end
    object CDSStatusClienteSETOR: TStringField
      FieldName = 'SETOR'
      Size = 2
    end
    object CDSStatusClienteGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 3
    end
    object CDSStatusClienteALARME: TIntegerField
      FieldName = 'ALARME'
    end
    object CDSStatusClienteMENSAGEM: TIntegerField
      FieldName = 'MENSAGEM'
    end
    object CDSStatusClienteMONITOR: TIntegerField
      FieldName = 'MONITOR'
    end
    object CDSStatusClienteIDENTIFICACAO: TIntegerField
      FieldName = 'IDENTIFICACAO'
    end
    object CDSStatusClienteOCORRENCIA: TIntegerField
      FieldName = 'OCORRENCIA'
    end
    object CDSStatusClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 70
    end
    object CDSStatusClienteCOR: TIntegerField
      FieldName = 'COR'
    end
  end
  object IBQConsCliente: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTConsCliente
    BufferChunks = 1000
    CachedUpdates = False
    Left = 256
    Top = 63
  end
  object IBTConsCliente: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 256
    Top = 8
  end
  object IBQConsSetor: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTConsSetor
    BufferChunks = 1000
    CachedUpdates = False
    Left = 336
    Top = 63
  end
  object IBTConsSetor: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 336
    Top = 8
  end
  object IBQOcorrencia: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTOcorrencia
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'INSERT INTO OCORRENCIA('
      '    CDOCORRENCIAPAI,'
      '    CTX,'
      '    TIPOCTX,'
      '    PORTACOM,'
      '    EQUIPAMENTO,'
      '    NREVENTO,'
      '    STATUS,'
      '    REFERENCIA,'
      '    DESTATUS,'
      '    DATAEVENTO,'
      '    CDCLIENTE,'
      '    NUMSETOR,'
      '    LOCAL,'
      '    CDOPERADORABERTURA'
      ')VALUES('
      '    :CDOCORRENCIAPAI,'
      '    :CTX,'
      '    :TIPOCTX,'
      '    :PORTACOM,'
      '    :EQUIPAMENTO,'
      '    :NREVENTO,'
      '    :STATUS,'
      '    :REFERENCIA,'
      '    :DESTATUS,'
      '    :DATAEVENTO,'
      '    :CDCLIENTE,'
      '    :NUMSETOR,'
      '    :LOCAL,'
      '    :CDOPERADORABERTURA'
      ')')
    Left = 480
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDOCORRENCIAPAI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CTX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPOCTX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PORTACOM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EQUIPAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NREVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAEVENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CDCLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMSETOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOCAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CDOPERADORABERTURA'
        ParamType = ptUnknown
      end>
  end
  object IBTOcorrencia: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 480
    Top = 8
  end
  object IBQOcorrenciaMaster: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTOcorrenciaMaster
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT'
      '    O.CDOCORRENCIA, O.DATAEVENTO FROM OCORRENCIA O'
      'WHERE'
      '    O.EQUIPAMENTO = :EQUIPAMENTO AND '
      '    O.STATUS = :STATUS AND '
      '    O.REFERENCIA = :REFERENCIA AND'
      '    O.ISOCORRENCIAENCERRADA = 0 AND'
      '    O.CDOCORRENCIAPAI = 0;')
    Left = 576
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EQUIPAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object IBTOcorrenciaMaster: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 576
    Top = 8
  end
  object IBTCtx: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 656
    Top = 8
  end
  object IBQCtx: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTCtx
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'INSERT INTO LOGCTX('
      '    CTX,'
      '    PORTACOM,'
      '    TIPOCTX,'
      '    DATACONEXAO'
      ')VALUES('
      '    :CTX,'
      '    :PORTACOM,'
      '    :TIPOCTX,'
      '    :DATACONEXAO'
      ')')
    Left = 656
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CTX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PORTACOM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TIPOCTX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATACONEXAO'
        ParamType = ptUnknown
      end>
  end
  object IBQConsCtx: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTCtx
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CTX FROM LOGCTX WHERE CTX = :CTX;')
    Left = 656
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CTX'
        ParamType = ptUnknown
      end>
  end
  object IBQParametro: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTParametro
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT VALOR FROM PARAMSISTEMA WHERE CDPARAMSISTEMA = :CDPARAMSI' +
        'STEMA;')
    Left = 658
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDPARAMSISTEMA'
        ParamType = ptUnknown
      end>
  end
  object IBTParametro: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 658
    Top = 174
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBCONAzsim
    AutoStopAction = saNone
    Left = 384
    Top = 152
  end
  object IBQuery1: TIBQuery
    Database = IBCONAzsim
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'CREATE OR ALTER PROCEDURE SP_LIMPA_OCORRENCIAS_ORFAOS '
      'RETURNS ('
      '    CDOC_ORFAOS INTEGER)'
      'AS'
      'BEGIN'
      
        '    FOR SELECT O.CDOCORRENCIA FROM OCORRENCIA O WHERE O.CDCLIENT' +
        'E = 0 INTO :CDOC_ORFAOS DO'
      '    BEGIN'
      '        IF(:CDOC_ORFAOS > 0)THEN'
      '        BEGIN'
      
        '            DELETE FROM OCORRENCIA WHERE CDOCORRENCIAPAI = :CDOC' +
        '_ORFAOS;'
      '            SUSPEND;'
      '        END'
      '    END'
      ''
      '    DELETE FROM OCORRENCIA WHERE CDCLIENTE = 0;'
      'END')
    Left = 384
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CDOC_ORFAOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CDOC_ORFAOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CDOC_ORFAOS'
        ParamType = ptUnknown
      end>
  end
end
