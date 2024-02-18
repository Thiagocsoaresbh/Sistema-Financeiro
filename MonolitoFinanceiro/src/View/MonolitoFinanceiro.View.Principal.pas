unit MonolitoFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  MonolitoFinanceiro.View.Usuarios, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuUsuarios: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    mnuFinanceiro: TMenuItem;
    mnuCaixa: TMenuItem;
    mnuResumoCaixa: TMenuItem;
    procedure mnuUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mnuCaixaClick(Sender: TObject);
    procedure mnuResumoCaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  MonolitoFinanceiro.View.Splash,
  MonolitoFinanceiro.View.Login,
  MonolitoFinanceiro.Model.Usuarios, MonolitoFinanceiro.View.RedefinirSenha,
  MonolitoFinanceiro.View.Caixa, MonolitoFinanceiro.View.Caixa.Saldo;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {criando o objeto frmSplash}
  frmSplash := TfrmSplash.Create(nil);
  try
    {exibe o formulario/ o modal segura a aplica��o, equanto nao fecha o form, para seguir o fluxo }
    frmsplash.ShowModal;
  finally
    {evita o vazamento de mem�ria}
    FreeAndNil(frmsplash);
  end;
  frmLogin := TFrmLogin.Create(nil);
  try
    frmLogin.ShowModal;
    if frmLogin.ModalResult <> mrOk then
      Application.Terminate;
  finally
    FreeAndNil(frmLogin);
  end;

  if dmUsuarios.GetUsuarioLogado.SenhaTemporaria then
  begin
    frmRedefinirSenha := TfrmRedefinirSenha.Create(nil);
    try
      frmRedefinirSenha.Usuario := dmUsuarios.GetUsuarioLogado;
      frmRedefinirSenha.ShowModal;
      if frmRedefinirSenha.ModalResult<> mrOk then
        Application.Terminate;

    finally
      FreeAndNil(frmRedefinirSenha);
    end;
  end;


  StatusBar1.Panels.Items[1].Text := 'Usu�rio: ' + dmUsuarios.GetUsuarioLogado.Nome
end;

procedure TfrmPrincipal.mnuCaixaClick(Sender: TObject);
begin
  frmCaixa.Show;
end;

procedure TfrmPrincipal.mnuResumoCaixaClick(Sender: TObject);
begin
  frmCaixaSaldo.Show;
end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
begin
   frmUsuarios.Show;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
