unit uFrmAjuda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uFrmBase, FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.WebBrowser;

type
  TfrmAjuda = class(TfrmBase)
    WebBrowser1: TWebBrowser;
    ToolBar1: TToolBar;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjuda: TfrmAjuda;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.iPhone.fmx IOS}
{$R *.SmXhdpiPh.fmx ANDROID}

end.
