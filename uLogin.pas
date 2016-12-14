unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,uFrmBase,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit;

type
  TfrmLogin = class(TfrmBase)
    Layout1: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    btnEntrar: TButton;
    btnLimpar: TButton;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}
{$R *.iPhone.fmx IOS}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}

end.
