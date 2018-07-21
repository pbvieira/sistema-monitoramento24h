object fdmInfo: TfdmInfo
  OldCreateOrder = False
  Left = 538
  Top = 217
  Height = 491
  Width = 643
  object IBTAlarmeAcidental: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 409
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
    Left = 48
    Top = 409
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
    Left = 80
    Top = 409
  end
  object CDSAlarmeAcidental: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPAlarmeAcidental'
    Left = 112
    Top = 409
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
    Left = 144
    Top = 409
  end
  object DSPresencaAnimais: TDataSource
    DataSet = CDSPresencaAnimais
    Left = 144
    Top = 362
  end
  object CDSPresencaAnimais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPresencaAnimais'
    Left = 112
    Top = 362
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
  object DSPPresencaAnimais: TDataSetProvider
    DataSet = IBQPresencaAnimais
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 362
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
    Left = 48
    Top = 362
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
  object IBTPresencaAnimais: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 362
  end
  object IBTAgenteLocal: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 330
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
    Left = 48
    Top = 330
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
    Left = 80
    Top = 330
  end
  object CDSAgenteLocal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPAgenteLocal'
    Left = 112
    Top = 330
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
    Left = 144
    Top = 330
  end
  object DSSemEnergia: TDataSource
    DataSet = CDSSemEnergia
    Left = 144
    Top = 298
  end
  object CDSSemEnergia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSemEnergia'
    Left = 112
    Top = 298
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
  object DSPSemEnergia: TDataSetProvider
    DataSet = IBQSemEnergia
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 298
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
    Left = 48
    Top = 298
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
  object IBTSemEnergia: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 298
  end
  object IBTMauContato: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 266
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
    Left = 48
    Top = 266
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
    Left = 80
    Top = 266
  end
  object CDSMauContato: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPMauContato'
    Left = 112
    Top = 266
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
    Left = 144
    Top = 266
  end
  object DSCanalRFAberto: TDataSource
    DataSet = CDSCanalRFAberto
    Left = 144
    Top = 234
  end
  object CDSCanalRFAberto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCanalRFAberto'
    Left = 112
    Top = 234
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
  object DSPCanalRFAberto: TDataSetProvider
    DataSet = IBQCanalRFAberto
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 234
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
    Left = 48
    Top = 234
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
  object IBTCanalRFAberto: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 234
  end
  object IBTRetiradaKit: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 202
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
    Left = 48
    Top = 202
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
    Left = 80
    Top = 202
  end
  object CDSRetiradaKit: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPRetiradaKit'
    Left = 112
    Top = 202
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
    Left = 144
    Top = 202
  end
  object DSConsertoSistema: TDataSource
    DataSet = CDSConsertoSistema
    Left = 144
    Top = 170
  end
  object CDSConsertoSistema: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsertoSistema'
    Left = 112
    Top = 170
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
  object DSPConsertoSistema: TDataSetProvider
    DataSet = IBQConsertoSistema
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 170
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
    Left = 48
    Top = 170
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
  object IBTConsertoSistema: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 170
  end
  object IBTSensorIRContPreso: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 139
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
    Left = 48
    Top = 139
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
  object DSPSensorIRContPreso: TDataSetProvider
    DataSet = IBQSensorIRContPreso
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 139
  end
  object CDSSensorIRContPreso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSensorIRContPreso'
    Left = 112
    Top = 139
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
  object DSSensorIRContPreso: TDataSource
    DataSet = CDSSensorIRContPreso
    Left = 144
    Top = 139
  end
  object DSBateriaFraca: TDataSource
    DataSet = CDSBateriaFraca
    Left = 144
    Top = 107
  end
  object CDSBateriaFraca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPBateriaFraca'
    Left = 112
    Top = 107
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
  object DSPBateriaFraca: TDataSetProvider
    DataSet = IBQBateriaFraca
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 107
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
    Left = 48
    Top = 107
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
  object IBTBateriaFraca: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 107
  end
  object IBTSetorCurto: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 75
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
    Left = 48
    Top = 75
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
  object DSPSetorCurto: TDataSetProvider
    DataSet = IBQSetorCurto
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 75
  end
  object CDSSetorCurto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSetorCurto'
    Left = 112
    Top = 75
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
  object DSSetorCurto: TDataSource
    DataSet = CDSSetorCurto
    Left = 144
    Top = 75
  end
  object DSIdentifica: TDataSource
    DataSet = CDSIdentifica
    Left = 144
    Top = 43
  end
  object CDSIdentifica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPIdentifica'
    Left = 112
    Top = 43
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
    Left = 80
    Top = 43
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
    Left = 48
    Top = 43
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
    Left = 17
    Top = 43
  end
  object IBTIdentificaZero: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 17
    Top = 11
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
    Left = 48
    Top = 11
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
  object DSPIdentificaZero: TDataSetProvider
    DataSet = IBQIdentificaZero
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 11
  end
  object CDSIdentificaZero: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPIdentificaZero'
    Left = 112
    Top = 11
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
  object DSIdentificaZero: TDataSource
    DataSet = CDSIdentificaZero
    Left = 144
    Top = 11
  end
  object IBTSuspeitoLocal: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 213
    Top = 11
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
    Left = 244
    Top = 11
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
    Left = 275
    Top = 11
  end
  object CDSSuspeitoLocal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSuspeitoLocal'
    Left = 305
    Top = 11
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
    Left = 336
    Top = 11
  end
  object DSSinalArrombamento: TDataSource
    DataSet = CDSSinalArrombamento
    Left = 336
    Top = 43
  end
  object CDSSinalArrombamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSinalArrombamento'
    Left = 305
    Top = 43
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
  object DSPSinalArrombamento: TDataSetProvider
    DataSet = IBQSinalArrombamento
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 275
    Top = 43
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
    Left = 244
    Top = 43
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
  object IBTSinalArrombamento: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 213
    Top = 43
  end
  object IBTJanelaMalFechada: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 213
    Top = 75
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
    Left = 244
    Top = 75
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
    Left = 275
    Top = 75
  end
  object CDSJanelaMalFechada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPJanelaMalFechada'
    Left = 305
    Top = 75
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
    Left = 336
    Top = 75
  end
  object DSSinalIndesejado: TDataSource
    DataSet = CDSSinalIndesejado
    Left = 336
    Top = 107
  end
  object CDSSinalIndesejado: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPSinalIndesejado'
    Left = 305
    Top = 107
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
  object DSPSinalIndesejado: TDataSetProvider
    DataSet = IBQSinalIndesejado
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 275
    Top = 107
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
    Left = 244
    Top = 107
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
  object IBTSinalIndesejado: TIBTransaction
    Active = False
    DefaultDatabase = DModule.IBCONAzsim
    AutoStopAction = saNone
    Left = 213
    Top = 107
  end
  object DSMasterCliConsOrdemServico: TDataSource
    Left = 454
    Top = 14
  end
  object IBQCliConsOrdemServico: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = DModule.IBTFilial
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
    Left = 422
    Top = 14
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
  object IBQCliConsArmeDesarme: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = DModule.IBTFilial
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
    Left = 422
    Top = 54
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
  object DSMasterCliConsArmeDesarme: TDataSource
    Left = 454
    Top = 54
  end
  object CDSCliConsArmeDesarme: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 492
    Top = 54
  end
  object CDSCliConsOrdemServico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 492
    Top = 14
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
    Left = 530
    Top = 14
  end
  object DSCliConsArmeDesarme: TDataSource
    DataSet = CDSCliConsArmeDesarme
    Left = 530
    Top = 54
  end
  object DSMasterCliConsOcorrencia: TDataSource
    Left = 454
    Top = 94
  end
  object IBQCliConsOcorrencia: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = DModule.IBTFilial
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
    Left = 422
    Top = 94
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
  object IBQCliConsLogEvento: TIBQuery
    Database = DModule.IBCONAzsim
    Transaction = DModule.IBTFilial
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
    Left = 422
    Top = 134
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
  object DSMasterCliConsLogEvento: TDataSource
    Left = 454
    Top = 134
  end
  object CDSCliConsLogEvento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 492
    Top = 134
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
  object CDSCliConsOcorrencia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 492
    Top = 94
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
    Left = 530
    Top = 94
  end
  object DSCliConsLogEvento: TDataSource
    DataSet = CDSCliConsLogEvento
    Left = 530
    Top = 134
  end
end
