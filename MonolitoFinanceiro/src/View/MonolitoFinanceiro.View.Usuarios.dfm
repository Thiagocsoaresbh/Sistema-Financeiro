inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastros Usu'#225'rios'
  TextHeight = 17
  inherited PnlPrincipal: TCardPanel
    inherited CardCadastro: TCard
      PopupMenu = PopupMenu1
      ExplicitHeight = 438
      object Label2: TLabel [0]
        Left = 28
        Top = 43
        Width = 43
        Height = 17
        Caption = 'Nome :'
      end
      object Label3: TLabel [1]
        Left = 28
        Top = 74
        Width = 39
        Height = 17
        Caption = 'Login :'
      end
      object Label5: TLabel [2]
        Left = 28
        Top = 112
        Width = 42
        Height = 17
        Caption = 'Status :'
      end
      inherited Panel1: TPanel
        ExplicitTop = 374
      end
      object edtNome: TEdit
        Left = 77
        Top = 40
        Width = 252
        Height = 25
        TabOrder = 1
      end
      object edtLogin: TEdit
        Left = 77
        Top = 71
        Width = 252
        Height = 25
        TabOrder = 2
      end
      object tsStatus: TToggleSwitch
        Left = 85
        Top = 112
        Width = 119
        Height = 20
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 3
      end
    end
    inherited CardPesquisa: TCard
      inherited pnlGrid: TPanel
        inherited dbgCadastro: TDBGrid
          PopupMenu = PopupMenu1
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 299
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'Login'
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 105
              Visible = True
            end>
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu [2]
    Left = 545
    Top = 176
    object mnLimparSenha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = mnLimparSenhaClick
    end
  end
end
