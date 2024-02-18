object dmCaixa: TdmCaixa
  Height = 480
  Width = 640
  object fdqCaixa: TFDQuery
    Connection = dmConexao.FDConexao
    SQL.Strings = (
      'select * from caixa')
    Left = 32
    Top = 32
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 192
    Top = 32
    object cdsCaixaID: TStringField
      FieldName = 'ID'
      Size = 36
    end
    object cdsCaixaNUMERO_DOC: TStringField
      FieldName = 'NUMERO_DOC'
    end
    object cdsCaixaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object cdsCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Size = 18
    end
    object cdsCaixaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsCaixaDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = fdqCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 112
    Top = 32
  end
end
