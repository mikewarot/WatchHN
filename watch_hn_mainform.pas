unit watch_hn_mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls, fphttpclient, openssl,
  opensslsockets,
  fpjson, jsonparser;


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
  parser : TJSONparser;
  d  : TJSONdata;
  kids : TJSONarray;
  i : integer;
  t : string;
  childID : TJSONenum;
begin
  Memo1.Clear;
  s := 'Fetching contents of Thread #' + EditThreadID.Text + ' via the web';
  Memo1.Append(S);

  url := 'https://hacker-news.firebaseio.com/v0/item/'+EditThreadID.Text+'.json?print=pretty';
  Memo1.Append('Fetching URL: '+url);
  r := http1.Get(url);
  memo1.Append(r);

  Parser := TJSONParser.Create(r);
  D := Parser.Parse;
  i := d.Count;
  Memo1.Append(' -- ');
  Memo1.Append('Got '+i.ToString+' JSON items');
  Memo1.Append(' -- ');

  t := D.FindPath('text').AsString;

  Memo1.Append('Text = '+t);

  TreeView1.Items.Clear;
  TreeView1.Items.AddFirst(nil,T);

  Memo1.Append(' -- ');
  Memo1.Append(' Getting Comments');
  Memo1.Append(' -- ');


  kids := TJSONarray(d.FindPath('kids'));
  for childid in kids do
    memo1.Append('  Item #'+childid.Value.AsString);
  Memo1.Append(' -- ');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  HTTP1 := TFPHttpClient.Create(nil);
end;

end.

