unit uFrmPcpProdComprado;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmPcpProduto, FMX.ListView.Types, MultiDetailAppearanceU, FMX.Edit,
  FMX.Layouts, FMX.ListBox, FMX.ListView, FMX.Controls.Presentation, FMX.Objects, system.JSON;

type
  TfrmPcpProdComprados = class(TfrmPcpProdutos)
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPcpProdComprados: TfrmPcpProdComprados;

implementation

{$R *.fmx}

uses uFrmConexao, uFrmMenuPrincipal;

procedure TfrmPcpProdComprados.btnPesquisarClick(Sender: TObject);
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
   jArr   := dtmConexao.BuscarProduto(cxCodigo.Text,'C');
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

procedure TfrmPcpProdComprados.FormCreate(Sender: TObject);
begin
  inherited;
  {$IFDEF ANDROID}
     btnBack.Visible := false;
   {$ENDIF}
end;

procedure TfrmPcpProdComprados.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  //inherited;
  if key = vkHardwareBack then
   begin
     frmPcpProdComprados.DisposeOf;
     frmMenuPrincipal.Show;
     key :=0;

   end;
end;

end.
