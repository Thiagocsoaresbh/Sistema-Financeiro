unit MonolitoFinanceiro.View.Caixa.Saldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.WinXPanels;

type
  TfrmCaixaSaldo = class(TForm)
    pnlPrincipal: TPanel;
    pnlPesquisar: TPanel;
    pnlContent: TPanel;
    btnPesquisar: TButton;
    ImageList1: TImageList;
    dateInicial: TDateTimePicker;
    dateFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    StackPanel1: TStackPanel;
    Panel1: TPanel;
    Label3: TLabel;
    lblSaldoFinal: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    lblSaldoParcial: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    lblSaidas: TLabel;
    Panel4: TPanel;
    Label9: TLabel;
    lblSaldoInicial: TLabel;
    Panel5: TPanel;
    Label11: TLabel;
    lblEntradas: TLabel;
    pnlLineHeader: TPanel;
    Panel8: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  frmCaixaSaldo: TfrmCaixaSaldo;

implementation

uses
  MonolitoFinanceiro.Model.Entidades.Caixa.Resumo,
  MonolitoFinanceiro.Model.Caixa, MonolitoFinanceiro.Utilitarios;

{$R *.dfm}

{ TfrmCaixaSaldo }

procedure TfrmCaixaSaldo.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmCaixaSaldo.FormShow(Sender: TObject);
begin
  DateFinal.Date := now;
  Pesquisar;
end;

procedure TfrmCaixaSaldo.Pesquisar;
var
  ResumoCaixa : TModelResumoCaixa;
begin
  lblSaldoInicial.Caption := '';
  lblEntradas.Caption := '';
  lblSaidas.Caption := '';
  lblSaldoParcial.Caption := '';
  lblSaldoFinal.Caption := '';

  ResumoCaixa := dmCaixa.ResumoCaixa(DateInicial.Date, DateFinal.Date);
  try
    lblSaldoInicial.Caption := TUtilitarios.FormataMoeda(ResumoCaixa.SaldoInicial);
    lblEntradas.Caption := TUtilitarios.FormataMoeda(ResumoCaixa.TotalEntradas);
    lblSaidas.Caption := TUtilitarios.FormataMoeda(ResumoCaixa.TotalSaidas);
    lblSaldoParcial.Caption := TUtilitarios.FormataMoeda(ResumoCaixa.SaldoParcial);
    lblSaldoFinal.Caption := TUtilitarios.FormataMoeda(ResumoCaixa.SaldoFinal);
  finally
    ResumoCaixa.Free;
  end;
end;

end.
