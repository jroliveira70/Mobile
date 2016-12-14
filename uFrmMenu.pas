unit uFrmMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,uFrmBase,
  FMX.Objects, FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, FMX.Edit,
  FMX.SearchBox;

type
  TfrmMenu = class(TfrmBase)
    ListBox1: TListBox;
    SearchBox1: TSearchBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    Montagem: TListBoxGroupHeader;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    procedure ListBoxItem5Click(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.fmx}

uses uFrmOrdemCompra, uFrmPcpProduto, uFrmComprasPed;
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.iPhone.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.Surface.fmx MSWINDOWS}
{$R *.Windows.fmx MSWINDOWS}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}

procedure TfrmMenu.ListBoxItem1Click(Sender: TObject);
begin
  inherited;
  if not Assigned(frmPcpProdutos)then
  begin
  Application.CreateForm(TfrmPcpProdutos,frmPcpProdutos);
  frmPcpProdutos.Show;
  frmMenu.DisposeOf;
  end;
end;

procedure TfrmMenu.ListBoxItem5Click(Sender: TObject);
begin
  inherited;
 if not Assigned(frmOrdemCompra)then
  begin
  Application.CreateForm(TfrmOrdemCompra,frmOrdemCompra);
  frmOrdemCompra.Show;
  frmMenu.DisposeOf;
  end;
end;

procedure TfrmMenu.ListBoxItem6Click(Sender: TObject);
begin
  inherited;
  if not Assigned(frmComprasPed)then
  begin
  Application.CreateForm(TfrmComprasPed,frmComprasPed);
  frmComprasPed.Show;
  frmMenu.DisposeOf;
  end;
end;

end.
