unit uFrmPcpProduto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects,
  FMX.ListView.Types, FMX.ListView, FMX.Edit, FMX.SearchBox, FMX.ListBox, System.JSON,
  MultiDetailAppearanceU;

type
  TfrmPcpProdutos = class(TfrmBase)
    ListView1: TListView;
    ToolBar1: TToolBar;
    Label1: TLabel;
    ListBox1: TListBox;
    cxCodigo: TEdit;
    btnPesquisar: TButton;
    ListView2: TListView;
    btnBack: TButton;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPcpProdutos: TfrmPcpProdutos;

implementation


{$R *.fmx}
{$R *.iPhone4in.fmx IOS}
{$R *.iPhone.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}
{$R *.SmXhdpiPh.fmx ANDROID}

uses uFrmConexao, uFrmMenuPrincipal;




  {
  var
  jArr     : TJSONArray;
  jObj     : TJSONObject;
  JString  : TJSONString;
  I        : Integer;
  codigo   : string; i think what WSL could create a Channel on cable tv

begin
  inherited;
  codigo := Edit1.Text;
  jArr   := dtmConexao.BuscarProduto(codigo);
  for I  := 0 to jArr.Size - 1 do
  begin
    jObj       := jArr.Items[I] as TJSONObject;
    Edit2.Text := jObj.GetValue('NM_PRODUTO').Value;
    //Edit2.Text := jObj.GetValue('SALDO').Value;
  end;
 //ListBox1.Items.Add(dtmConexao.BuscarProduto(Edit1.Text).ToString);}

procedure TfrmPcpProdutos.btnBackClick(Sender: TObject);
begin
  inherited;
 frmPcpProdutos.DisposeOf;
 frmMenuPrincipal.Show;
end;

procedure TfrmPcpProdutos.btnPesquisarClick(Sender: TObject);
var
  jArr     : TJSONArray;
  jObj     : TJSONObject;
  JString  : TJSONString;
  I        : Integer;
  LisItem  : TListViewItem;
begin
  inherited;
   ListView2.ClearItems;
   ListView2.BeginUpdate;
   jArr   := dtmConexao.BuscarProduto(cxCodigo.Text,'A');
  for I   := 0 to jArr.Count - 1 do
  begin
    jObj           := jArr.Items[I] as TJSONObject;
    LisItem        := ListView2.Items.Add;
    LisItem.Detail := jObj.GetValue('COD_ANTIGO').Value;
    LisItem.Text   := 'Código:  ' + jObj.GetValue('CODIGO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail1]:='Descrição:  '+ jObj.GetValue('NM_PRODUTO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail2]:='Saldo:  '+ jObj.GetValue('SALDO'     ).Value;
  end;
  ListView2.EndUpdate;
end;

procedure TfrmPcpProdutos.FormCreate(Sender: TObject);
begin
  inherited;
    {$IFDEF ANDROID}
     btnBack.Visible := false;
   {$ENDIF}
end;

procedure TfrmPcpProdutos.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
    if key = vkHardwareBack then
   begin
     frmMenuPrincipal.Show;
     key :=0;
     frmPcpProdutos.DisposeOf;

   end;
end;

end.
