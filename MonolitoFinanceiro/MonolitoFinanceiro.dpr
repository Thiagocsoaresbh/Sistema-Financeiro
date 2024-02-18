program MonolitoFinanceiro;

uses
  Vcl.Forms,
  MonolitoFinanceiro.View.Principal in 'src\View\MonolitoFinanceiro.View.Principal.pas' {frmPrincipal},
  MonolitoFinanceiro.View.CadastroPadrao in 'src\View\MonolitoFinanceiro.View.CadastroPadrao.pas' {frmCadastroPadrao},
  MonolitoFinanceiro.View.Splash in 'src\View\MonolitoFinanceiro.View.Splash.pas' {frmSplash},
  MonolitoFinanceiro.Model.Conexao in 'src\Model\MonolitoFinanceiro.Model.Conexao.pas' {dmConexao: TDataModule},
  MonolitoFinanceiro.View.Usuarios in 'src\View\MonolitoFinanceiro.View.Usuarios.pas' {frmUsuarios},
  MonolitoFinanceiro.Model.Usuarios in 'src\Model\MonolitoFinanceiro.Model.Usuarios.pas' {dmUsuarios: TDataModule},
  MonolitoFinanceiro.Utilitarios in 'src\Util\MonolitoFinanceiro.Utilitarios.pas',
  MonolitoFinanceiro.View.Login in 'src\View\MonolitoFinanceiro.View.Login.pas' {frmLogin},
  MonolitoFinanceiro.Model.Entidades.Usuarios in 'src\Model\Entidade\MonolitoFinanceiro.Model.Entidades.Usuarios.pas',
  MonolitoFinanceiro.Model.Sistema in 'src\Model\MonolitoFinanceiro.Model.Sistema.pas' {dmSistema: TDataModule},
  MonolitoFinanceiro.View.RedefinirSenha in 'src\View\MonolitoFinanceiro.View.RedefinirSenha.pas' {frmRedefinirSenha},
  MonolitoFinanceiro.View.Caixa in 'src\View\MonolitoFinanceiro.View.Caixa.pas' {frmCaixa},
  MonolitoFinanceiro.Model.Caixa in 'src\Model\MonolitoFinanceiro.Model.Caixa.pas' {dmCaixa: TDataModule},
  MonolitoFinanceiro.View.Caixa.Saldo in 'src\View\MonolitoFinanceiro.View.Caixa.Saldo.pas' {frmCaixaSaldo},
  MonolitoFinanceiro.Model.Entidades.Caixa.Resumo in 'src\Model\Entidade\MonolitoFinanceiro.Model.Entidades.Caixa.Resumo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TdmCaixa, dmCaixa);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroPadrao, frmCadastroPadrao);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.CreateForm(TfrmCaixa, frmCaixa);
  Application.CreateForm(TfrmRedefinirSenha, frmRedefinirSenha);
  Application.CreateForm(TdmSistema, dmSistema);
  Application.CreateForm(TfrmCaixaSaldo, frmCaixaSaldo);
  Application.Run;
end.
