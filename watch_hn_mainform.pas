unit watch_hn_mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls, fphttpclient, openssl,
  opensslsockets;


type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    EditThreadID: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Http1 : TFPHttpClient;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  s : string;
  url : string;
  r : string;
begin
  Memo1.Clear;
  s := 'Fetching contents of Thread #' + EditThreadID.Text + ' via the web';
  Memo1.Append(S);

  url := 'https://hacker-news.firebaseio.com/v0/item/'+EditThreadID.Text+'.json?print=pretty';
  Memo1.Append('Fetching URL: '+url);
  r := http1.Get(url);
  memo1.Append(r);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  HTTP1 := TFPHttpClient.Create(nil);
end;

end.

