unit uFrmOrdemCompra;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects,
  FMX.ListView.Types, FMX.ListView, FMX.TabControl, System.JSON,
  Data.Bind.Components, Data.Bind.DBScope, FMX.ListBox, IPPeerClient,
  REST.Client, Data.Bind.ObjectScope, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, MultiDetailAppearanceU;

type
  TfrmOrdemCompra = class(TfrmBase)
    ToolBar1: TToolBar;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    list: TListView;
    ltitemB: TListView;
    btnBack: TButton;
    procedure ltitemBItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }
    FIdOrdem : integer;

  end;

var
  frmOrdemCompra: TfrmOrdemCompra;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.iPhone55in.fmx IOS}
{$R *.SmXhdpiPh.fmx ANDROID}

{$R *.LgXhdpiTb.fmx ANDROID}

uses uFrmConexao, uFrmProdOrdemCompra, uFrmMenuPrincipal;
{$R *.iPhone.fmx IOS}
{$R *.iPhone4in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TfrmOrdemCompra.btnBackClick(Sender: TObject);
begin
  inherited;
  frmOrdemCompra.DisposeOf;
  frmMenuPrincipal.Show;
end;

procedure TfrmOrdemCompra.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  inherited;
  if key = vkHardwareBack then
   begin
     frmOrdemCompra.DisposeOf;
     frmMenuPrincipal.Show;
     key :=0;
   end;
end;

procedure TfrmOrdemCompra.FormShow(Sender: TObject);
var
  jArr   : TJSONArray;
  jObj   : TJSONObject;
  JString: TJSONString;
  I      : integer;
  codigo : string;
  Ltitem : TListViewItem;
begin

  inherited;
{$IFDEF ANDROID}
  btnBack.Visible := false;
{$ENDIF}
  if TabControl1.ActiveTab = TabItem1 then
  begin
    jArr := dtmConexao.OrdemCompraAberto('A');
    list.ClearItems;
    list.BeginUpdate;
    for I := 0 to jArr.Size - 1 do
    begin
      jObj := jArr.Items[I] as TJSONObject;
      Ltitem := list.Items.Add;
      Ltitem.Detail := jObj.GetValue('ID_ORDEM').Value;
      Ltitem.Text := jObj.GetValue('ID_ORDEM').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail1] := 'Ordem Nº  ' +
      jObj.GetValue('ID_ORDEM').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail2] := 'Emissão:  ' +
      jObj.GetValue('DT_EMISSAO').Value;
    end;
    list.EndUpdate;
  end
  else
  begin
    jArr := dtmConexao.OrdemCompraAberto('B');
    list.ClearItems;
    list.BeginUpdate;
    for I := 0 to jArr.Size - 1 do
    begin
      jObj := jArr.Items[I] as TJSONObject;
      Ltitem := ltitemB.Items.Add;
      Ltitem.Detail := jObj.GetValue('ID_ORDEM').Value;
      Ltitem.Text := jObj.GetValue('ID_ORDEM').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail1] := 'Ordem Nº  ' +
        jObj.GetValue('ID_ORDEM').Value;
      Ltitem.Data[TMultiDetailAppearanceNames.Detail2] := 'Emissão:  ' +
        jObj.GetValue('DT_EMISSAO').Value;
    end;
    ltitemB.EndUpdate;
  end;
end;

procedure TfrmOrdemCompra.ltitemBItemClick(const Sender: TObject;
  const AItem: TListViewItem);
  var
  valor : string;
begin
  inherited;
 FIdOrdem := StrToInt(ltitemB.Selected.Text);
 frmProdOrdemCompra.Show;
 {
  CRIAR AQUI UMA CLASSE SINGLETON PARA PASSAR O VALOR PARA O OUTRO FORM
 }
end;

end.
