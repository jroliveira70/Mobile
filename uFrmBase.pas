unit uFrmBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,System.JSON;

type
  TfrmBase = class(TForm)
    imgLogo: TImage;
    ltBase: TLayout;
    lblBase: TLabel;
    procedure btnTesteClick(Sender: TObject);
    procedure btchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}
{$R *.iPhone.fmx IOS}

uses  ufrmMenu,uLogin, uFrmPcpProduto, uFrmPersonalizar;
{$R *.SmXhdpiPh.fmx ANDROID}

procedure TfrmBase.btchClick(Sender: TObject);
begin
  frmPcpProdutos.Show;
end;

procedure TfrmBase.btnTesteClick(Sender: TObject);
begin
frmMenu.Show;
end;

end.
