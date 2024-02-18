unit MonolitoFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    pnlEsquerdo: TPanel;
    Image1: TImage;
    pnlPrincipal: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    LabNomeAplicacao: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edtSenha: TEdit;
    edtLogin: TEdit;
    Label2: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  MonolitoFinanceiro.Model.Usuarios, MonolitoFinanceiro.Model.Sistema;

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('Informe seu usu�rio', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Informe sua senha', 'Aten��o', MB_OK + MB_ICONWARNING);
    abort;
  end;
  try
    dmUsuarios.EfetuarLogin(Trim(edtLogin.Text), Trim(edtSenha.Text));
    dmSistema.DataUltimoAcesso(now);
    dmSistema.UsuarioUltimoAcesso(dmUsuarios.GetUsuarioLogado.Login);
    ModalResult := mrOk
  except
    on Error: Exception do
    begin
      Application.MessageBox(PWideChar(Error.Message), 'Aten��o', MB_OK + MB_ICONWARNING);
      edtLogin.SetFocus;
    end;

  end;

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtLogin.Text := dmSistema.UsuarioUltimoAcesso;
end;

end.
