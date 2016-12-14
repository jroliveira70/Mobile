unit uFrmMenuPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.ListView.Types, FMX.ListView, FMX.Controls.Presentation,
  FMX.Layouts, FMX.Objects, FMX.ListBox, FMX.Edit, FMX.SearchBox;

type
  TfrmMenuPrincipal = class(TfrmBase)
    ToolBar1: TToolBar;
    Label1: TLabel;
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
    ListBoxGroupHeader4: TListBoxGroupHeader;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxGroupHeader5: TListBoxGroupHeader;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem5Click(Sender: TObject);
    procedure ListBoxItem6Click(Sender: TObject);
    procedure ListBoxItem7Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem4Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure ListBoxItem8Click(Sender: TObject);
    procedure ListBoxItem10Click(Sender: TObject);
    procedure ListBoxItem11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}

uses uFrmComprasPed, uFrmComprasPedItens, uFrmOrdemCompra, uFrmPcpProduto,
  uFrmProdOrdemCompra, uFrmPcpProdComprado, uFrmPcpOrdemCompra,
  uFrmRomaneioBaixado, uFrmRomaneioAberto, uFrmGuiadeRemessa, uFrmPersonalizar,
  uFrmAjuda;
{$R *.iPhone.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.iPhone55in.fmx IOS}



{$R *.iPhone47in.fmx IOS}
{$R *.iPad.fmx IOS}

procedure TfrmMenuPrincipal.ListBoxItem10Click(Sender: TObject);
begin
  inherited;
  {
   if not Assigned(FrmPersonalizar)then
  begin
  Application.CreateForm(TFrmPersonalizar,FrmPersonalizar);
  FrmPersonalizar.Show;
  //frmMenuPrincipal.DisposeOf;
  end else
  begin
    FrmPersonalizar.DisposeOf;
    Application.CreateForm(TFrmPersonalizar,FrmPersonalizar);
    FrmPersonalizar.Show;
  end;
  }
end;

procedure TfrmMenuPrincipal.ListBoxItem11Click(Sender: TObject);
begin
  inherited;
   if not Assigned(frmAjuda)then
  begin
  Application.CreateForm(TfrmAjuda,frmAjuda);
  frmAjuda.Show;
  //frmMenuPrincipal.DisposeOf;
  end else
  begin
    frmAjuda.DisposeOf;
    Application.CreateForm(TfrmAjuda,frmAjuda);
    frmAjuda.Show;
  end;
end;

procedure TfrmMenuPrincipal.ListBoxItem1Click(Sender: TObject);
begin
  inherited;
 if not Assigned(frmPcpProdutos)then
  begin
  Application.CreateForm(TfrmPcpProdutos,frmPcpProdutos);
  frmPcpProdutos.Show;
  //frmMenuPrincipal.DisposeOf;
  end;
end;

procedure TfrmMenuPrincipal.ListBoxItem2Click(Sender: TObject);
begin
  inherited;
    if not Assigned(frmPcpOrdemCompra)then
  begin
  Application.CreateForm(TfrmPcpOrdemCompra,frmPcpOrdemCompra);
  frmPcpOrdemCompra.Show;
  //frmMenuPrincipal.DisposeOf;
  end else
  begin
    frmPcpOrdemCompra.DisposeOf;
    Application.CreateForm(TfrmPcpOrdemCompra,frmPcpOrdemCompra);
    frmPcpOrdemCompra.Show;
  end;
end;

procedure TfrmMenuPrincipal.ListBoxItem3Click(Sender: TObject);
begin
  inherited;
   if not Assigned(frmRomaneioAberto)then
  begin
  Application.CreateForm(TfrmRomaneioAberto,frmRomaneioAberto);
  frmRomaneioAberto.Show;
  //frmMenuPrincipal.DisposeOf;
  end else
  begin
    frmPcpProdComprados.DisposeOf;
    Application.CreateForm(TfrmRomaneioAberto,frmRomaneioAberto);
    frmRomaneioAberto.Show;
  end;
end;

procedure TfrmMenuPrincipal.ListBoxItem4Click(Sender: TObject);
begin
  inherited;
     if not Assigned(frmRomaneioBaixado)then
  begin
  Application.CreateForm(TfrmRomaneioBaixado,frmRomaneioBaixado);
  frmRomaneioBaixado.Show;
  //frmMenuPrincipal.DisposeOf;
  end else
  begin
    frmPcpProdComprados.DisposeOf;
    Application.CreateForm(TfrmRomaneioBaixado,frmRomaneioBaixado);
    frmRomaneioBaixado.Show;
  end;
end;

procedure TfrmMenuPrincipal.ListBoxItem5Click(Sender: TObject);
begin
  inherited;
  if not Assigned(frmOrdemCompra)then
  begin
  Application.CreateForm(TfrmOrdemCompra,frmOrdemCompra);
  frmOrdemCompra.Show;
  //frmMenuPrincipal.DisposeOf;
  end;
end;

procedure TfrmMenuPrincipal.ListBoxItem6Click(Sender: TObject);
begin
  inherited;
   if not Assigned(frmComprasPed)then
  begin
  Application.CreateForm(TfrmComprasPed,frmComprasPed);
  frmComprasPed.Show;
  //frmMenuPrincipal.DisposeOf;
  end else
  begin
    frmComprasPed.DisposeOf;
    Application.CreateForm(TfrmComprasPed,frmComprasPed);
    frmComprasPed.Show;
  end;

end;

procedure TfrmMenuPrincipal.ListBoxItem7Click(Sender: TObject);
begin
  inherited;
   if not Assigned(frmPcpProdComprados)then
  begin
  Application.CreateForm(TfrmPcpProdComprados,frmPcpProdComprados);
  frmPcpProdComprados.Show;
  //frmMenuPrincipal.DisposeOf;
  end else
  begin
    frmPcpProdComprados.DisposeOf;
    Application.CreateForm(TfrmPcpProdComprados,frmPcpProdComprados);
    frmPcpProdComprados.Show;
  end;

end;

procedure TfrmMenuPrincipal.ListBoxItem8Click(Sender: TObject);
begin
  inherited;
if not Assigned(FrmGuiadeRemessa)then
  begin
  Application.CreateForm(TFrmGuiadeRemessa,FrmGuiadeRemessa);
  FrmGuiadeRemessa.Show;
  //frmMenuPrincipal.DisposeOf;
  end else
  begin
    FrmGuiadeRemessa.DisposeOf;
    Application.CreateForm(TFrmGuiadeRemessa,FrmGuiadeRemessa);
    frmPcpProdComprados.Show;
  end;
end;

end.
