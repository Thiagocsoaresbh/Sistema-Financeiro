inherited frmCaixa: TfrmCaixa
  Caption = 'Caixa'
  ClientHeight = 442
  ClientWidth = 646
  ExplicitWidth = 658
  ExplicitHeight = 480
  TextHeight = 17
  inherited PnlPrincipal: TCardPanel
    Width = 646
    Height = 442
    ExplicitWidth = 642
    ExplicitHeight = 441
    inherited CardCadastro: TCard
      Width = 644
      Height = 440
      ExplicitWidth = 644
      ExplicitHeight = 440
      object Label2: TLabel [0]
        Left = 28
        Top = 43
        Width = 93
        Height = 17
        Caption = 'N'#176' Documento: '
      end
      object Label3: TLabel [1]
        Left = 55
        Top = 74
        Width = 60
        Height = 17
        Caption = 'Descri'#231#227'o:'
      end
      object Label4: TLabel [2]
        Left = 82
        Top = 105
        Width = 33
        Height = 17
        Caption = 'Valor:'
      end
      inherited Panel1: TPanel
        Top = 376
        Width = 644
        ExplicitTop = 376
        ExplicitWidth = 640
        inherited btnCancelar: TButton
          Left = 569
          ExplicitLeft = 565
        end
        inherited btnSalvar: TButton
          Left = 495
          ExplicitLeft = 491
        end
      end
      object edtDocumento: TEdit
        Left = 127
        Top = 40
        Width = 252
        Height = 25
        TabOrder = 1
      end
      object edtDescricao: TEdit
        Left = 127
        Top = 71
        Width = 252
        Height = 25
        TabOrder = 2
      end
      object edtValor: TEdit
        Left = 127
        Top = 102
        Width = 252
        Height = 25
        TabOrder = 3
      end
      object RadioGroup1: TRadioGroup
        Left = 28
        Top = 144
        Width = 351
        Height = 57
        Caption = 'Tipo'
        Columns = 2
        Items.Strings = (
          'Receita'
          'Despesa')
        TabOrder = 4
      end
    end
    inherited CardPesquisa: TCard
      Width = 644
      Height = 440
      ExplicitWidth = 640
      ExplicitHeight = 439
      inherited pnlPesquisa: TPanel
        Width = 644
        ExplicitWidth = 640
        object Label5: TLabel [1]
          Left = 288
          Top = 2
          Width = 30
          Height = 21
          Caption = 'Tipo'
        end
        inherited btnPesquisar: TButton
          Left = 570
          ExplicitLeft = 566
        end
        object cbTipo: TComboBox
          Left = 288
          Top = 26
          Width = 137
          Height = 29
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'Todos'
          Items.Strings = (
            'Todos'
            'Receitas'
            'Despesas')
        end
      end
      inherited pnlPesquisaBotoes: TPanel
        Top = 376
        Width = 644
        ExplicitTop = 375
        ExplicitWidth = 640
        inherited btnFechar: TButton
          Left = 569
          ExplicitLeft = 565
        end
      end
      inherited pnlGrid: TPanel
        Width = 644
        Height = 311
        ExplicitWidth = 640
        ExplicitHeight = 310
        inherited dbgCadastro: TDBGrid
          Width = 642
          Height = 309
          Columns = <
            item
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Title.Caption = 'Data'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_DOC'
              Title.Caption = 'N'#176' Documento'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 310
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taRightJustify
              Title.Caption = 'Valor'
              Width = 90
              Visible = True
            end>
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = dmCaixa.cdsCaixa
  end
end
