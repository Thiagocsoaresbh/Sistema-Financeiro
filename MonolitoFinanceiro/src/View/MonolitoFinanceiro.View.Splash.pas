unit MonolitoFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmSplash = class(TForm)
    pnlPrincipal: TPanel;
    imgDLL: TImage;
    LabNomeAplicacao: TLabel;
    ProgressBar1: TProgressBar;
    LabStatus: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    Image1: TImage;
    imgBancoDados: TImage;
    imgConfg: TImage;
    imgIniciando: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarStatus(Mensagem: String; Imagem: TImage);
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.AtualizarStatus(Mensagem: String; Imagem: TImage);
begin
  LabStatus.Caption := Mensagem;
  Imagem.Visible := True;
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position <= 100 then
  begin
    ProgressBar1.StepIt;{incremtenta o valor de 50}
    case ProgressBar1.Position of
      10: AtualizarStatus('Carregando dependências...', imgDLL);
      25: AtualizarStatus('Conectando ao banco de dados...', imgBancoDados);
      45: AtualizarStatus('Carregando configurações...', imgconfg);
      75: AtualizarStatus('Iniciando o sistema...', imgIniciando);
    end;
  end;
  if ProgressBar1.Position = 100 then
    Close;
end;

end.
