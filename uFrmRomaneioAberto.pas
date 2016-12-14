unit uFrmRomaneioAberto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmRomaneioBaixado, FMX.ListView.Types, MultiDetailAppearanceU, FMX.ListView,
  FMX.DateTimeCtrls, FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation,
  FMX.Objects, System.JSON;

type
  TfrmRomaneioAberto = class(TfrmRomaneioBaixado)
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRomaneioAberto: TfrmRomaneioAberto;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

uses uFrmOrdemCompra, uFrmConexao, uFrmMenuPrincipal;

procedure TfrmRomaneioAberto.Button1Click(Sender: TObject);
var
  jArr     : TJSONArray;
  jObj     : TJSONObject;
  JString  : TJSONString;
  I        : Integer;
  LisItem  : TListViewItem;
 // dia,mes,ano : integer;
  dia, mes, ano : Word;
begin
 // inherited;
  DecodeDate(DateEdit1.Date,ano,mes,dia);
   ListView1.ClearItems;
   ListView1.BeginUpdate;
   jArr   := dtmConexao.RomaneioAberto('A',dia,mes,ano);
   for I   := 0 to jArr.Count - 1 do
  begin
    jObj           := jArr.Items[I] as TJSONObject;
    LisItem        := ListView1.Items.Add;
    LisItem.Detail := jObj.GetValue('ID_ROMANEIO').Value;
    LisItem.Text   := 'Emissão:  ' + jObj.GetValue('DT_CADASTRO').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail1]:='Valor:  '+ jObj.GetValue('VL_TOTAL').Value;
    LisItem.Data[TMultiDetailAppearanceNames.Detail2]:='Transportadora:  '+ jObj.GetValue('NM_TRANSPORTADORA').Value;
  end;
  ListView1.EndUpdate;

end;

procedure TfrmRomaneioAberto.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 // inherited;
 if key = vkHardwareBack then
   begin
     frmMenuPrincipal.Show;
     key :=0;
     frmRomaneioAberto.DisposeOf;
   end;

end;

end.

