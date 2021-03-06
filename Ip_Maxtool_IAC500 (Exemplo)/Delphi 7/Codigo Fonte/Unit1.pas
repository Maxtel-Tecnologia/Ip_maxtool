unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, FMTBcd, StdCtrls, ExtCtrls, ComCtrls, WSocket, WinSock,
  Registry, Math, IdStack, Menus, Ulogcom, StrUtils;

const
  descr_soft = '*** IP-MAXTOOL IAC-500 V1.18 *** - [IP=';
  porta_altera_filtro = '22370';
  porta_altera_filtroMAC = '22371';
  porta_UART_UDP      = '26482';

type
  MyShortString = String[255];
  TForm1 = class(TForm)
    TimerPooling: TTimer;
    TimerTOut1: TTimer;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label27: TLabel;
    Label7: TLabel;
    TabSheet5: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox5: TGroupBox;
    SpeedButton4: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    GroupBox6: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    CheckBox3: TCheckBox;
    Edit28: TEdit;
    CheckBox4: TCheckBox;
    ComboBox2: TComboBox;
    CheckBox5: TCheckBox;
    ComboBox3: TComboBox;
    CheckBox6: TCheckBox;
    ComboBox4: TComboBox;
    CheckBox7: TCheckBox;
    ComboBox5: TComboBox;
    CheckBox8: TCheckBox;
    ComboBox6: TComboBox;
    CheckBox9: TCheckBox;
    ComboBox7: TComboBox;
    CheckBox10: TCheckBox;
    ComboBox8: TComboBox;
    CheckBox11: TCheckBox;
    ComboBox18: TComboBox;
    ComboBox19: TComboBox;
    BitBtn2: TBitBtn;
    BitBtn7: TBitBtn;
    TabSheet7: TTabSheet;
    GroupBox9: TGroupBox;
    Edit53: TEdit;
    Label17: TLabel;
    ComboBox10: TComboBox;
    Label18: TLabel;
    ComboBox11: TComboBox;
    Label28: TLabel;
    ComboBox12: TComboBox;
    Label29: TLabel;
    Label30: TLabel;
    ComboBox13: TComboBox;
    Label31: TLabel;
    ComboBox14: TComboBox;
    Label32: TLabel;
    ComboBox15: TComboBox;
    Label33: TLabel;
    ComboBox16: TComboBox;
    Label34: TLabel;
    ComboBox17: TComboBox;
    BitBtn10: TBitBtn;
    Label35: TLabel;
    ComboBox20: TComboBox;
    Label36: TLabel;
    ComboBox21: TComboBox;
    ComboBox22: TComboBox;
    Label37: TLabel;
    Label38: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Button2: TButton;
    Button1: TButton;
    BitBtn13: TBitBtn;
    Panel3: TPanel;
    SpeedButton7: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Button3: TButton;
    TimerEnviaConfEvento: TTimer;
    CheckBox14: TCheckBox;
    OpenDialog1: TOpenDialog;
    WSocketClient: TWSocket;
    StatusBar1: TStatusBar;
    WSocketServer: TWSocket;
    BitBtn8: TBitBtn;
    SpeedButton3: TSpeedButton;
    TabSheet9: TTabSheet;
    Label58: TLabel;
    Edit54: TEdit;
    Label59: TLabel;
    Edit55: TEdit;
    BitBtn14: TBitBtn;
    Panel1: TPanel;
    BitBtn15: TBitBtn;
    Label41: TLabel;
    ProgressBar1: TProgressBar;
    Label15: TLabel;
    SpeedButton5: TSpeedButton;
    Label56: TLabel;
    Label57: TLabel;
    Button5: TButton;
    MainMenu1: TMainMenu;
    LogCompletoComunicao1: TMenuItem;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    ComboBox23: TComboBox;
    ComboBox24: TComboBox;
    CheckBox18: TCheckBox;
    Label9: TLabel;
    ComboBox25: TComboBox;
    ComboBox26: TComboBox;
    ComboBox27: TComboBox;
    ComboBox28: TComboBox;
    ComboBox29: TComboBox;
    Label10: TLabel;
    ComboBox30: TComboBox;
    ComboBox31: TComboBox;
    ComboBox32: TComboBox;
    ComboBox33: TComboBox;
    ComboBox34: TComboBox;
    Label11: TLabel;
    ComboBox35: TComboBox;
    ComboBox36: TComboBox;
    ComboBox37: TComboBox;
    ComboBox38: TComboBox;
    ComboBox39: TComboBox;
    TabSheet2: TTabSheet;
    GroupBox8: TGroupBox;
    Edit4: TEdit;
    BitBtn12: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn25: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label39: TLabel;
    Edit9: TEdit;
    Edit11: TEdit;
    Label42: TLabel;
    ComboBox40: TComboBox;
    BitBtn9: TBitBtn;
    BitBtn22: TBitBtn;
    Memo2: TMemo;
    Label48: TLabel;
    CheckBox19: TCheckBox;
    TabSheet6: TTabSheet;
    GroupBox10: TGroupBox;
    CheckBox24: TCheckBox;
    ComboBox43: TComboBox;
    CheckBox26: TCheckBox;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    ComboBox41: TComboBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label62: TLabel;
    ComboBox42: TComboBox;
    Label63: TLabel;
    ComboBox44: TComboBox;
    ComboBox45: TComboBox;
    ComboBox46: TComboBox;
    ComboBox47: TComboBox;
    ComboBox48: TComboBox;
    ComboBox49: TComboBox;
    CheckBox20: TCheckBox;
    ComboBox50: TComboBox;
    TabSheet8: TTabSheet;
    GroupBox11: TGroupBox;
    Label64: TLabel;
    Label68: TLabel;
    Edit10: TEdit;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn26: TBitBtn;
    Memo3: TMemo;
    BitBtn27: TBitBtn;
    Label65: TLabel;
    Label66: TLabel;
    Panel4: TPanel;
    Label67: TLabel;
    Label70: TLabel;
    Edit13: TEdit;
    BitBtn28: TBitBtn;
    Label69: TLabel;
    Edit12: TEdit;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Setup_Saidas: TTabSheet;
    TabSheet10: TTabSheet;
    GroupBox12: TGroupBox;
    Label87: TLabel;
    Label91: TLabel;
    Edit14: TEdit;
    BitBtn30: TBitBtn;
    BitBtn36: TBitBtn;
    Memo4: TMemo;
    CheckBox40: TCheckBox;
    ComboBox51: TComboBox;
    Label90: TLabel;
    BitBtn18: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn37: TBitBtn;
    TabSheet11: TTabSheet;
    GroupBox14: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    Label92: TLabel;
    Edit15: TEdit;
    BitBtn29: TBitBtn;
    BitBtn34: TBitBtn;
    Memo5: TMemo;
    CheckBox41: TCheckBox;
    ComboBox52: TComboBox;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    Edit16: TEdit;
    Label93: TLabel;
    BitBtn45: TBitBtn;
    ProgressBar2: TProgressBar;
    Label94: TLabel;
    BitBtn46: TBitBtn;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    ComboBox9: TComboBox;
    BitBtn47: TBitBtn;
    GroupBox13: TGroupBox;
    Label106: TLabel;
    Label107: TLabel;
    Label110: TLabel;
    Label114: TLabel;
    Label118: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label111: TLabel;
    CheckBox23: TCheckBox;
    ComboBox60: TComboBox;
    CheckBox25: TCheckBox;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    ComboBox61: TComboBox;
    ComboBox62: TComboBox;
    ComboBox63: TComboBox;
    ComboBox64: TComboBox;
    ComboBox65: TComboBox;
    ComboBox66: TComboBox;
    ComboBox67: TComboBox;
    ComboBox68: TComboBox;
    CheckBox27: TCheckBox;
    ComboBox69: TComboBox;
    ComboBox70: TComboBox;
    ComboBox71: TComboBox;
    ComboBox72: TComboBox;
    ComboBox73: TComboBox;
    ComboBox74: TComboBox;
    ComboBox75: TComboBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    ComboBox76: TComboBox;
    ComboBox77: TComboBox;
    ComboBox78: TComboBox;
    ComboBox79: TComboBox;
    BitBtn33: TBitBtn;
    Panel6: TPanel;
    Panel8: TPanel;
    CheckBox42: TCheckBox;
    ComboBox83: TComboBox;
    ComboBox101: TComboBox;
    Edit29: TEdit;
    Label112: TLabel;
    GroupBox15: TGroupBox;
    BitBtn6: TBitBtn;
    GroupBox7: TGroupBox;
    Label16: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    BitBtn3: TBitBtn;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label55: TLabel;
    Edit20: TEdit;
    Edit2: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox16: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label43: TLabel;
    Button4: TButton;
    Edit30: TEdit;
    BitBtn11: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    ComboBox53: TComboBox;
    BitBtn50: TBitBtn;
    ComboBox54: TComboBox;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    procedure ComboBox9Change(Sender: TObject);
    procedure Edit30Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Edit53Change(Sender: TObject);
    procedure Edit53Exit(Sender: TObject);
    procedure WSocketServerDataAvailable(Sender: TObject; ErrCode: Word);
    procedure BitBtn6Click(Sender: TObject);
    procedure WSocketClientSessionConnected(Sender: TObject; ErrCode: Word);
    procedure FormCreate(Sender: TObject);
    function HexToInt(StringRecebida : MyShortString) : Integer;
    procedure TimerPoolingTimer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FazPooling;
    procedure EnviaRTC;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTOut1Tier(Sender: TObject);
    procedure TrataRX(StringATratar, IP_RX : String);
    procedure Refresh_Status_UTRM(IP_UTRM : String; IfOnLine : Boolean);
    procedure MudaIP;
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Muda_PORTA_host;
    procedure FormShow(Sender: TObject);
    function ip_utrmvnet: String;
    procedure novo_ip_para_comunicar;
    procedure BitBtn2Click(Sender: TObject);
    function CompletaComZeros(StringRecebida: String; TamanhoFinal: Integer) : String;
    function CompletaComEspacos(StringRecebida: String; TamanhoFinal: Integer) : String;
    procedure DelayResposta(Tempo : String);
    procedure EnviaMsgInicial(Valor : String) ;
    procedure EnviaPosicCatraca(Valor : String) ;
    procedure EnviaAplicativo(Valor : String) ;
    procedure EnviaLeitoras(valor1, valor2 : String) ;
    procedure EnviaLeitorasSerial(Disp1, Baud1, Bits1, Paridade1, Stopbits1, Disp2, Baud2, Bits2, Paridade2, Stopbits2, Disp3, Baud3, Bits3, Paridade3, Stopbits3 : String) ;
    procedure EnviaConfigPorta(Valor : String) ;
    procedure EnviaModFunc(Valor : String) ;
    procedure EnviaCFluxoCatraca(Valor1, Valor2 : String) ;
    procedure ParaPooling;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure MostraValorDosInputs(Valor: String);
    procedure SpeedButton14Click(Sender: TObject);
    procedure Muda_IP_Gateway;
    procedure Muda_Mascara;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click0(Sender: TObject);
    function CorrigeSeTemAlgumaLetra(StringRecebida : String) : String;
    function CorrigeSeTemAlgumaLetra_2(StringRecebida : String) : String;
    function HexaCorrigeSeTemAlgumaLetra(StringRecebida : String) : String;
    function TiraChar(StringRecebida : String): String;
    function HexaTiraChar(StringRecebida : String): String;
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit18Change(Sender: TObject);
    procedure Edit19Change(Sender: TObject);
    procedure Edit20Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit21Change(Sender: TObject);
    procedure Edit22Change(Sender: TObject);
    procedure Edit23Change(Sender: TObject);
    procedure Edit24Change(Sender: TObject);
    procedure Edit25Change(Sender: TObject);
    procedure Edit26Change(Sender: TObject);
    procedure Edit27Change(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure EnviaConfirmRecReg;
    procedure SpeedButton11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Edit54Change(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Edit55Change(Sender: TObject);
    procedure Maxtool(Cmd, dados : String);
    procedure BitBtn10Click(Sender: TObject);
    procedure TesteLCD(q_String : String);
    function Criptografia(InByte, Chave1, Chave2: Byte): Byte;
    procedure BitBtn15Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label5DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaTXRX;
    function GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;
    procedure InsereAtualizaCartao(q_opcao: Char);
    procedure meu_sleep(valor_em_ms: Integer);
    function ConectaSocketServer: Boolean;
    procedure EnviaComandoUDP(ip_dest, addr, cmd, dados : String; PacoteGrande: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit18Exit(Sender: TObject);
    procedure Edit19Exit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure LogCompletoComunicao1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure ComboBox25Change(Sender: TObject);
    procedure ComboBox30Change(Sender: TObject);
    procedure ComboBox35Change(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure Label7DblClick(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure Edit29Change(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure BitBtn50Click(Sender: TObject);
    procedure Label92DblClick(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);


  private
    FSenderAddr : TInAddr;
    function HexToInt24(StringRecebida: MyShortString): Integer;
    procedure SalvaRegistro;
    procedure LeRegistro;
    procedure CriaRegistro;
    { Private declarations }

  public
    { Public declarations }

  end;


var
  Form1: TForm1;
  porta_local, Resp_Erro_dados : Integer;
  Frame_Start, Frame_Stop, Frame_Size, Frame_Addr, Frame_CheckSum, UDP_Size1,
     UDP_Size2, UDP_Obj_Pointer, UDP_End, Cmd_Code, Frame_Data, Cartao_Evento : String;
  NOrdem, estado, chave_1, chave_2, chave_temp : Byte;
  CheckBoxes, CheckBoxes2, OK_Simples, PoolingAtivo, Ok_Bio,
     OK_Ordenado, Resp_Erro, Resp_versao_firmware, Interromper, Ocorreu_TimeOut : Boolean;
  t_off_line, cartao_tf  : LongInt;

  meu_ip, meu_host, ip_cli : String;
  DadosDaMemoria : String;
  SocketClientConectado : boolean;
  n_pacotes_RX, n_pacotes_TX : TLargeInteger;
  t1, t2, res : TLargeInteger;
  MostraMsgDeAviso : Boolean;
  matriz_ip : array [1..4] of string;
  porta_local_cli : string;
  qtd_cartoes, qtd_capacidade_ordenada, qtd_cartoes_desordenado, qtd_capacidade_desordenada, qtd_eventos, qtd_capacidade_eventos, qtd_turnos, qtd_capacidade_turnos, qtd_feriados, qtd_capacidade_feriados : String;

implementation

uses U_Ip_Servidor, U_aviso;

{$R *.dfm}

function MessageDlgConf(const Msg: string; Titulo : String; Botao1 : String; Botao2 : String) : Word;
var
  i : Integer;
begin
  with CreateMessageDialog(Msg, mtConfirmation,[mbYes,mbNo]) do
  try
    Caption := Titulo;
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TButton then
        with TButton(Components[i]) do
          case ModalResult of
            mrYes : Caption := Botao1;
            mrNo : Caption := Botao2;
          end;
    Result := ShowModal;
  finally
    Free;
  end;
end;

procedure MessageDlgErro(const Msg: string; Titulo : String; Botao1 : String);
begin
  with CreateMessageDialog(Msg, mtWarning, [mbOK]) do
    try
    Caption := Titulo;
    ShowModal;
    finally
    Free;
    end;
end;

function Confirma(FraseASerExibida : String) : Boolean;
begin
  if MessageDlgConf(FraseASerExibida, 'Confirma��o.', '&Sim', '&N�o') = 6 then
    Result := True
  else
    Result := False;
end;

procedure ShowInforma(FraseASerExibida : String);
begin
  with CreateMessageDialog(FraseASerExibida, mtInformation, [mbOK]) do
    try
    Caption := 'Informa��o.';
    ShowModal;
    finally
    Free;
    end;
end;

procedure ShowAlerta(FraseASerExibida : String);
begin
  with CreateMessageDialog(FraseASerExibida, mtWarning, [mbOK]) do
    try
    Caption := 'Aten��o !';
    ShowModal;
    finally
    Free;
    end;
end;

procedure ShowErro(FraseASerExibida : String);
begin
  with CreateMessageDialog(FraseASerExibida, mtError, [mbOK]) do
    try
    Caption := 'Erro !';
    ShowModal;
    finally
    Free;
    end;
end;

function TForm1.GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;
type
  Name = array[0..100] of Char;
  PName = ^Name;
var
  HEnt: pHostEnt;
  HName: PName;
  WSAData: TWSAData;
  i: Integer;
begin
  Result := False;
  if WSAStartup($0101, WSAData) <> 0 then
    begin
    WSAErr := 'Winsock n�o est� respondendo.';
    Exit;
    end;
  IPaddr := '';
  New(HName);
  if GetHostName(HName^, SizeOf(Name)) = 0 then
    begin
    HostName := StrPas(HName^);
    HEnt := GetHostByName(HName^);
    for i := 0 to HEnt^.h_length - 1 do
      begin
      IPaddr := Concat(IPaddr, IntToStr(Ord(HEnt^.h_addr_list^[i])) + '.');
      matriz_ip[i+1] := IntToStr(Ord(HEnt^.h_addr_list^[i]));
      end;
    SetLength(IPaddr, Length(IPaddr) - 1);
    Result := True;
    end
  else
    begin
      case WSAGetLastError of
      WSANOTINITIALISED:WSAErr := 'WSANotInitialised';
      WSAENETDOWN      :WSAErr := 'WSAENetDown';
      WSAEINPROGRESS   :WSAErr := 'WSAEInProgress';
      end;
    end;
  Dispose(HName);
  WSACleanup;
end;

function TForm1.TiraChar(StringRecebida : String) : String;
var
  i: integer;
  StringASerDevolvida : String;
begin
  StringASerDevolvida := '';
  for i := 1 to length(StringRecebida) do
    if StringRecebida[i] in ['0'..'9'] then
      StringASerDevolvida := StringASerDevolvida + StringRecebida[i];
  Result := StringASerDevolvida;
end;

function TForm1.HexaTiraChar(StringRecebida : String) : String;
var
  i: integer;
  StringASerDevolvida : String;
begin
  StringASerDevolvida := '';
  for i := 1 to length(StringRecebida) do
    if (StringRecebida[i] in ['0'..'9']) or (StringRecebida[i] in ['A'..'F']) then
      StringASerDevolvida := StringASerDevolvida + StringRecebida[i];
  Result := StringASerDevolvida;
end;

function TForm1.CorrigeSeTemAlgumaLetra(StringRecebida : String) : String;
var
  i: integer;
  TemLetra : Boolean;
begin
  TemLetra := False;
  if (StringRecebida <> '') then
    begin
    for i:= 1 to length(StringRecebida) do
      if StringRecebida[i] in ['0'..'9'] then
        TemLetra := False
      else
        begin
        TemLetra := True;
        Break;
        end;
    if TemLetra then
      begin
      Result := TiraChar(StringRecebida);
      ShowErro('S� � permitido digitar N�MEROS neste campo !');
      end
    else
      Result := StringRecebida;
    end
  else
    Result := StringRecebida;
end;

function TForm1.CorrigeSeTemAlgumaLetra_2(StringRecebida : String) : String;
var
  i: integer;
  TemLetra, TemLetra2 : Boolean;
begin
  TemLetra := False;
  TemLetra2 := False;
  if (StringRecebida <> '') then
    begin
    for i:= 1 to length(StringRecebida) do
    begin
      if StringRecebida[i] in ['0'..'9'] then
        TemLetra := False
      else
        begin
          if StringRecebida[i] in ['.',','] then TemLetra2 := True
          else
            begin
              TemLetra := True;
              Break;
            end;
        end;
     end;
    if TemLetra then
      begin
      Result := TiraChar(StringRecebida);
      ShowErro('S� � permitido digitar N�MEROS neste campo !');
      end
    else
      Result := TiraChar(StringRecebida);
      if TemLetra2 then Perform (WM_NEXTDLGCTL,0,0);
    end
  else
    Result := StringRecebida;
end;

function TForm1.HexaCorrigeSeTemAlgumaLetra(StringRecebida : String) : String;
var
  i: integer;
  TemLetra : Boolean;
begin
  TemLetra := False;
  if (StringRecebida <> '') then
    begin
    for i:= 1 to length(StringRecebida) do
      if (StringRecebida[i] in ['0'..'9']) or (StringRecebida[i] in ['A'..'F']) then
        TemLetra := False
      else
        begin
        TemLetra := True;
        Break;
        end;
    if TemLetra then
      begin
      Result := HexaTiraChar(StringRecebida);
      ShowErro('S� � permitido digitar CARACTERES HAXADECIMAIS neste campo !');
      end
    else
      Result := StringRecebida;
    end
  else
    Result := StringRecebida;
end;

function TForm1.CompletaComZeros(StringRecebida: String; TamanhoFinal: Integer) : String;
var
  NovosZeros : String;
  NumeroDeZeros, i : Integer;
begin
  NovosZeros := '';
  NumeroDeZeros := TamanhoFinal- length(StringRecebida);
  for i:= 1 to NumeroDeZeros do
    NovosZeros := NovosZeros + '0';
  CompletaComZeros := NovosZeros+StringRecebida;
end;

function TForm1.CompletaComEspacos(StringRecebida: String; TamanhoFinal: Integer) : String;
var
  NovosEspacos : String;
  NumeroDeEspacos, i : Integer;
begin
  NovosEspacos := '';
  NumeroDeEspacos := TamanhoFinal - length(StringRecebida);
  for i:= 1 to NumeroDeEspacos do
    NovosEspacos := NovosEspacos + ' ';
  CompletaComEspacos := StringRecebida + NovosEspacos;
end;

function TForm1.ip_utrmvnet: String;
begin
  result := edit1.text + '.' + edit3.text + '.' + edit18.text + '.' + edit19.text;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Err: string;
begin
  Label66.Caption := '';
  UDP_Obj_Pointer := chr($19) + chr($FF);
  UDP_End := chr($00) + chr($00);

  Frame_Start := chr($5A)+chr($A5);
  Frame_Stop := chr($5F)+chr($F5);
  Frame_Addr := chr($01);

  MostraMsgDeAviso := True;
  NOrdem := $01;
  PoolingAtivo := False;

  if not GetIPFromHost(meu_host, meu_ip, Err) then
    begin
    ShowErro('N�o foi poss�vel obter o IP Local');
    Close;
    end;

  n_pacotes_RX := 0;
  n_pacotes_TX := 0;
  AtualizaTXRX;
end;

function TForm1.ConectaSocketServer: Boolean;
begin
  try
  WSocketServer.Close;
  FSenderAddr := WSocketResolveHost(meu_ip);
  if FSenderAddr.S_addr = htonl(INADDR_LOOPBACK) then
     FSenderAddr := WSocketResolveHost(LocalHostName);
  WSocketServer.Proto             := 'udp';
  WSocketServer.Addr              := '0.0.0.0';
  WSocketServer.Port              := edit30.text;
  Edit20.Text                     := Edit30.Text;
  porta_local_cli                 := IntToStr(StrToInt(Edit30.text) -50);
  WSocketServer.Listen;
  Result := True;
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;
  except
  Result := False;
  end;
end;

procedure TForm1.EnviaComandoUDP(ip_dest, addr, cmd, dados : String; PacoteGrande: Boolean);
var
  CheckSum : byte;
  str_TX, dado_str : string;
  i, qtd_bytes_dados, tam_pacoteUDP : integer;
  UDP_Packet: String;
  buffer : array [0..1500] of byte;
  dado : array [1..1500] of byte;
begin
  cmd_code := chr(HexToInt(cmd));
  dado_str := dados;
  qtd_bytes_dados := length(dado_str) div 2;
  Frame_Data := '';
  for i := 1 to qtd_bytes_dados do
     begin
     dado[i] := HexToInt(dado_str[(i*2)-1] + dado_str[(i*2)]);
     Frame_Data := Frame_Data + chr(dado[i]);
     end;
  CheckSum := 0;

  if PacoteGrande then
    begin
    CheckSum := CheckSum xor
                ($00) xor
                ($01) xor
                (HexToInt(cmd));
    end
  else
    begin
    CheckSum := CheckSum xor
                (qtd_bytes_dados + 5) xor
                ($01) xor
                (HexToInt(cmd));
    end;


  for i := 1 to qtd_bytes_dados do
     CheckSum := CheckSum xor dado[i];
  CheckSum := not CheckSum;
  Frame_CheckSum := chr(CheckSum);

  if PacoteGrande then
    begin
    UDP_Size1 := chr($00);
    UDP_Size2 := chr($FF);
    Frame_Size := chr($00);
    end
  else
    begin
    UDP_Size1 := chr(qtd_bytes_dados+8);
    UDP_Size2 := chr((qtd_bytes_dados+8) xor $FF);
    Frame_Size := chr(qtd_bytes_dados+5);
    end;

  UDP_Packet :=
      Frame_Start +
      Frame_Size +
      chr(HexToInt(addr)) +
      cmd_code +
      Frame_Data +
      Frame_CheckSum +
      Frame_Stop;

  for i:= 1 to length(UDP_Packet) do
     UDP_Packet[i] := char(Criptografia((ord(UDP_Packet[i])), chave_1, chave_2));

  UDP_Packet :=
      UDP_Size1 +
      UDP_Size2 +
      UDP_Obj_Pointer +
      UDP_Packet +
      UDP_End;

  for i:= 1 to length(UDP_Packet) do
     buffer[i-1] := ord(UDP_Packet[i]);

  // prepara o envio UDP
  str_TX := '';
  tam_pacoteUDP := qtd_bytes_dados+13;

  for i := 0 to tam_pacoteUDP do
    str_TX := str_TX + IntToHex(ord(buffer[i]), 2);
  Label4.Caption := str_TX + ' (' + ip_dest +')';
  LogCom.Memo1.Lines.Add('TX: ' + Label4.Caption);

  with WSocketClient do
     try
     LocalAddr  := meu_ip;
     LocalPort  := porta_local_cli;
     Proto      := 'udp';
     Addr       := ip_dest;
     Port       := porta_UART_UDP;
     Connect;
     while not SocketClientConectado do
        Application.ProcessMessages;
     Send(@buffer, tam_pacoteUDP+1);
     while not AllSent do
        Application.ProcessMessages;
     Close;
     SocketClientConectado := False;
     Inc(n_pacotes_TX);
     AtualizaTXRX;
     except
     WSocketClient.Close;
     end;
  OK_Simples := False;
  OK_Ordenado := False;
  Resp_Erro := False;
  Resp_versao_firmware := False;
  Interromper := False;
  end;

function TForm1.Criptografia(InByte, Chave1, Chave2: Byte): Byte;
begin
   Result := InByte xor (chave1 * chave2);
   chave_2 := chave_2 xor 255;
end;

function TForm1.HexToInt(StringRecebida : MyShortString) : Integer;
var
  Valor : Array [1..2] of Integer;
  i : Integer;
begin
  for i := 1 to 2 do
    begin
    if StringRecebida[i] = '0' then Valor[i] := 0;
    if StringRecebida[i] = '1' then Valor[i] := 1;
    if StringRecebida[i] = '2' then Valor[i] := 2;
    if StringRecebida[i] = '3' then Valor[i] := 3;
    if StringRecebida[i] = '4' then Valor[i] := 4;
    if StringRecebida[i] = '5' then Valor[i] := 5;
    if StringRecebida[i] = '6' then Valor[i] := 6;
    if StringRecebida[i] = '7' then Valor[i] := 7;
    if StringRecebida[i] = '8' then Valor[i] := 8;
    if StringRecebida[i] = '9' then Valor[i] := 9;
    if StringRecebida[i] = 'A' then Valor[i] := 10;
    if StringRecebida[i] = 'B' then Valor[i] := 11;
    if StringRecebida[i] = 'C' then Valor[i] := 12;
    if StringRecebida[i] = 'D' then Valor[i] := 13;
    if StringRecebida[i] = 'E' then Valor[i] := 14;
    if StringRecebida[i] = 'F' then Valor[i] := 15;
    end;
  Result := (Valor[1]*16) + Valor[2];
end;

function TForm1.HexToInt24(StringRecebida : MyShortString) : Integer;
var
  Valor : Array [1..6] of Integer;
  i : Integer;
begin
  for i := 1 to 6 do
    begin
    if StringRecebida[i] = '0' then Valor[i] := 0;
    if StringRecebida[i] = '1' then Valor[i] := 1;
    if StringRecebida[i] = '2' then Valor[i] := 2;
    if StringRecebida[i] = '3' then Valor[i] := 3;
    if StringRecebida[i] = '4' then Valor[i] := 4;
    if StringRecebida[i] = '5' then Valor[i] := 5;
    if StringRecebida[i] = '6' then Valor[i] := 6;
    if StringRecebida[i] = '7' then Valor[i] := 7;
    if StringRecebida[i] = '8' then Valor[i] := 8;
    if StringRecebida[i] = '9' then Valor[i] := 9;
    if StringRecebida[i] = 'A' then Valor[i] := 10;
    if StringRecebida[i] = 'B' then Valor[i] := 11;
    if StringRecebida[i] = 'C' then Valor[i] := 12;
    if StringRecebida[i] = 'D' then Valor[i] := 13;
    if StringRecebida[i] = 'E' then Valor[i] := 14;
    if StringRecebida[i] = 'F' then Valor[i] := 15;
    end;
  Result := (Valor[1]*1048576) + (Valor[2]*65536) + (Valor[3]*4096) +
            (Valor[4]*256) + (Valor[5]*16) + Valor[6];
end;

procedure TForm1.TimerPoolingTimer(Sender: TObject);
begin
  TimerPooling.Interval := StrToInt(ComboBox9.Text);
  TimerTOut1.Interval := (StrToInt(ComboBox9.Text) * 2);
  FazPooling;
end;

procedure TForm1.ParaPooling;
begin
  PoolingAtivo := False;
  TimerPooling.Enabled := True;
  TimerTOut1.Enabled := True;
  SpeedButton2.Caption := 'Iniciar Pooling';
  DelayResposta('500');
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if PoolingAtivo then
    begin
    PoolingAtivo := False;
    TimerPooling.Enabled := True;
    TimerTOut1.Enabled := True;
    SpeedButton2.Caption := 'Iniciar Pooling';
    end
  else
    begin
    PoolingAtivo := True;
    TimerPooling.Enabled := True;
    SpeedButton2.Caption := 'Interromper Pooling';
    end;

end;

procedure TForm1.FazPooling;
begin
  TimerPooling.Enabled := False;
  if NOrdem < $FF then
    NOrdem := NOrdem + 1
  else
    NOrdem := $01;
  MaxTool('01', IntToHex(NOrdem, 2));
  if PoolingAtivo then
    TimerTOut1.Enabled := True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   WSocketServer.Close;
   SalvaRegistro;
end;

procedure TForm1.TimerTOut1Tier(Sender: TObject);
begin
  TimerTOut1.Enabled := False;
  Refresh_Status_UTRM(ip_utrmvnet, False);
  TimerPooling.Enabled := True;
end;

procedure TForm1.TrataRX(StringATratar, IP_RX : String);
var
  Tam_RX, Cmd_RX, Dados_RX, DataHora_Evento, Cod_Evento, firmware, firmware1, firmware2, firmware3, Handkey_ID, Handkey_Score, handkey_template, cartao_barras, leitor_barras : String;
  status_bio, status_bio_2, comando_bio, leitora_bio, q_id  : String;
  i : Integer;
begin
  Refresh_Status_UTRM(IP_RX, True);
  Tam_RX := StringATratar[5]+StringATratar[6];
  Cmd_RX := StringATratar[9]+StringATratar[10];
  Dados_RX := '';
  for i := 11 to (((HexToInt(Tam_RX))*2)) do
    Dados_RX := Dados_RX + StringATratar[i];
  case HexToInt(Cmd_RX) of
    $80 : begin
          Memo1.Lines.Add('Alarme : ' + Copy(StringATratar, 11, 2) +
                'H  ' + Copy(StringATratar, 13, 2) + 'H');
          OK_Ordenado := True;
          if CheckBox14.Checked then
            MaxTool('0E', '0A');
          end;
    $81 : OK_Simples := True;
    $82 : OK_Ordenado := True;
    $83 : begin
          DataHora_Evento := Copy(StringATratar, 31, 2)+ '/' +
                             Copy(StringATratar, 33, 2)+ '  ' +
                             Copy(StringATratar, 29, 2)+ ':'+
                             Copy(StringATratar, 27, 2);
          Cartao_Evento := Copy(StringATratar, 19, 8);
          Cod_Evento := Copy(StringATratar, 35, 2);
          if ((Cod_Evento = '25') or (Cod_Evento = '26') or (Cod_Evento = '27')) then
            begin
              case StrToInt(Cod_Evento) of
                  25 : begin
                        Memo3.Lines.Add('EC32 entrou em modo de manuten��o');
                        label66.Caption := 'EC32 entrou em modo de manuten��o';
                      end;
                  26 : begin
                        Memo3.Lines.Add('EC32 em opera��o normal');
                        label66.Caption := 'EC32 em opera��o normal';
                      end;
                  27 : begin
                        Memo3.Lines.Add('EC32 entrou em modo emergencial');
                        label66.Caption := 'EC32 entrou em modo emergencial';
                      end;
              end;
              OK_Ordenado := True;
              EnviaConfirmRecReg;
            end
              else
                begin
                Memo1.Lines.Add('Evento - Cart�o : ' + DataHora_Evento + '   Cart�o: ' + Cartao_Evento +
                            ' (Evento: ' + Cod_Evento + ')');
                OK_Ordenado := True;
                if CheckBox14.Checked then
                begin
                  EnviaConfirmRecReg;
                  label57.Caption := IntToStr(StrToInt(Label57.Caption) + 1 );
                end;
                end;
          end;
    $86 : begin
          Memo1.Lines.Add('Evento On-Line - Cart�o : ' + Copy(StringATratar, 19, 8) +
                ' - Leitora: ' + IntToStr(StrtoInt(Copy(StringATratar, 27, 2)) + 1));
          OK_Ordenado := True;
          if CheckBox20.Checked then
            begin
              if (ComboBox50.Text = 'Entrada/Sa�da') then MaxTool('39', '00000000' + Copy(StringATratar, 19, 8) + '00' + '00' );
              if (ComboBox50.Text = 'Entrada') then MaxTool('39', '00000000' + Copy(StringATratar, 19, 8) + '00' + '01' );
              if (ComboBox50.Text = 'Sa�da') then MaxTool('39', '00000000' + Copy(StringATratar, 19, 8) + '00' + '02' );
              if (ComboBox50.Text = 'Bloqueado') then MaxTool('39', '00000000' + Copy(StringATratar, 19, 8) + '00' + 'FF' );
            end;
          end;
    $89 : begin
          cartao_barras := '';
          leitor_barras := '';
          for i := 1 to ((Length(Dados_RX) div 2) - 1) do
          begin
            cartao_barras := cartao_barras + chr(HexToInt(Dados_RX[(i*2)-1]+Dados_RX[(i*2)]));
          end;
          OK_Ordenado := True;
          leitor_barras := Copy(Dados_RX, (Length(Dados_RX) - 1), 2);
          Memo1.Lines.Add('Evento Barras - Cart�o: ' + cartao_barras + ' Leitora: ' + leitor_barras);
          if CheckBox20.Checked then
            begin
              if (ComboBox50.Text = 'Entrada/Sa�da') then MaxTool('39', '00000000' + cartao_barras + '00' + '00' );
              if (ComboBox50.Text = 'Entrada') then MaxTool('39', '00000000' + cartao_barras + '00' + '01' );
              if (ComboBox50.Text = 'Sa�da') then MaxTool('39', '00000000' + cartao_barras + '00' + '02' );
              if (ComboBox50.Text = 'Bloqueado') then MaxTool('39', '00000000' + cartao_barras + '00' + 'FF' );
            end;

          end;
    $8A : begin
          Handkey_ID := Copy(Dados_RX, 3, 10);
          Memo2.Lines.Add('ID: ' + Handkey_ID);
          OK_Simples := True;
          end;
    $8B : begin
          Handkey_Score := Copy(Dados_RX, 3, 4);
          Handkey_Score := IntToStr(HexToInt24('00'+Handkey_Score));
          handkey_template := Copy(Dados_RX, 7, 19);
          if Handkey_Score = '0' then
            begin
              Memo2.Lines.Add('Template Capturado: ' + handkey_template);
              if ((CheckBox19.Checked) and (Handkey_Score = '0')) then
                Edit4.Text := handkey_template;
            end
            else
              begin
                Memo2.Lines.Add('Template Comparado: Score = ' + Handkey_Score + ' Template = ' + handkey_template);
            end;
          OK_Simples := True;
          end;
    $8C : begin
          MostraValorDosInputs(Copy(StringATratar, 11, 8));
          OK_Simples := True;
          end;
    $8D : begin
            Resp_Erro := True;
            Resp_Erro_dados := HexToInt(Copy(StringATratar, 11, 2));
            case (Resp_Erro_dados) of
                0 : begin
                      Memo3.Lines.Add('Comando inv�lido / erro de sintaxe');
                      label66.Caption := 'Comando inv�lido / erro de sintaxe';
                    end;
              $31 : begin
                      Memo3.Lines.Add('RX EC32 tamanho do pacote n�o confere');
                      label66.Caption := 'pacote com tamanho inv�lido';
                    end;
              $32 : begin
                      Memo3.Lines.Add('RX EC32 byte de START n�o confere');
                      label66.Caption := 'pacote invalido';
                    end;
              $33 : begin
                      Memo3.Lines.Add('RX EC32 byte de STOP n�o confere');
                      label66.Caption := 'pacote invalido';
                    end;
              $34 : begin
                      Memo3.Lines.Add('RX EC32 checksum n�o confere');
                      label66.Caption := 'pacote invalido';
                    end;
              $35 : begin
                      Memo3.Lines.Add('RX EC32 endere�o serial n�o confere');
                      label66.Caption := 'pacote invalido';
                    end;
              $36 : begin
                      Memo3.Lines.Add('TX EC32 falha na valida��o do comando');
                      label66.Caption := 'pacote invalido';
                    end;
              $37 : begin
                      Memo3.Lines.Add('EC32 n�o responde');
                      label66.Caption := 'Time-Out';
                    end;
              $38 : begin
                      Memo3.Lines.Add('EC32 aguardando inicializa��o');
                      label66.Caption := 'EC32 aguardando inicializa��o';
                    end;
              $39 : begin
                      Memo3.Lines.Add('EC32 em opera��o normal');
                      label66.Caption := 'Opera��o Normal';
                    end;
              $3A : begin
                      Memo3.Lines.Add('EC32 recebeu pacote inv�lido / com erro');
                      label66.Caption := 'pacote invalido';
                    end;
              $3B : begin
                      Memo3.Lines.Add('EC32 em modo emergencial');
                      label66.Caption := 'Modo emergencial ativado';
                    end;
              $3C : begin
                      Memo3.Lines.Add('IAC-500 n�o est� configurada para operar com a EC32');
                      label66.Caption := 'Configurar a IAC500 para comunicar com a EC32';
                    end;
             end;

          end;
    $8F : begin
          firmware := '';
          firmware1 := '';
          firmware2 := '';
          firmware3 := '';
          Dados_RX := Copy(StringATratar, 11, 16); // Vers�o firmware aplicativo
          for i := 1 to Length(Dados_RX) div 2 do
          begin
            firmware := firmware + chr(HexToInt(Dados_RX[(i*2)-1]+Dados_RX[(i*2)]));
          end;
          Dados_RX := Copy(StringATratar, 27, 20); // Data da Vers�o firmware aplicativo
          for i := 1 to Length(Dados_RX) div 2 do
          begin
            firmware1 := firmware1 + chr(HexToInt(Dados_RX[(i*2)-1]+Dados_RX[(i*2)]));
          end;
          Dados_RX := Copy(StringATratar, 47, 16); // Vers�o Boot Loader
          for i := 1 to Length(Dados_RX) div 2 do
          begin
            firmware2 := firmware2 + chr(HexToInt(Dados_RX[(i*2)-1]+Dados_RX[(i*2)]));
          end;
          Dados_RX := Copy(StringATratar, 63, 20); // Data da Vers�o Boot Loader
          for i := 1 to Length(Dados_RX) div 2 do
          begin
            firmware3 := firmware3 + chr(HexToInt(Dados_RX[(i*2)-1]+Dados_RX[(i*2)]));
          end;
          OK_Simples := True;
          ShowMessage('Vers�o Firmware Aplicativo: ' + firmware + #13 + #10 + 'Data da Vers�o Firmware Aplicativo: ' + firmware1 + #13 + #10 + #13 + #10 + 'Vers�o Boot Loader: ' + firmware2 + #13 + #10 + 'Data da Vers�o Boot Loader: ' + firmware3);
          end;
    $90 : Begin
          Memo2.Lines.Add('Time-Out');
          Resp_Erro := True;
          end;
    $92 : Begin
          OK_Simples := True;
          if HexToInt(Tam_RX) = 0 then
            begin
              Tam_RX := '08';
              Dados_RX := '';
              for i := 11 to (((HexToInt(Tam_RX))*2)) do
                Dados_RX := Dados_RX + StringATratar[i];
            end;
          leitora_bio := copy(Dados_RX, 1, 2);
          comando_bio := copy(Dados_RX, 3, 2);
          status_bio := copy(Dados_RX, 5, 2);

          if comando_bio = '01' then
            begin
              if  status_bio = '19' then Memo4.Lines.Add('Auto Identifica��o ATIVADA !');
              if  status_bio = '01' then Memo4.Lines.Add('Status OK !');
              if  status_bio = '12' then Memo4.Lines.Add('Time-Out !');
              if  ((status_bio <> '01') and (status_bio <> '12') and (status_bio <> '19')) then Memo4.Lines.Add('Status de Retorno: ' + status_bio);
            end;
          if comando_bio = '15' then
            begin
              if  status_bio = '01' then Memo4.Lines.Add('Template comparado com sucesso !');
              if  status_bio = '02' then Memo4.Lines.Add('Template n�o confere !');
              if  status_bio = '07' then Memo4.Lines.Add('Template n�o capturado !');
              if  status_bio = '19' then Memo4.Lines.Add('Falha na compara��o do template, Auto Identifica��o ATIVADA !');
              if  ((status_bio <> '01') and (status_bio <> '02') and (status_bio <> '07') and (status_bio <> '19')) then Memo4.Lines.Add('Falha na compara��o do template, status retorno: ' + status_bio);
            end;
          if comando_bio = '16' then
            begin
              if  status_bio = '07' then Memo4.Lines.Add('Template n�o capturado !');
              if  status_bio = '19' then Memo4.Lines.Add('Falha na captura do template, Auto Identifica��o ATIVADA !');
              if  ((status_bio <> '01') and (status_bio <> '07') and (status_bio <> '19')) then Memo4.Lines.Add('Falha na captura do template, status retorno: ' + status_bio);
            end;
          if comando_bio = '1A' then
            begin
              if  status_bio = '01' then Memo4.Lines.Add('Comando executado com sucesso !');
              if  status_bio <> '01' then Memo4.Lines.Add('Falha ao executar a configura��o, status retorno: ' + status_bio);
            end;
          if comando_bio = '1B' then
            begin
              if  status_bio <> '01' then Memo4.Lines.Add('Falha na captura do template, status retorno: ' + status_bio);
            end;

          end;
    $93 : Begin
          OK_Simples := True;
          if HexToInt(Tam_RX) = 0 then
            begin
              Tam_RX := '1A';
              Dados_RX := '';
              for i := 11 to (((HexToInt(Tam_RX))*2)) do
                Dados_RX := Dados_RX + StringATratar[i];
            end;
          leitora_bio := copy(Dados_RX, 1, 2);
          comando_bio := copy(Dados_RX, 5, 2);
          status_bio := copy(Dados_RX, 7, 32);
          Memo5.Lines.Add('leitora_bio: ' + leitora_bio + ' comando_bio: ' + comando_bio + ' status_bio: ' + status_bio);

          if comando_bio = '05' then
            begin
              status_bio_2 := copy(Dados_RX, 11, 2);
              status_bio :=  copy(Dados_RX, 19, 2);
              Memo5.Lines.Add('Vers�o de Firmware: ' + IntToStr(HexToInt(status_bio_2)) + '.' + CompletaComZeros(IntToStr(HexToInt(status_bio)),2));
            end;

          if comando_bio = '10' then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              if  status_bio = '00' then Memo5.Lines.Add('M�dulo 100% Funcional !');
              if  status_bio = '01' then Memo5.Lines.Add('Erro, placa n�o est� operacional !');
              if  status_bio = '02' then Memo5.Lines.Add('Erro, m�dulo de captura n�o est� operacional !');
              if  status_bio = '0B' then Memo5.Lines.Add('Baud Rate RS232 definido com sucesso !');
              if  ((status_bio <> '00') and (status_bio <> '01') and (status_bio <> '02')) then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '11' then
            begin
              status_bio := copy(Dados_RX, 35, 4);
              if  status_bio = '0000' then Memo5.Lines.Add('M�dulo Reiniciado !');
              if  (status_bio <> '0000') then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '1A' then
            begin
              status_bio := copy(Dados_RX, 11, 2);
              if  status_bio = '00' then Memo5.Lines.Add('Auto Identify DESATIVADO !');
              if  status_bio = '01' then
                begin
                  Ok_Bio := True;
                  Memo5.Lines.Add('Auto Identify ATIVADO !');
                end;
              if  ((status_bio <> '00') and (status_bio <> '01')) then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '20' then
            begin
              status_bio := copy(Dados_RX, 11, 2);
              if status_bio = '25' then
                begin
                  status_bio_2 := copy(Dados_RX, 19, 2);
                  if  status_bio_2 = '00' then Memo5.Lines.Add('Autentica��o Terminal ATIVADO !');
                  if  status_bio_2 = '01' then
                  begin
                    Ok_Bio := True;
                    Memo5.Lines.Add('Autentica��o Servidor ATIVADO !');
                  end;
                end;
              if status_bio = '1B' then
                  begin
                    status_bio_2 := copy(Dados_RX, 19, 2);
                    if  status_bio_2 = '00' then Memo5.Lines.Add('Rotate Capture Off !');
                    if  status_bio_2 = '01' then Memo5.Lines.Add('Rotate Capture On !');
                  end;
              if ((status_bio <> '25') and (status_bio <> '1B')) then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '21' then
            begin
              status_bio := copy(Dados_RX, 11, 2);
              if status_bio = '0B' then
              begin
                Ok_Bio := True;
                Memo5.Lines.Add('Baud Rate 19200 configurado com sucesso !');
              end;
              if status_bio = '01' then Memo5.Lines.Add('Baud Rate 115200 configurado com sucesso !');
              if ((status_bio <> '0B') and (status_bio <> '01')) then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '40' then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              if  status_bio = '08' then Memo5.Lines.Add('Time-out, template n�o capturado !');
              if  ((status_bio <> '08') and (status_bio <> '00')) then
                Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '56' then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              q_id := IntToStr(strtoint('$' + copy(Dados_RX, 17, 2) + copy(Dados_RX, 15, 2) + copy(Dados_RX, 13, 2) + copy(Dados_RX, 11, 2)));
              if  status_bio = '00' then Memo5.Lines.Add('Template encontrado na mem�ria interna com ID: ' + q_id);
              if  status_bio = '08' then Memo5.Lines.Add('Time-out, template n�o capturado !');
              if  status_bio = '0B' then Memo5.Lines.Add('Mem�ria do equipamento est� vazio !');
              if  status_bio = '1B' then Memo5.Lines.Add('Template n�o encontrado na mem�ria interna !');
              if  ((status_bio <> '00') and (status_bio <> '08') and (status_bio <> '0B') and (status_bio <> '1B')) then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '5C' then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              if  status_bio = '00' then Memo5.Lines.Add('Template comparado com sucesso !');
              if  status_bio = '04' then Memo5.Lines.Add('Template n�o confere !');
              if  status_bio = '08' then Memo5.Lines.Add('Template n�o capturado !');
              if  ((status_bio <> '00') and (status_bio <> '04') and (status_bio <> '08')) then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '82'then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              if  status_bio = '00' then Memo5.Lines.Add('Log�s apagados com sucesso !');
              if  (status_bio <> '00') then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '76' then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              if  status_bio = '00' then Memo5.Lines.Add('Templates apagados com sucesso !');
              if  (status_bio <> '00') then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '88' then
            begin
              status_bio := copy(Dados_RX, 35, 4);
              if  status_bio = '0000' then Memo5.Lines.Add('Leitor biometrico restaurado para as configura��es de f�brica !');
              if  (status_bio <> '0000') then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '9B' then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              if  status_bio = '00' then Memo5.Lines.Add('Template cadastrado na mem�ria interna com sucesso !');
              if  status_bio = '03' then Memo5.Lines.Add('Falha no registro do Template na mem�ria interna !');
              if  status_bio = '04' then Memo5.Lines.Add('Falha no registro do Template na mem�ria interna !');
              if  status_bio = '05' then Memo5.Lines.Add('Usu�rio j� existe na mem�ria interna !');
              if  status_bio = '08' then Memo5.Lines.Add('Template n�o capturado !');
              if  status_bio = '09' then Memo5.Lines.Add('Mem�ria interna est� cheia !');
              if  status_bio = '12' then Memo5.Lines.Add('Falha na grava��o da mem�ria flash interna !');
              if  status_bio = '2A' then Memo5.Lines.Add('Template similar j� existe na mem�ria interna !');
              if  ((status_bio <> '00') and
                   (status_bio <> '03') and
                   (status_bio <> '04') and
                   (status_bio <> '05') and
                   (status_bio <> '08') and
                   (status_bio <> '09') and
                   (status_bio <> '12') and
                   (status_bio <> '1A')
                   ) then Memo5.Lines.Add('C�digo de retorno n�o mapeado, Status de Retorno: ' + status_bio);
            end;

          if comando_bio = '4F' then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              q_id := IntToStr(strtoint('$' + copy(Dados_RX, 17, 2) + copy(Dados_RX, 15, 2) + copy(Dados_RX, 13, 2) + copy(Dados_RX, 11, 2)));
              Memo5.Lines.Add('Qtd templates cadastrados na memoria : ' + q_id);
            end;

          if comando_bio = 'A5' then
            begin
              status_bio := copy(Dados_RX, 35, 2);
              if  status_bio = '03' then Ocorreu_TimeOut := True;
            end;
          end;
    $94 : begin
          Memo1.Lines.Add('Teclado Matricial On-Line : ' + Copy(StringATratar, 11, 8));
          OK_Ordenado := True;
          if CheckBox20.Checked then
            begin
              if (ComboBox50.Text = 'Entrada/Sa�da') then MaxTool('39', '00000000' + Copy(StringATratar, 11, 8) + '00' + '00' );
              if (ComboBox50.Text = 'Entrada') then MaxTool('39', '00000000' + Copy(StringATratar, 11, 8) + '00' + '01' );
              if (ComboBox50.Text = 'Sa�da') then MaxTool('39', '00000000' + Copy(StringATratar, 11, 8) + '00' + '02' );
              if (ComboBox50.Text = 'Bloqueado') then MaxTool('39', '00000000' + Copy(StringATratar, 11, 8) + '00' + 'FF' );
            end;
          end;
    $98 : begin
          qtd_cartoes := IntToStr(HexToInt24('00' + Copy(StringATratar, 11, 4)));
          qtd_capacidade_ordenada := IntToStr(HexToInt24('00' + Copy(StringATratar, 15, 4)));
          qtd_cartoes_desordenado := IntToStr(HexToInt24('00' + Copy(StringATratar, 19, 4)));
          qtd_capacidade_desordenada := IntToStr(HexToInt24('00' + Copy(StringATratar, 23, 4)));
          qtd_eventos := IntToStr(HexToInt24('00' + Copy(StringATratar, 27, 4)));
          qtd_capacidade_eventos := IntToStr(HexToInt24('00' + Copy(StringATratar, 31, 4)));
          qtd_turnos := IntToStr(HexToInt(Copy(StringATratar, 35, 2)));
          qtd_capacidade_turnos := IntToStr(HexToInt(Copy(StringATratar, 37, 2)));
          qtd_feriados := IntToStr(HexToInt(Copy(StringATratar, 39, 2)));
          qtd_capacidade_feriados := IntToStr(HexToInt(Copy(StringATratar, 41, 2)));
          Resp_versao_firmware := True;
          end;
  end;
end;

procedure TForm1.Refresh_Status_UTRM(IP_UTRM : String; IfOnLine : Boolean);
begin
  if IP_UTRM = ip_utrmvnet then
    begin
    if IfOnLine then
      begin
      Form1.caption := descr_soft + ip_utrmvnet + ' -> ON-LINE]';
      end
    else
      begin
      Form1.caption := descr_soft + ip_utrmvnet + ' -> OFF-LINE]';
      Label1.Caption := 'Time - out !!!';
      inc(t_off_line);
      Label27.caption := IntToStr(t_off_line);
      TimerPooling.Enabled := False;
      TimerPooling.Interval := 1500;
      TimerPooling.Enabled := True;
      end
    end;

end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  if PoolingAtivo then
    ParaPooling;
  if Confirma('Deseja eliminar TODOS os registros da mem�ria ?') then
    MaxTool('0E', '05');
  DelayResposta(ComboBox9.text);    
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Label57.Caption := '0';
end;

procedure TForm1.EnviaRTC;
var
  Dados, Data, Hora, DiaDaSemana : String;
begin
  DateSeparator := '/';
  ShortDateFormat := 'dd/mm/yyyy';
  TimeSeparator := ':';
  ShortTimeFormat := 'hh:mm:ss';
  Data := FormatDateTime('dd/mm/yyyy', Now);
  Hora := TimeToStr(Time);
  DiaDaSemana := IntToHex(DayOfWeek(StrToDate(Data)),2);
  Dados := Hora[7]+ Hora[8]+ Hora[4]+ Hora[5]+ Hora[1]+ Hora[2] +
           DiaDaSemana[1] + DiaDaSemana[2] +
           Data[1]+ Data[2]+ Data[4]+ Data[5]+ Data[9]+ Data[10];
  Maxtool('04', Dados);
end;

procedure TForm1.MudaIP;
var
  novo_ip : String;
begin
  Label6.Font.Color := clBlack;
  novo_ip := IntToHex((StrToInt(Edit5.Text)),2) + IntToHex((StrToInt(Edit6.Text)),2) +
              IntToHex((StrToInt(Edit7.Text)),2) + IntToHex((StrToInt(Edit8.Text)),2);
  MaxTool('29', novo_ip);
  DelayResposta(ComboBox9.text);
  if Ok_Simples then
    begin
      Label6.Font.Color := clBlue;
      MaxTool('0E', '07');
      edit1.text := edit5.text;
      edit3.text := edit6.text;
      edit18.text := edit7.text;
      edit19.text := edit8.text;
      novo_ip_para_comunicar;
      ShowMessage('Ip Alterado com sucesso !');
      Aviso.ShowModal;
    end
  else
    Label6.Font.Color := clRed;
end;


procedure TForm1.Muda_IP_Gateway;
var
  novo_ip : String;
begin
  novo_ip := IntToHex((StrToInt(Edit2.Text)),2) + IntToHex((StrToInt(Edit21.Text)),2) +
              IntToHex((StrToInt(Edit22.Text)),2) + IntToHex((StrToInt(Edit23.Text)),2);
  MaxTool('2E', novo_ip);
end;

procedure TForm1.Muda_Mascara;
var
  nova_mascara : String;
begin
  nova_mascara := IntToHex((StrToInt(Edit24.Text)),2) + IntToHex((StrToInt(Edit25.Text)),2) +
                   IntToHex((StrToInt(Edit26.Text)),2) + IntToHex((StrToInt(Edit27.Text)),2);
  MaxTool('2F', nova_mascara);
end;

procedure TForm1.Muda_PORTA_host;
var
  nova_porta : String;
begin
  nova_porta := IntToHex((StrToInt(Edit20.Text)),4);
  MaxTool('2D', nova_porta);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  LeRegistro;
  novo_ip_para_comunicar;
  if not ConectaSocketServer then
    ShowErro('N�o foi poss�vel iniciar socket servidor. Causa prov�vel : Porta UDP '+
      edit30.Text + ' indispon�vel !');
  Form1.caption := descr_soft + ip_cli + ' -> *****]';

  StatusBar1.Panels[0].Text := ' Host: ' + meu_host;
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;
  porta_local_cli := IntToStr(StrToInt(Edit30.text) - 50);

  CheckBoxes := True;
  CheckBoxes2 := True;
  t_off_line := 0;
  estado := $00;
  cartao_tf := 1;
  TabSheet9.Show;
  ComboBox9.Text := '500';
  BitBtn47.SetFocus;
end;

procedure TForm1.novo_ip_para_comunicar;
begin
    ip_cli := ip_utrmvnet;
end;

procedure TForm1.meu_sleep(valor_em_ms : Integer);
begin
  QueryPerformanceFrequency(res);
  QueryPerformanceCounter(t1);
  repeat
    Application.ProcessMessages;
    QueryPerformanceCounter(t2);
  until (((t2 - t1) / res) >= (0.001 * valor_em_ms));
end;

procedure TForm1.DelayResposta(Tempo : String);
var
    i : Integer;
begin
  i := 0;
  Ocorreu_TimeOut := False;
    repeat
    meu_sleep(1);
    Application.ProcessMessages;
    inc(i);
    if (i = (StrToInt(Tempo))) then
      Ocorreu_TimeOut := True;
    if ((OK_Simples) or (OK_Ordenado) or (Resp_Erro) or (Resp_versao_firmware) or (Ok_Bio)) then
      begin
      i := StrToInt(Tempo);
      Ocorreu_TimeOut := False;
      end;
    QueryPerformanceCounter(t2);
    until (i = StrToInt(Tempo));
  if Ocorreu_TimeOut then
    begin
    Inc(t_off_line);
    Label1.Caption := 'Time - out !!!';
    Label27.caption := IntToStr(t_off_line);
    end;
    Application.ProcessMessages();
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  var_bio_AUTOID : String;
  var_bio_AUTOID1, var_bio_AUTOID2, var_bio_AUTOID3 : Byte;
begin
  if PoolingAtivo then
    ParaPooling;
  CheckBox1.Font.Color := clBlack;
  CheckBox2.Font.Color := clBlack;
  CheckBox3.Font.Color := clBlack;
  CheckBox4.Font.Color := clBlack;
  CheckBox5.Font.Color := clBlack;
  CheckBox6.Font.Color := clBlack;
  CheckBox7.Font.Color := clBlack;
  CheckBox8.Font.Color := clBlack;
  CheckBox9.Font.Color := clBlack;
  CheckBox10.Font.Color := clBlack;
  CheckBox11.Font.Color := clBlack;
  CheckBox12.Font.Color := clBlack;
  CheckBox13.Font.Color := clBlack;
  CheckBox18.Font.Color := clBlack;
  CheckBox42.Font.Color := clBlack;
  if Checkbox1.Checked then
    begin
    EnviaRTC;
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox1.Font.Color := clBlue
    else
      CheckBox1.Font.Color := clRed;
    end;
  if Checkbox3.Checked then
    begin
    EnviaMsgInicial(CompletaComEspacos(Edit28.text, 16));
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox3.Font.Color := clBlue
    else
      CheckBox3.Font.Color := clRed;
    end;
  if Checkbox7.Checked then
    begin
    EnviaLeitoras(ComboBox5.Text, ComboBox22.Text);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox7.Font.Color := clBlue
    else
      CheckBox7.Font.Color := clRed;
    end;
  if Checkbox5.Checked then
    begin
    EnviaAplicativo(ComboBox3.Text);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox5.Font.Color := clBlue
    else
      CheckBox5.Font.Color := clRed;
    end;
  if Checkbox9.Checked then
    begin
    EnviaConfigPorta(ComboBox7.Text);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox9.Font.Color := clBlue
    else
      CheckBox9.Font.Color := clRed;
    end;
  if Checkbox11.Checked then
    begin
    EnviaCFluxoCatraca(ComboBox18.Text, ComboBox19.Text);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox11.Font.Color := clBlue
    else
      CheckBox11.Font.Color := clRed;
    end;
  if Checkbox12.Checked then
    begin
    EnviaModFunc(ComboBox24.Text);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      Checkbox12.Font.Color := clBlue
    else
      Checkbox12.Font.Color := clRed;
    end;
  if Checkbox18.Checked then
    begin
    EnviaLeitorasSerial(ComboBox25.Text,ComboBox26.Text,ComboBox27.Text,ComboBox28.Text,ComboBox29.Text,
                        ComboBox30.Text,ComboBox31.Text,ComboBox32.Text,ComboBox33.Text,ComboBox34.Text,
                        ComboBox35.Text,ComboBox36.Text,ComboBox37.Text,ComboBox38.Text,ComboBox39.Text);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      Checkbox18.Font.Color := clBlue
    else
      Checkbox18.Font.Color := clRed;
    end;

  if CheckBox42.Checked then
    begin
    Maxtool('50', IntToHex(ComboBox83.itemindex, 2) + IntToHex(ComboBox101.itemindex, 2) + CompletaComZeros(Edit29.Text, 4));
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      Checkbox42.Font.Color := clBlue
    else
      Checkbox42.Font.Color := clRed;
    end;

  if Checkbox4.Checked then
    begin
    EnviaPosicCatraca(ComboBox2.Text);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox4.Font.Color := clBlue
    else
      CheckBox4.Font.Color := clRed;
    end;
  if Checkbox10.Checked then
    begin
    Maxtool('2A', IntToHex((StrToInt(ComboBox8.Text)), 2));
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox10.Font.Color := clBlue
    else
      CheckBox10.Font.Color := clRed;
    end;
  if Checkbox2.Checked then
    begin
    MaxTool('11', IntToHex((StrToInt(ComboBox1.Text))*10,2));
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox2.Font.Color := clBlue
    else
      CheckBox2.Font.Color := clRed;
    end;
  if Checkbox6.Checked then
    begin
    Maxtool('1F', IntToHex((StrToInt(ComboBox4.Text))*10,2));
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox6.Font.Color := clBlue
    else
      CheckBox6.Font.Color := clRed;
    end;
  if Checkbox8.Checked then
    begin
    Maxtool('22', IntToHex((StrToInt(ComboBox6.Text))*10, 2));
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox8.Font.Color := clBlue
    else
      CheckBox8.Font.Color := clRed;
    end;

  if Checkbox13.Checked then
    begin
    Maxtool('3A', IntToHex((StrToInt(ComboBox23.Text))*10, 2));
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      Checkbox13.Font.Color := clBlue
    else
      Checkbox13.Font.Color := clRed;
    end;

  if Checkbox18.Checked then
    begin
      if ComboBox25.Text = 'Biometrico Nitigen' then var_bio_AUTOID1 := $01 else var_bio_AUTOID1 := $00;
      if ComboBox30.Text = 'Biometrico Nitigen' then var_bio_AUTOID2 := $02 else var_bio_AUTOID2 := $00;
      if ComboBox35.Text = 'Biometrico Nitigen' then var_bio_AUTOID3 := $04 else var_bio_AUTOID3 := $00;
      var_bio_AUTOID := IntToHex(var_bio_AUTOID1 or var_bio_AUTOID2 or var_bio_AUTOID3, 2);
      sleep(2000);
      Application.ProcessMessages();
      Maxtool('4E', var_bio_AUTOID);
      DelayResposta(ComboBox9.text);
      ShowMessage('� necess�rio efetuar um reset f�sico na placa controladora para que algumas configura��es funcionem !');
    end;
end;

procedure TForm1.EnviaMsgInicial(Valor : String) ;
var
  dado1, dado2, dado3, dado4, dado5, dado6, dado7,
  dado8, dado9, dado10, dado11, dado12, dado13, dado14,
  dado15, dado16  : Byte;
  msg_inic : String;
begin
  dado1 := Ord(valor[1]);
  dado2 := Ord(valor[2]);
  dado3 := Ord(valor[3]);
  dado4 := Ord(valor[4]);
  dado5 := Ord(valor[5]);
  dado6 := Ord(valor[6]);
  dado7 := Ord(valor[7]);
  dado8 := Ord(valor[8]);
  dado9 := Ord(valor[9]);
  dado10 := Ord(valor[10]);
  dado11 := Ord(valor[11]);
  dado12 := Ord(valor[12]);
  dado13 := Ord(valor[13]);
  dado14 := Ord(valor[14]);
  dado15 := Ord(valor[15]);
  dado16 := Ord(valor[16]);

  msg_inic := IntToHex(dado1,2)+ IntToHex(dado2,2)+IntToHex(dado3,2)+IntToHex(dado4,2)+
                IntToHex(dado5,2)+IntToHex(dado6,2)+IntToHex(dado7,2)+IntToHex(dado8,2)+
                IntToHex(dado9,2)+IntToHex(dado10,2)+IntToHex(dado11,2)+IntToHex(dado12,2)
                +IntToHex(dado13,2)+IntToHex(dado14,2)+IntToHex(dado15,2)+IntToHex(dado16,2);
  MaxTool('15', msg_inic);
end;

procedure TForm1.EnviaPosicCatraca(Valor : String) ;
var
  dado: String;
begin
  if valor = 'Esquerda' then
    dado := '01'
  else
    dado := '00';
  Maxtool('16', dado);
end;

procedure TForm1.EnviaAplicativo(Valor : String) ;
var
  dado: String;
begin
  dado := '01';
  if valor = 'Inativo' then
    dado := '00';
  if valor = 'Porta' then
    dado := '01';
  if valor = 'Porta c/ Sensor' then
    dado := '05';
  if valor = 'Porta c/ Cofre' then
    dado := '0A';
  if valor = 'Catraca Wolpac' then
    dado := '03';
  if valor = 'Catraca Task' then
    dado := '04';
  if valor = 'Catraca Blantech' then
    dado := '07';
  if valor = 'Catraca Digicon' then
    dado := '08';
  if valor = 'Catraca Task Picto LED' then
    dado := '0B';
  if valor = 'Catraca Digicon PNE' then
    dado := '0C';
  if valor = 'Wolflap / D-Gate' then
    dado := '0E';
  if valor = 'Torniquete c/ Interface' then
    dado := '0F';
  if valor = 'Cancela c/ Cofre' then
    dado := '10';
  Maxtool('1E', dado);
end;

procedure TForm1.EnviaLeitoras(valor1, valor2 : String) ;
var
  dado1, dado2: String;
begin
  dado1 := '01';
  dado2 := '01';
  //leitora 1
  if valor1 = 'Aba Track II (Motorola)' then
    dado1 := '01';
  if valor1 = 'Aba Track II (HID)' then
    dado1 := '10';
  if valor1 = 'Wiegand 26 bits' then
    dado1 := '02';
  if valor1 = 'Wiegand 44 bits' then
    dado1 := '08';
  if valor1 = 'ASR-BRT' then
    dado1 := '09';
  if valor1 = 'Wiegand 36 Bits HID sem paridade' then
    dado1 := '0A';
  if valor1 = 'HID-BRT' then
    dado1 := '0B';
  if valor1 = 'Barras Padr�o Teclado' then
    dado1 := '0C';
  if valor1 = 'Wiegand 35 Bits HID' then
    dado1 := '0D';
  if valor1 = 'Wiegand 26 e 35 Bits' then
    dado1 := '0E';
  if valor1 = 'Wiegand 37 Bits sem FC' then
    dado1 := '0F';
  if valor1 = 'ABA_To_Wiegand 36 bits HID' then
    dado1 := '11';
  if valor1 = 'Wiegand 35 Bits HID + Teclado (Especial 01)' then
    dado1 := '12';
  if valor1 = 'Wiegand 34 Bits HID' then
    dado1 := '13';
  if valor1 = 'HID iClass 32 bits/26 bits HSBC/Bradesco (Especial 02)' then
    dado1 := '14';
  if valor1 = 'Multiclass c�digo 15' then
    dado1 := '15';

  //leitora 2
  if valor2 = 'Aba Track II (Motorola)' then
    dado2 := '01';
  if valor2 = 'Aba Track II (HID)' then
    dado2 := '10';
  if valor2 = 'Wiegand 26 bits' then
    dado2 := '02';
  if valor2 = 'Wiegand 44 bits' then
    dado2 := '08';
  if valor2 = 'ASR-BRT' then
    dado2 := '09';
  if valor2 = 'Wiegand 36 Bits HID sem paridade' then
    dado2 := '0A';
  if valor2 = 'HID-BRT' then
    dado2 := '0B';
  if valor2 = 'Barras Padr�o Teclado' then
    dado2 := '0C';
  if valor2 = 'Wiegand 35 Bits HID' then
    dado2 := '0D';
  if valor2 = 'Wiegand 26 e 35 Bits' then
    dado2 := '0E';
  if valor2 = 'Wiegand 37 Bits sem FC' then
    dado2 := '0F';
  if valor2 = 'ABA_To_Wiegand 36 bits HID' then
    dado2 := '11';
  if valor2 = 'Wiegand 35 Bits HID + Teclado (Especial 01)' then
    dado2 := '12';
  if valor2 = 'Wiegand 34 Bits HID' then
    dado2 := '13';
  if valor2 = 'HID iClass 32 bits/26 bits HSBC/Bradesco (Especial 02)' then
    dado2 := '14';
  if valor2 = 'Multiclass c�digo 15' then
    dado2 := '15';



  MaxTool('20', dado1+dado2);
end;

procedure TForm1.EnviaLeitorasSerial(Disp1, Baud1, Bits1, Paridade1, Stopbits1,
                                     Disp2, Baud2, Bits2, Paridade2, Stopbits2,
                                     Disp3, Baud3, Bits3, Paridade3, Stopbits3 : String) ;
var
  dado1, dado2, dado3, dado4, dado5,
  dado6, dado7, dado8, dado9, dado10,
  dado11, dado12, dado13, dado14, dado15: String;
begin
  dado1 := '01';
  dado2 := '04';
  dado3 := '08';
  dado4 := '00';
  dado5 := '01';
  dado6 := '01';
  dado7 := '04';
  dado8 := '08';
  dado9 := '00';
  dado10 := '01';
  dado11 := '0A';
  dado12 := '04';
  dado13 := '08';
  dado14 := '00';
  dado15 := '01';

  //leitora 1
  if Disp1 = 'Desativado' then
    dado1 := '00';
  if Disp1 = 'HandKey' then
    dado1 := '0A';
  if Disp1 = 'Biometrico Nitigen' then
    dado1 := '09';
  if Disp1 = 'Barras' then
    dado1 := '01';
  if Disp1 = 'Biometrico Virdi' then
    dado1 := '08';
  if Disp1 = 'Barras Off-Line' then
    dado1 := '02';



  if Baud1 = '1200' then
    dado2 := '01';
  if Baud1 = '2400' then
    dado2 := '02';
  if Baud1 = '4800' then
    dado2 := '03';
  if Baud1 = '9600' then
    dado2 := '04';
  if Baud1 = '14400' then
    dado2 := '05';
  if Baud1 = '19200' then
    dado2 := '06';
  if Baud1 = '28800' then
    dado2 := '07';
  if Baud1 = '38400' then
    dado2 := '08';
  if Baud1 = '56000' then
    dado2 := '09';
  if Baud1 = '57600' then
    dado2 := '0A';
  if Baud1 = '76800' then
    dado2 := '0B';
  if Baud1 = '115200' then
    dado2 := '0C';

  if Bits1 = '5 bits' then
    dado3 := '05';
  if Bits1 = '6 bits' then
    dado3 := '06';
  if Bits1 = '7 bits' then
    dado3 := '07';
  if Bits1 = '8 bits' then
    dado3 := '08';

  if Paridade1 = 'Nula / None' then
    dado4 := '00';
  if Paridade1 = 'Impar' then
    dado4 := '01';
  if Paridade1 = 'Par' then
    dado4 := '02';

  if Stopbits1 = '1 stop bit' then
    dado5 := '01';
  if Stopbits1 = '2 stop bits' then
    dado5 := '02';

  //leitora 2
  if Disp2 = 'Desativado' then
    dado6 := '00';
  if Disp2 = 'HandKey' then
    dado6 := '0A';
  if Disp2 = 'Biometrico Nitigen' then
    dado6 := '09';
  if Disp2 = 'Barras' then
    dado6 := '01';
  if Disp2 = 'Biometrico Virdi' then
    dado6 := '08';
  if Disp2 = 'Barras Off-Line' then
    dado6 := '02';



  if Baud2 = '1200' then
    dado7 := '01';
  if Baud2 = '2400' then
    dado7 := '02';
  if Baud2 = '4800' then
    dado7 := '03';
  if Baud2 = '9600' then
    dado7 := '04';
  if Baud2 = '14400' then
    dado7 := '05';
  if Baud2 = '19200' then
    dado7 := '06';
  if Baud2 = '28800' then
    dado7 := '07';
  if Baud2 = '38400' then
    dado7 := '08';
  if Baud2 = '56000' then
    dado7 := '09';
  if Baud2 = '57600' then
    dado7 := '0A';
  if Baud2 = '76800' then
    dado7 := '0B';
  if Baud2 = '115200' then
    dado7 := '0C';

  if Bits2 = '5 bits' then
    dado8 := '05';
  if Bits2 = '6 bits' then
    dado8 := '06';
  if Bits2 = '7 bits' then
    dado8 := '07';
  if Bits2 = '8 bits' then
    dado8 := '08';

  if Paridade2 = 'Nula / None' then
    dado9 := '00';
  if Paridade2 = 'Impar' then
    dado9 := '01';
  if Paridade2 = 'Par' then
    dado9 := '02';

  if Stopbits2 = '1 stop bit' then
    dado10 := '01';
  if Stopbits2 = '2 stop bits' then
    dado10 := '02';

  //leitora 3

  if Disp3 = 'Desativado' then
    dado11 := '01';
  if Disp3 = 'EC32' then
    dado11 := '0C';
  if Disp3 = 'HandKey' then
    dado11 := '0A';
  if Disp3 = 'Biometrico Nitigen' then
    dado11 := '09';
  if Disp3 = 'Barras' then
    dado11 := '01';
  if Disp3 = 'Biometrico Virdi' then
    dado11 := '08';
  if Disp3 = 'Barras Off-Line' then
    dado11 := '02';
  if Disp3 = 'Barras Off-Line' then
    dado11 := '02';
  if Disp3 = 'LCD 16x2' then
    dado11 := '00';


  if Baud3 = '1200' then
    dado12 := '01';
  if Baud3 = '2400' then
    dado12 := '02';
  if Baud3 = '4800' then
    dado12 := '03';
  if Baud3 = '9600' then
    dado12 := '04';
  if Baud3 = '14400' then
    dado12 := '05';
  if Baud3 = '19200' then
    dado12 := '06';
  if Baud3 = '28800' then
    dado12 := '07';
  if Baud3 = '38400' then
    dado12 := '08';
  if Baud3 = '56000' then
    dado12 := '09';
  if Baud3 = '57600' then
    dado12 := '0A';
  if Baud3 = '76800' then
    dado12 := '0B';
  if Baud3 = '115200' then
    dado12 := '0C';

  if Bits3 = '5 bits' then
    dado13 := '05';
  if Bits3 = '6 bits' then
    dado13 := '06';
  if Bits3 = '7 bits' then
    dado13 := '07';
  if Bits3 = '8 bits' then
    dado13 := '08';

  if Paridade3 = 'Nula / None' then
    dado14 := '00';
  if Paridade3 = 'Impar' then
    dado14 := '01';
  if Paridade3 = 'Par' then
    dado14 := '02';

  if Stopbits3 = '1 stop bit' then
    dado15 := '01';
  if Stopbits3 = '2 stop bits' then
    dado15 := '02';


  MaxTool('3B', dado1+dado2+dado3+dado4+dado5+
                dado6+dado7+dado8+dado9+dado10+
                dado11+dado12+dado13+dado14+dado15);
end;

procedure TForm1.EnviaModFunc(Valor : String);
var
  dado1: String;
begin
  dado1 := 'FF';
  if valor = 'Off-Line' then
    dado1 := 'FF';
  if valor = 'Misto' then
    dado1 := '02';
  if valor = 'On-Line' then
    dado1 := '01';
  Maxtool('38', dado1);
end;

procedure TForm1.EnviaConfigPorta(Valor : String);
var
  dado1: String;
begin
  dado1 := '42';
  if valor = '1 porta / L1 = Entrada / L2 = Sa�da' then
    dado1 := '42';
  if valor = '1 porta / L1 = Sa�da / L2 = Entrada' then
    dado1 := '41';
  if valor = '2 portas / L1 = Entrada / L2 = Sa�da' then
    dado1 := '46';
  if valor = '2 portas / L1 = Entrada / L2 = Entrada' then
    dado1 := '44';
  if valor = '2 portas / L1 = Sa�da / L2 = Entrada' then
    dado1 := '45';
  if valor = '2 portas / L1 = Sa�da / L2 = Sa�da' then
    dado1 := '47';
  Maxtool('23', dado1);
end;

procedure TForm1.EnviaCFluxoCatraca(Valor1, Valor2 : String);
var
  dado : String;
  dado1, dado2 : Byte;
begin
  dado1 := $00;
  dado2 := $00;
  if valor1 = 'Entrada com cart�o' then
    dado1 := $00;
  if valor1 = 'Entrada sempre bloqueada' then
    dado1 := $01;
  if valor1 = 'Entrada sempre livre' then
    dado1 := $02;
  if valor2 = 'Sa�da com cart�o' then
    dado2 := $00;
  if valor2 = 'Sa�da sempre bloqueada' then
    dado2 := $10;
  if valor2 = 'Sa�da sempre livre' then
    dado2 := $20;
  dado := IntToHex(dado1 or dado2, 2);
  Maxtool('0F', dado);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if PoolingAtivo then
    ParaPooling;
  Maxtool('49', '020114FFFF');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  if CheckBoxes then
    CheckBoxes := False
  else
    CheckBoxes := True;
  CheckBox1.Checked := CheckBoxes;
  CheckBox2.Checked := CheckBoxes;
  CheckBox3.Checked := CheckBoxes;
  CheckBox4.Checked := CheckBoxes;
  CheckBox5.Checked := CheckBoxes;
  CheckBox6.Checked := CheckBoxes;
  CheckBox7.Checked := CheckBoxes;
  CheckBox8.Checked := CheckBoxes;
  CheckBox9.Checked := CheckBoxes;
  CheckBox10.Checked := CheckBoxes;
  CheckBox11.Checked := CheckBoxes;
  CheckBox12.Checked := CheckBoxes;
  CheckBox13.Checked := CheckBoxes;
  CheckBox18.Checked := CheckBoxes;
  CheckBox25.Checked := CheckBoxes;
  CheckBox23.Checked := CheckBoxes;
  CheckBox27.Checked := CheckBoxes;
  CheckBox26.Checked := CheckBoxes;
  CheckBox24.Checked := CheckBoxes;
  CheckBox42.Checked := CheckBoxes;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  MaxTool('13', '04');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.MostraValorDosInputs(Valor: String);
var
  byte_entradas : String;
  i : Integer;
begin

  byte_entradas := copy(valor,1,2);

  i := HexToInt(byte_entradas) and $01;
  if i= 0 then
    Label20.caption := 'IN EXP 5 = 0'
  else
    Label20.caption := 'IN EXP 5 = 1';

  i := HexToInt(byte_entradas) and $02;
  if i= 0 then
    Label19.caption := 'IN EXP 6 = 0'
  else
    Label19.caption := 'IN EXP 6 = 1';

  byte_entradas := copy(valor,3,2);

  i := HexToInt(byte_entradas) and $01;
  if i= 0 then
    Label72.caption := 'IN 1 = 0'
  else
    Label72.caption := 'IN 1 = 1';

  i := HexToInt(byte_entradas) and $02;
  if i= 0 then
    Label71.caption := 'IN 2 = 0'
  else
    Label71.caption := 'IN 2 = 1';

  i := HexToInt(byte_entradas) and $04;
  if i= 0 then
    Label26.caption := 'IN 3 = 0'
  else
    Label26.caption := 'IN 3 = 1';

  i := HexToInt(byte_entradas) and $08;
  if i= 0 then
    Label25.caption := 'IN 4 = 0'
  else
    Label25.caption := 'IN 4 = 1';

  i := HexToInt(byte_entradas) and $10;
  if i= 0 then
    Label24.caption := 'IN EXP 1 = 0'
  else
    Label24.caption := 'IN EXP 1 = 1';

  i := HexToInt(byte_entradas) and $20;
  if i= 0 then
    Label23.caption := 'IN EXP 2 = 0'
  else
    Label23.caption := 'IN EXP 2 = 1';

  i := HexToInt(byte_entradas) and $40;
  if i= 0 then
    Label22.caption := 'IN EXP 3 = 0'
  else
    Label22.caption := 'IN EXP 3 = 1';

  i := HexToInt(byte_entradas) and $80;
  if i= 0 then
    Label21.caption := 'IN EXP 4 = 0'
  else
    Label21.caption := 'IN EXP 4 = 1';

  byte_entradas := copy(valor,5,2);

  i := HexToInt(byte_entradas) and $04;
  if i= 0 then
    Label76.caption := 'Sa�da BZ L1 = 0'
  else
    Label76.caption := 'Sa�da BZ L1 = 1';

  i := HexToInt(byte_entradas) and $08;
  if i= 0 then
    Label77.caption := 'Sa�da BZ L2 = 0'
  else
    Label77.caption := 'Sa�da BZ L2 = 1';

  i := HexToInt(byte_entradas) and $10;
  if i= 0 then
    Label78.caption := 'Sa�da BZ L3 = 0'
  else
    Label78.caption := 'Sa�da BZ L3 = 1';

  i := HexToInt(byte_entradas) and $20;
  if i= 0 then
    Label73.caption := 'Sa�da EXP1 = 0'
  else
    Label73.caption := 'Sa�da EXP1 = 1';

  i := HexToInt(byte_entradas) and $40;
  if i= 0 then
    Label74.caption := 'Sa�da EXP2 = 0'
  else
    Label74.caption := 'Sa�da EXP2 = 1';

  i := HexToInt(byte_entradas) and $80;
  if i= 0 then
    Label75.caption := 'Sa�da EXP3 = 0'
  else
    Label75.caption := 'Sa�da EXP3 = 1';


  byte_entradas := copy(valor,7,2);

  i := HexToInt(byte_entradas) and $01;
  if i= 0 then
    Label83.caption := 'Sa�da 1 = 0'
  else
    Label83.caption := 'Sa�da 1 = 1';

  i := HexToInt(byte_entradas) and $02;
  if i= 0 then
    Label84.caption := 'Sa�da 2 = 0'
  else
    Label84.caption := 'Sa�da 2 = 1';

  i := HexToInt(byte_entradas) and $04;
  if i= 0 then
    Label85.caption := 'Sa�da 3 = 0'
  else
    Label85.caption := 'Sa�da 3 = 1';

  i := HexToInt(byte_entradas) and $08;
  if i= 0 then
    Label86.caption := 'Sa�da 4 = 0'
  else
    Label86.caption := 'Sa�da 4 = 1';

  i := HexToInt(byte_entradas) and $10;
  if i= 0 then
    Label80.caption := 'Sa�da PICTO 1 = 0'
  else
    Label80.caption := 'Sa�da PICTO 1 = 1';

  i := HexToInt(byte_entradas) and $20;
  if i= 0 then
    Label81.caption := 'Sa�da PICTO 2 = 0'
  else
    Label81.caption := 'Sa�da PICTO 2 = 1';

  i := HexToInt(byte_entradas) and $40;
  if i= 0 then
    Label82.caption := 'Sa�da PICTO 3 = 0'
  else
    Label82.caption := 'Sa�da PICTO 3 = 1';

  i := HexToInt(byte_entradas) and $80;
  if i= 0 then
    Label79.caption := 'Sa�da PICTO 4 = 0'
  else
    Label79.caption := 'Sa�da PICTO 4 = 1';

 end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
  Maxtool('25', '01080000');
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  confirmacao : Integer;
begin
  confirmacao := 0;
  if PoolingAtivo then
    ParaPooling;
  Checkbox15.Font.Color := clBlack;
  Checkbox16.Font.Color := clBlack;
  Checkbox17.Font.Color := clBlack;


  if Checkbox15.Checked then
    begin
    Muda_PORTA_host;
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
    begin
      Inc(confirmacao);
      Checkbox15.Font.Color := clBlue;
    end
    else
      Checkbox15.Font.Color := clRed;
    end;

  if Checkbox16.Checked then
    begin
    Muda_IP_Gateway;
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
    begin
      Inc(confirmacao);
      Checkbox16.Font.Color := clBlue;
    end
    else
      Checkbox16.Font.Color := clRed;
    end;

  if Checkbox17.Checked then
    begin
    Muda_Mascara;
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
    begin
      Inc(confirmacao);
      Checkbox17.Font.Color := clBlue;
    end
    else
      Checkbox17.Font.Color := clRed;
    end;

    if confirmacao < 3 then
      begin
      MaxTool('0E', '07');
      Aviso.ShowModal;
      end;

    if confirmacao = 3 then
    begin
      MaxTool('0E', '07');
      Application.ProcessMessages;
      Aviso.ShowModal;
      aviso.Destroy;
      Application.ProcessMessages;
      Edit30.Text := Edit20.Text;
      ConectaSocketServer;
    end;

end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  if CheckBoxes2 then
    CheckBoxes2 := False
  else
    CheckBoxes2 := True;
  CheckBox15.Checked := CheckBoxes2;
  CheckBox16.Checked := CheckBoxes2;
  CheckBox17.Checked := CheckBoxes2;
end;

procedure TForm1.SpeedButton1Click0(Sender: TObject);
begin
  if ((Edit5.Text = '') or (Edit6.Text = '') or (Edit7.Text = '') or (Edit8.Text = '')) then
    begin
      ShowMessage('Aten��o ! Todos os campos dever�o ser preenchidos');
      Exit;
    end;
  if Confirma('Deseja alterar o IP da controladora ?') then
    begin
    MudaIP;
    novo_ip_para_comunicar;
    Form1.caption := descr_soft + ip_utrmvnet + ' -> *****]';
    StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
          ' (' + edit30.text + ') <-> ' + ip_cli;
    label61.Caption := ip_cli;
    label45.Caption := meu_ip;
    label55.Caption := meu_ip;
    label47.Caption := meu_host;
    end;
end;

procedure TForm1.Edit53Exit(Sender: TObject);
begin
  Edit53.Text := CompletaComZeros(Edit53.Text, 8);
end;

procedure TForm1.Edit53Change(Sender: TObject);
begin
  Edit53.text := CorrigeSeTemAlgumaLetra(Edit53.Text);
  if (length(Edit53.text) = 8) then
    Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
  Edit5.text := CorrigeSeTemAlgumaLetra_2(Edit5.Text);
  if (length(Edit5.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit6Change(Sender: TObject);
begin
  Edit6.text := CorrigeSeTemAlgumaLetra_2(Edit6.Text);
  if (length(Edit6.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit7Change(Sender: TObject);
begin
  Edit7.text := CorrigeSeTemAlgumaLetra_2(Edit7.Text);
  if (length(Edit7.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit8Change(Sender: TObject);
begin
  Edit8.text := CorrigeSeTemAlgumaLetra_2(Edit8.Text);
  if (length(Edit8.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Edit1.text := CorrigeSeTemAlgumaLetra_2(Edit1.Text);
  if (length(Edit1.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
  Edit1.Color := clWindow;
  Edit3.Color := clWindow;
  Edit18.Color := clWindow;
  Edit19.Color := clWindow;
  Edit1.Font.Color := clWindowText;
  Edit3.Font.Color := clWindowText;
  Edit18.Font.Color := clWindowText;
  Edit19.Font.Color := clWindowText;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
  Edit3.text := CorrigeSeTemAlgumaLetra_2(Edit3.Text);
  if (length(Edit3.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
  Edit1.Color := clWindow;
  Edit3.Color := clWindow;
  Edit18.Color := clWindow;
  Edit19.Color := clWindow;
  Edit1.Font.Color := clWindowText;
  Edit3.Font.Color := clWindowText;
  Edit18.Font.Color := clWindowText;
  Edit19.Font.Color := clWindowText;
end;

procedure TForm1.Edit18Change(Sender: TObject);
begin
  Edit18.text := CorrigeSeTemAlgumaLetra_2(Edit18.Text);
  if (length(Edit18.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
  Edit1.Color := clWindow;
  Edit3.Color := clWindow;
  Edit18.Color := clWindow;
  Edit19.Color := clWindow;
  Edit1.Font.Color := clWindowText;
  Edit3.Font.Color := clWindowText;
  Edit18.Font.Color := clWindowText;
  Edit19.Font.Color := clWindowText;
end;

procedure TForm1.Edit19Change(Sender: TObject);
begin
  Edit19.text := CorrigeSeTemAlgumaLetra_2(Edit19.Text);
  if (length(Edit19.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
  Edit1.Color := clWindow;
  Edit3.Color := clWindow;
  Edit18.Color := clWindow;
  Edit19.Color := clWindow;
  Edit1.Font.Color := clWindowText;
  Edit3.Font.Color := clWindowText;
  Edit18.Font.Color := clWindowText;
  Edit19.Font.Color := clWindowText;
end;

procedure TForm1.Edit20Change(Sender: TObject);
begin
  Edit20.text := CorrigeSeTemAlgumaLetra(Edit20.Text);
  if (length(Edit20.text) = 5) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  Edit2.text := CorrigeSeTemAlgumaLetra_2(Edit2.Text);
  if (length(Edit2.text) = 3) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit21Change(Sender: TObject);
begin
  Edit21.text := CorrigeSeTemAlgumaLetra_2(Edit21.Text);
  if (length(Edit21.text) = 3) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit22Change(Sender: TObject);
begin
  Edit22.text := CorrigeSeTemAlgumaLetra_2(Edit22.Text);
  if (length(Edit22.text) = 3) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit23Change(Sender: TObject);
begin
  Edit23.text := CorrigeSeTemAlgumaLetra_2(Edit23.Text);
  if (length(Edit23.text) = 3) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit24Change(Sender: TObject);
begin
  Edit24.text := CorrigeSeTemAlgumaLetra_2(Edit24.Text);
  if (length(Edit24.text) = 3) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit25Change(Sender: TObject);
begin
  Edit25.text := CorrigeSeTemAlgumaLetra_2(Edit25.Text);
  if (length(Edit25.text) = 3) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit26Change(Sender: TObject);
begin
  Edit26.text := CorrigeSeTemAlgumaLetra_2(Edit26.Text);
  if (length(Edit26.text) = 3) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit27Change(Sender: TObject);
begin
  Edit27.text := CorrigeSeTemAlgumaLetra_2(Edit27.Text);
  if (length(Edit27.text) = 3) then
  Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  if PoolingAtivo then
    ParaPooling;
  if Confirma('Deseja eliminar todos os registros de eventos ?') then
    begin
    MaxTool('0E', '04');
    DelayResposta(ComboBox9.text);
    end;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
  if PoolingAtivo then
    ParaPooling;
  MaxTool('0E', '0A');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
  if PoolingAtivo then
    ParaPooling;
  EnviaConfirmRecReg;
end;

procedure TForm1.EnviaConfirmRecReg;
begin
  Maxtool('03', '00000000' + cartao_evento);
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Maxtool('06', '0A0A03');
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TesteLCD('ABCDEFGHIJKLMNOPabcdefghijklmnop');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.TesteLCD(q_String : String);
var
  i : Integer;
  valor : String;
begin
  valor := q_String;
  Frame_Data := '';
  for i:= 1 to 32 do
    Frame_Data := Frame_Data + IntToHex(ord(valor[i]), 2);
  Frame_Data := Frame_Data + '00' + '08';
  MaxTool ('05', Frame_Data);
end;

procedure TForm1.BitBtn13Click(Sender: TObject);
begin
  Maxtool('0B', '02');
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.Edit54Change(Sender: TObject);
begin
  Edit54.text := HexaCorrigeSeTemAlgumaLetra(Edit54.Text);
  if (length(Edit54.text) = 2) then
    Perform (WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.Edit55Change(Sender: TObject);
begin
  Edit55.text := HexaCorrigeSeTemAlgumaLetra(Edit55.Text);
end;

procedure TForm1.Maxtool(Cmd, Dados : String);
begin
  EnviaComandoUDP(ip_cli, '01', Cmd, Dados, False);
end;

procedure TForm1.BitBtn14Click(Sender: TObject);
begin
  BitBtn14.Enabled := False;
  if Edit54.Text <> '4F' then Maxtool(Edit54.text, Edit55.text)
    else EnviaComandoUDP(ip_cli, '01', Edit54.text, Edit55.Text, True);
  DelayResposta(ComboBox9.text);
  BitBtn14.Enabled := True;
end;


procedure TForm1.InsereAtualizaCartao(q_opcao : Char);
var
  dados : String;
  bctrl1, bctrl2 : byte;
begin
  bctrl1 := $00;
  bctrl2 := $00;
  dados := '00000000' + CompletaComZeros(Edit53.Text, 8);
  //monta byte de controle 1
  if (ComboBox10.Text = 'Visitante') then
    bctrl1 := bctrl1 or $80;
  if (ComboBox11.Text = 'Bloqueado') then
    bctrl1 := bctrl1 or $40;
  if (ComboBox13.Text = 'Bloqueado') then
    bctrl1 := bctrl1 or $20;
  if (ComboBox20.Text = 'Habilitado') then
    bctrl1 := bctrl1 or $10;
  if (ComboBox14.Text = 'Liberado') then
    bctrl1 := bctrl1 or $08;
  if (ComboBox15.Text = 'Liberado') then
    bctrl1 := bctrl1 or $04;
  if (ComboBox16.Text = 'Liberado') then
    bctrl1 := bctrl1 or $02;
  if (ComboBox17.Text = 'Liberado') then
    bctrl1 := bctrl1 or $01;

  //monta byte de controle 2
  if (ComboBox12.Text = 'Habilitado') then
    bctrl2 := bctrl2 or $02;
  if (ComboBox21.Text = 'Habilitado') then
    bctrl2 := bctrl2 or $01;
  dados :=  dados + IntToHex(bctrl1, 2) + IntToHex(bctrl2, 2) + '00';
  if (q_opcao = 'I') then
    Maxtool('08', dados);
  if (q_opcao = 'A') then
    Maxtool('0A', dados);
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
  InsereAtualizaCartao('I');
  DelayResposta(ComboBox9.text);
  if Ok_Simples then
    ShowInforma('Cart�o CADASTRADO COM SUCESSO na controladora !')
  else
    if Resp_Erro then
      begin
      if Resp_Erro_dados = 2 then
      ShowAlerta('Este cart�o J� EXISTE na controladora !');
      if Resp_Erro_dados = 7 then
      ShowAlerta('Mem�ria Cheia !');
      if Resp_Erro_dados = 4 then
      ShowAlerta('Cart�o N�O EXISTE na mem�ria !');
      end
    else
      ShowAlerta('Controladora N�O RESPONDEU, tente novamente !');
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
  InsereAtualizaCartao('A');
  DelayResposta(ComboBox9.text);
  if Ok_Simples then
    ShowInforma('Cart�o ALTERADO COM SUCESSO na controladora !')
  else
    if Resp_Erro then
      ShowAlerta('Este cart�o N�O EXISTE na controladora !')
    else
      ShowAlerta('Controladora N�O RESPONDEU, tente novamente !');
end;

procedure TForm1.BitBtn15Click(Sender: TObject);
var
  str_buffer: String;
  indice, indice2, indice3, tot_cartoes : Integer;
  F: TextFile;
  em_lote : Boolean;
  lista: array[1..10000] of String;
begin
  if PoolingAtivo then
    ParaPooling;
  OpenDialog1.Execute;
  AssignFile(F, OpenDialog1.FileName);
  Reset(F);
  indice := 1;
  indice2 := 1;
  indice3 := 1;
  try
    if Confirma('Deseja enviar os cart�es em lote ?') then
      begin
        em_lote := True;
        while not EOF(F) do
          begin
          ReadLn(F, str_buffer);
          if length(str_buffer)=22 then
            begin
            Inc(indice);
            lista[indice3] := lista[indice3] + str_buffer;
            if indice2 = 100 then
              begin
              Inc(indice3);
              indice2 := 1;
              end
                else inc(indice2);
            end;
          end;
        end
        else
          begin
            em_lote := False;
            while not EOF(F) do
              begin
              ReadLn(F, str_buffer);
              if length(str_buffer)=22 then
                begin
                lista[indice] := str_buffer;
                Inc(indice);
                end;
              end;
          end;

  CloseFile(F);
  if em_lote then tot_cartoes := (indice3 - 1) else tot_cartoes := indice - 1;
  if em_lote and ((indice - 1) - ((indice3 - 1)*100) > 1) then
    Inc(tot_cartoes);
  if Confirma('Deseja enviar ' + IntToStr(indice - 1) + ' cart�es para a controladora ?') then
    begin
    if Confirma('Deseja eliminar todos os cart�es da controladora antes de enviar a lista ?') then
      repeat
      Maxtool('0E', '05');
      DelayResposta(ComboBox9.text);
      meu_sleep(100);
      until not Ocorreu_TimeOut;
    ProgressBar1.Min := 0;
    ProgressBar1.Position := ProgressBar1.Min;
    ProgressBar1.Max := tot_cartoes;
    Label41.Caption := '0/' + IntToStr(tot_cartoes);
    Label41.Visible := True;
    ProgressBar1.Visible := true;
    Ocorreu_TimeOut := False;
    indice := 0;
      repeat
      if not Ocorreu_TimeOut then
        inc(indice);
      ProgressBar1.Position := indice;
      Label41.Caption := IntToStr(indice) + '/' + IntToStr(tot_cartoes);
      if em_lote then
      EnviaComandoUDP(ip_cli, '01', '09', lista[indice], True)
        else Maxtool('08', lista[indice]);
      DelayResposta(ComboBox9.text);
      if Resp_Erro then
        begin
        if Resp_Erro_dados = 0 then
        begin
        ShowErro('Fun��o n�o dispon�vel para esta vers�o de Firmware !');
        break;
        end;
        if Resp_Erro_dados = 1 then
        ShowAlerta('Erro na mem�ria da placa !');
        if Resp_Erro_dados = 35 then
        ShowAlerta('Lote n�o est� ordenado ou h� cart�es repetidos !');
        if Resp_Erro_dados = 36 then
        ShowAlerta('Erro de sequ�ncia (ultimo cart�o j� cadastrado � maior que o primeiro cart�o do lote) !');
        if Resp_Erro_dados = 37 then
        ShowAlerta('Menos de 2 cart�es OU mais de 100 cart�es no lote !');
        if Resp_Erro_dados = 38 then
        ShowAlerta('Lote mal formado');
        if Resp_Erro_dados = 39 then
        ShowAlerta('O lote n�o cabe na tabela !');
        end;
      if Interromper then
        if Confirma('Deseja interromper o envio da lista de cart�es ?') then
          break;
      until (indice = tot_cartoes)
    end;
  ProgressBar1.Visible := False;
  Label41.Visible := False;
  except
  CloseFile(F);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  MaxTool('0E', '07');
end;

procedure TForm1.Label5DblClick(Sender: TObject);
begin
  Edit1.Text := '255';
  Edit3.Text := '255';
  Edit18.Text := '255';
  Edit19.Text := '255';
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  key := #0;
  Perform (WM_NEXTDLGCTL,0,0);
  end;
if (key = #27) then
  begin
  key := #0;
  Interromper := True;
  end;
end;

procedure TForm1.WSocketClientSessionConnected(Sender: TObject; ErrCode: Word);
begin
   SocketClientConectado := True;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  novo_ip_para_comunicar;
  Form1.caption := descr_soft + ip_utrmvnet + ' -> *****]';
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;

  Maxtool('06', '0A0A03'); //Envia Bip

  if Confirma('A Placa Apitou?') then
    Begin
    TabSheet3.Show;
    End;


end;

procedure TForm1.WSocketServerDataAvailable(Sender: TObject; ErrCode: Word);
var
  buffer : array [0..1023] of char;
  len, i : Integer;
  Src    : TSockAddrIn;
  SrcLen : Integer;
  str_RX : String;
begin
  SrcLen := SizeOf(Src);
  len := WSocketServer.ReceiveFrom(@Buffer, SizeOf(Buffer), Src, SrcLen);
  if StrPas(inet_ntoa(Src.sin_addr)) = ip_utrmvnet then
    begin
     TimerTOut1.Enabled := False;
  if len >= 0 then
    begin
    str_RX := '';
    for i := 0 to len-1 do
      str_RX := str_RX + IntToHex(ord(buffer[i]), 2);
    Label1.Caption := str_RX + ' (' +
          StrPas(inet_ntoa(Src.sin_addr)) + ')';
    LogCom.Memo1.Lines.Add('RX: ' + Label1.Caption);

    //tratamento template nitgen
    if Copy(str_RX, 1, 10) = '5AA5000192' then
    begin
      Memo4.Lines.Clear;
      Memo4.Lines.Add('Template recebido com sucesso.');
      Memo4.Lines.Add('Qual Leitora: ' + IntToStr(HexToInt(Copy(str_RX, 11, 2))));
      Memo4.Lines.Add('Template: ' + Copy(str_RX, 17, 808));
      if CheckBox40.Checked then Edit14.Text := Copy(str_RX, 17, 808);
      ComboBox51.ItemIndex := HexToInt(Copy(str_RX, 11, 2))-1;
    end;

    //tratamento template virdi
    if (Copy(str_RX, 1, 10) = '5AA5000193') then
      begin
      if (len = 429) then
        begin
        Memo5.Lines.Clear;
        Memo5.Lines.Add('Template recebido com sucesso.');
        Memo5.Lines.Add('Qual Leitora: ' + IntToStr(HexToInt(Copy(str_RX, 11, 2))));
        Memo5.Lines.add('Template: ' + Copy(str_RX, 53, 800));
        if CheckBox41.Checked then Edit15.Text := Copy(str_RX, 53, 800);
        ComboBox52.ItemIndex := HexToInt(Copy(str_RX, 11, 2))-1;
        end
      end;


    end;
   str_RX := '';
   for i:= 0 to len-1 do
     str_RX := str_RX + IntToHex(Criptografia((Ord(buffer[i])), chave_1, chave_2), 2);
   TrataRX(str_RX, StrPas(inet_ntoa(Src.sin_addr)));
   Inc(n_pacotes_RX);
   AtualizaTXRX;
   if PoolingAtivo and OK_Ordenado then
     TimerPooling.Enabled := True;
   end;
end;

procedure TForm1.AtualizaTXRX;
begin
  StatusBar1.Panels[2].Text := ' TX: ' + IntToStr(n_pacotes_TX) +
               '   /   RX: ' + IntToStr(n_pacotes_RX);
end;

procedure TForm1.SalvaRegistro;
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  if Reg.KeyExists('\Software\Maxtel\IPMaxtool_IAC500') = True then
    try
    Reg.OpenKey('\Software\Maxtel\IPMaxtool_IAC500', False);
    Reg.WriteString('Porta_Local', Edit30.Text);
    Reg.WriteString('Porta_Servidor', Edit20.Text);
    Reg.WriteString('Delay', ComboBox9.Text);
    Reg.WriteString('IP_SERVIDOR', Label45.Caption);
    Reg.WriteString('IP_UTRM', IntToHex(StrToInt(Edit1.Text),2) +
                   IntToHex(StrToInt(Edit3.Text),2) +
                   IntToHex(StrToInt(Edit18.Text),2) +
                   IntToHex(StrToInt(Edit19.Text),2));
    Reg.WriteString('Gateway', IntToHex(StrToInt(Edit2.Text),2) +
                   IntToHex(StrToInt(Edit21.Text),2) +
                   IntToHex(StrToInt(Edit22.Text),2) +
                   IntToHex(StrToInt(Edit23.Text),2));
    Reg.WriteString('Mascara', IntToHex(StrToInt(Edit24.Text),2) +
                   IntToHex(StrToInt(Edit25.Text),2) +
                   IntToHex(StrToInt(Edit26.Text),2) +
                   IntToHex(StrToInt(Edit27.Text),2));

    Reg.WriteString('MsgInic', Edit28.Text);
    Reg.WriteString('Leitora_1', ComboBox5.Text);
    Reg.WriteString('Leitora_2', ComboBox22.Text);
    Reg.WriteString('Aplicativo', ComboBox3.Text);
    Reg.WriteString('CfgPorta', ComboBox7.Text);
    Reg.WriteString('CfgFluxoCatraca_1', ComboBox18.Text);
    Reg.WriteString('CfgFluxoCatraca_2', ComboBox19.Text);
    Reg.WriteString('PosicCatraca', ComboBox2.Text);
    Reg.WriteString('TOutEnvioEventos', ComboBox8.Text);
    Reg.WriteString('TempoAntiPassback', ComboBox1.Text);
    Reg.WriteString('TempoPassagem', ComboBox4.Text);
    Reg.WriteString('TempoAcionamPorta', ComboBox6.Text);
    Reg.WriteString('TempoMisto', ComboBox23.Text);
    Reg.WriteString('Modo', ComboBox24.Text);
    Reg.WriteString('Dispositivo_Serial_L1', ComboBox25.Text);
    Reg.WriteString('Baud_Rate_Serial_L1', ComboBox26.Text);
    Reg.WriteString('Data_Bits_Serial_L1', ComboBox27.Text);
    Reg.WriteString('Paridade_Serial_L1', ComboBox28.Text);
    Reg.WriteString('Stop_Bits_Serial_L1', ComboBox29.Text);
    Reg.WriteString('Dispositivo_Serial_L2', ComboBox30.Text);
    Reg.WriteString('Baud_Rate_Serial_L2', ComboBox31.Text);
    Reg.WriteString('Data_Bits_Serial_L2', ComboBox32.Text);
    Reg.WriteString('Paridade_Serial_L2', ComboBox33.Text);
    Reg.WriteString('Stop_Bits_Serial_L2', ComboBox34.Text);
    Reg.WriteString('Dispositivo_Serial_L3', ComboBox35.Text);
    Reg.WriteString('Baud_Rate_Serial_L3', ComboBox36.Text);
    Reg.WriteString('Data_Bits_Serial_L3', ComboBox37.Text);
    Reg.WriteString('Paridade_Serial_L3', ComboBox38.Text);
    Reg.WriteString('Stop_Bits_Serial_L3', ComboBox39.Text);
    Reg.WriteString('Modo_Teclado', IntToStr(ComboBox83.ItemIndex));
    Reg.WriteString('Limite_Teclado', IntToStr(ComboBox101.ItemIndex));
    Reg.WriteString('FCC_Teclado', Edit29.Text);

    if CheckBox15.Checked then Reg.WriteInteger('chkbox_Porta_Servidor', 1) else
      Reg.WriteInteger('chkbox_Porta_Servidor', 0);
    if CheckBox16.Checked then Reg.WriteInteger('chkbox_Gateway', 1) else
      Reg.WriteInteger('chkbox_Gateway', 0);
    if CheckBox17.Checked then Reg.WriteInteger('chkbox_Mascara', 1) else
      Reg.WriteInteger('chkbox_Mascara', 0);
    if CheckBox1.Checked then Reg.WriteInteger('chkbox_DataHora', 1) else
      Reg.WriteInteger('chkbox_DataHora', 0);
    if CheckBox3.Checked then Reg.WriteInteger('chkbox_MsgInic', 1) else
      Reg.WriteInteger('chkbox_MsgInic', 0);
    if CheckBox7.Checked then Reg.WriteInteger('chkbox_Leitoras', 1) else
      Reg.WriteInteger('chkbox_Leitoras', 0);
    if CheckBox5.Checked then Reg.WriteInteger('chkbox_Aplicativo', 1) else
      Reg.WriteInteger('chkbox_Aplicativo', 0);
    if CheckBox9.Checked then Reg.WriteInteger('chkbox_CfgPorta', 1) else
      Reg.WriteInteger('chkbox_CfgPorta', 0);
    if CheckBox11.Checked then Reg.WriteInteger('chkbox_CfgFluxoCatraca', 1) else
      Reg.WriteInteger('chkbox_CfgFluxoCatraca', 0);
    if CheckBox4.Checked then Reg.WriteInteger('chkbox_PosicCatraca', 1) else
      Reg.WriteInteger('chkbox_PosicCatraca', 0);
    if CheckBox10.Checked then Reg.WriteInteger('chkbox_TOutEnvioEventos', 1) else
      Reg.WriteInteger('chkbox_TOutEnvioEventos', 0);
    if CheckBox2.Checked then Reg.WriteInteger('chkbox_TempoAntiPassback', 1) else
      Reg.WriteInteger('chkbox_TempoAntiPassback', 0);
    if CheckBox6.Checked then Reg.WriteInteger('chkbox_TempoPassagem', 1) else
      Reg.WriteInteger('chkbox_TempoPassagem', 0);
    if CheckBox8.Checked then Reg.WriteInteger('chkbox_TempoAcionamPorta', 1) else
      Reg.WriteInteger('chkbox_TempoAcionamPorta', 0);
    if CheckBox12.Checked then Reg.WriteInteger('chkbox_Modo', 1) else
      Reg.WriteInteger('chkbox_Modo', 0);
    if CheckBox13.Checked then Reg.WriteInteger('chkbox_TempoMisto', 1) else
      Reg.WriteInteger('chkbox_TempoMisto', 0);
    if CheckBox18.Checked then Reg.WriteInteger('chkbox_Leitoras_Seriais', 1) else
      Reg.WriteInteger('chkbox_Leitoras_Seriais', 0);
    if CheckBox42.Checked then Reg.WriteInteger('chkbox_Teclado', 1) else
      Reg.WriteInteger('chkbox_Teclado', 0);

    except
    CriaRegistro;
    end
  else
    CriaRegistro;
end;

procedure TForm1.LeRegistro;
var
  Reg : TRegistry;
  IP_UTRM, IP_Servidor, Gateway, Mascara : String;

begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  if Reg.KeyExists('\Software\Maxtel\IPMaxtool_IAC500') = True then
    try
    Reg.OpenKey('\Software\Maxtel\IPMaxtool_IAC500', False);
    IP_UTRM := Reg.ReadString('IP_UTRM');
    IP_Servidor := Reg.ReadString('IP_Servidor');
    Gateway := Reg.ReadString('Gateway');
    Mascara := Reg.ReadString('Mascara');

    //Define Edit's e ComboBox'es
    Edit28.Text := Reg.ReadString('MsgInic');
    ComboBox9.Text := Reg.ReadString('Delay');
    ComboBox5.Text := Reg.ReadString('Leitora_1');
    ComboBox22.Text := Reg.ReadString('Leitora_2');
    ComboBox3.Text := Reg.ReadString('Aplicativo');
    ComboBox7.Text := Reg.ReadString('CfgPorta');
    ComboBox18.Text := Reg.ReadString('CfgFluxoCatraca_1');
    ComboBox19.Text := Reg.ReadString('CfgFluxoCatraca_2');
    ComboBox2.Text := Reg.ReadString('PosicCatraca');
    ComboBox8.Text := Reg.ReadString('TOutEnvioEventos');
    ComboBox1.Text := Reg.ReadString('TempoAntiPassback');
    ComboBox4.Text := Reg.ReadString('TempoPassagem');
    ComboBox6.Text := Reg.ReadString('TempoAcionamPorta');
    ComboBox23.Text := Reg.ReadString('TempoMisto');
    ComboBox24.Text := Reg.ReadString('Modo');
    ComboBox25.Text := Reg.ReadString('Dispositivo_Serial_L1');
    ComboBox26.Text := Reg.ReadString('Baud_Rate_Serial_L1');
    ComboBox27.Text := Reg.ReadString('Data_Bits_Serial_L1');
    ComboBox28.Text := Reg.ReadString('Paridade_Serial_L1');
    ComboBox29.Text := Reg.ReadString('Stop_Bits_Serial_L1');
    ComboBox30.Text := Reg.ReadString('Dispositivo_Serial_L2');
    ComboBox31.Text := Reg.ReadString('Baud_Rate_Serial_L2');
    ComboBox32.Text := Reg.ReadString('Data_Bits_Serial_L2');
    ComboBox33.Text := Reg.ReadString('Paridade_Serial_L2');
    ComboBox34.Text := Reg.ReadString('Stop_Bits_Serial_L2');
    ComboBox35.Text := Reg.ReadString('Dispositivo_Serial_L3');
    ComboBox36.Text := Reg.ReadString('Baud_Rate_Serial_L3');
    ComboBox37.Text := Reg.ReadString('Data_Bits_Serial_L3');
    ComboBox38.Text := Reg.ReadString('Paridade_Serial_L3');
    ComboBox39.Text := Reg.ReadString('Stop_Bits_Serial_L3');
    ComboBox83.ItemIndex := StrToInt(Reg.ReadString('Modo_Teclado'));
    ComboBox101.ItemIndex := StrToInt(Reg.ReadString('Limite_Teclado'));
    Edit29.Text := Reg.ReadString('FCC_Teclado');

    //Define Checkbox'es
    if Reg.ReadInteger('chkbox_Porta_Servidor') = 0 then CheckBox15.Checked := False
      else CheckBox15.Checked := True;
    if Reg.ReadInteger('chkbox_Gateway') = 0 then CheckBox16.Checked := False
      else CheckBox16.Checked := True;
    if Reg.ReadInteger('chkbox_Mascara') = 0 then CheckBox17.Checked := False
      else CheckBox17.Checked := True;
    if Reg.ReadInteger('chkbox_DataHora') = 0 then CheckBox1.Checked := False
      else CheckBox1.Checked := True;
    if Reg.ReadInteger('chkbox_MsgInic') = 0 then CheckBox3.Checked := False
      else CheckBox3.Checked := True;
    if Reg.ReadInteger('chkbox_Leitoras') = 0 then CheckBox7.Checked := False
      else CheckBox7.Checked := True;
    if Reg.ReadInteger('chkbox_Aplicativo') = 0 then CheckBox5.Checked := False
      else CheckBox5.Checked := True;
    if Reg.ReadInteger('chkbox_CfgPorta') = 0 then CheckBox9.Checked := False
      else CheckBox9.Checked := True;
    if Reg.ReadInteger('chkbox_CfgFluxoCatraca') = 0 then CheckBox11.Checked := False
      else CheckBox11.Checked := True;
    if Reg.ReadInteger('chkbox_PosicCatraca') = 0 then CheckBox4.Checked := False
      else CheckBox4.Checked := True;
    if Reg.ReadInteger('chkbox_TOutEnvioEventos') = 0 then CheckBox10.Checked := False
      else CheckBox10.Checked := True;
    if Reg.ReadInteger('chkbox_TempoAntiPassback') = 0 then CheckBox2.Checked := False
      else CheckBox2.Checked := True;
    if Reg.ReadInteger('chkbox_TempoPassagem') = 0 then CheckBox6.Checked := False
      else CheckBox6.Checked := True;
    if Reg.ReadInteger('chkbox_TempoAcionamPorta') = 0 then CheckBox8.Checked := False
      else CheckBox8.Checked := True;
    if Reg.ReadInteger('chkbox_Modo') = 0 then CheckBox12.Checked := False
      else CheckBox12.Checked := True;
    if Reg.ReadInteger('chkbox_TempoMisto') = 0 then CheckBox13.Checked := False
      else CheckBox13.Checked := True;
    if Reg.ReadInteger('chkbox_Leitoras_Seriais') = 0 then CheckBox18.Checked := False
      else CheckBox18.Checked := True;
    if Reg.ReadInteger('chkbox_Teclado') = 0 then CheckBox42.Checked := False
      else CheckBox42.Checked := True;




    //Porta Local
    Edit30.Text := Reg.ReadString('Porta_Local');
    //Porta Servidor
    Edit20.Text := Reg.ReadString('Porta_Servidor');
    //IP IAC-500
    Edit1.Text := IntToStr(HexToInt(IP_UTRM[1] + IP_UTRM[2]));
    Edit3.Text := IntToStr(HexToInt(IP_UTRM[3] + IP_UTRM[4]));
    Edit18.Text := IntToStr(HexToInt(IP_UTRM[5] + IP_UTRM[6]));
    Edit19.Text := IntToStr(HexToInt(IP_UTRM[7] + IP_UTRM[8]));
    //Gateway
    Edit2.Text := IntToStr(HexToInt(Gateway[1] + Gateway[2]));
    Edit21.Text := IntToStr(HexToInt(Gateway[3] + Gateway[4]));
    Edit22.Text := IntToStr(HexToInt(Gateway[5] + Gateway[6]));
    Edit23.Text := IntToStr(HexToInt(Gateway[7] + Gateway[8]));
    //Mascara
    Edit24.Text := IntToStr(HexToInt(Mascara[1] + Mascara[2]));
    Edit25.Text := IntToStr(HexToInt(Mascara[3] + Mascara[4]));
    Edit26.Text := IntToStr(HexToInt(Mascara[5] + Mascara[6]));
    Edit27.Text := IntToStr(HexToInt(Mascara[7] + Mascara[8]));

    //IP Servidor
    Label45.Caption := IP_SERVIDOR;
    meu_ip := label45.Caption;
    
    if Reg.ReadInteger('MostraMsgDeAviso') = 1 then MostraMsgDeAviso := True else
      MostraMsgDeAviso := False;

    Reg.Free;
    except
    CriaRegistro;
    end
  else
    CriaRegistro;
end;

procedure TForm1.CriaRegistro;
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('\Software\Maxtel\IPMaxtool_IAC500', True);
  Reg.WriteString('Delay', '500');
  Reg.WriteString('IP_Servidor', '192.168.0.1');
  Reg.WriteString('Porta_Local', '2552');
  Reg.WriteString('Porta_Servidor', '2552');
  Reg.WriteString('Gateway', 'C0A80001');
  Reg.WriteString('Mascara', 'FFFFFF00');
  Reg.WriteString('IP_UTRM', 'C0A800C8');
  Reg.WriteInteger('chkbox_Broadcast', 1);
  Reg.WriteInteger('chkbox_Porta_Servidor', 1);
  Reg.WriteInteger('chkbox_Gateway', 1);
  Reg.WriteInteger('chkbox_Mascara', 1);
  Reg.WriteInteger('chkbox_DataHora', 1);
  Reg.WriteInteger('chkbox_MsgInic', 1);
  Reg.WriteInteger('chkbox_Leitoras', 1);
  Reg.WriteInteger('chkbox_Leitoras_Seriais', 1);
  Reg.WriteInteger('chkbox_Aplicativo', 1);
  Reg.WriteInteger('chkbox_CfgPorta', 1);
  Reg.WriteInteger('chkbox_CfgFluxoCatraca', 1);
  Reg.WriteInteger('chkbox_PosicCatraca', 1);
  Reg.WriteInteger('chkbox_TOutEnvioEventos', 1);
  Reg.WriteInteger('chkbox_TempoAntiPassback', 1);
  Reg.WriteInteger('chkbox_TempoPassagem', 1);
  Reg.WriteInteger('chkbox_TempoAcionamPorta', 1);
  Reg.WriteInteger('chkbox_Modo', 1);
  Reg.WriteInteger('chkbox_TempoMisto', 1);
  Reg.WriteString('MsgInic', '**MAXTEL** ');
  Reg.WriteString('Leitora_1', 'Wiegand 26 bits');
  Reg.WriteString('Leitora_2', 'Wiegand 26 bits');
  Reg.WriteString('Aplicativo', 'Porta');
  Reg.WriteString('CfgPorta', '1 porta / L1 = Entrada / L2 = Sa�da');
  Reg.WriteString('CfgFluxoCatraca_1', 'Entrada com cart�o');
  Reg.WriteString('CfgFluxoCatraca_2', 'Sa�da com cart�o');
  Reg.WriteString('PosicCatraca', 'Direita');
  Reg.WriteString('TOutEnvioEventos', '5');
  Reg.WriteString('TempoAntiPassback', '3');
  Reg.WriteString('TempoPassagem', '5');
  Reg.WriteString('TempoAcionamPorta', '2');
  Reg.WriteInteger('MostraMsgDeAviso', 1);
  Reg.WriteInteger('TempoMisto', 1);
  Reg.WriteString('Modo', 'Off-Line');

  Reg.WriteString('Dispositivo_Serial_L1', 'Barras');
  Reg.WriteString('Baud_Rate_Serial_L1', '9600');
  Reg.WriteString('Data_Bits_Serial_L1', '8 bits');
  Reg.WriteString('Paridade_Serial_L1', 'Nula / None');
  Reg.WriteString('Stop_Bits_Serial_L1', '1 stop bit');

  Reg.WriteString('Dispositivo_Serial_L2', 'Barras');
  Reg.WriteString('Baud_Rate_Serial_L2', '9600');
  Reg.WriteString('Data_Bits_Serial_L2', '8 bits');
  Reg.WriteString('Paridade_Serial_L2', 'Nula / None');
  Reg.WriteString('Stop_Bits_Serial_L2', '1 stop bit');

  Reg.WriteString('Dispositivo_Serial_L3', 'HandKey');
  Reg.WriteString('Baud_Rate_Serial_L3', '9600');
  Reg.WriteString('Data_Bits_Serial_L3', '8 bits');
  Reg.WriteString('Paridade_Serial_L3', 'Nula / None');
  Reg.WriteString('Stop_Bits_Serial_L3', '1 stop bit');

  Reg.WriteString('Modo_Teclado', '0');
  Reg.WriteString('Limite_Teclado', '0');
  Reg.WriteString('FCC_Teclado', '');
  Reg.WriteInteger('chkbox_Teclado', 1);

  Reg.Free;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
  Maxtool('13', '07');
  DelayResposta(ComboBox9.text);
  if Resp_versao_firmware then
    begin
    ShowInforma('Quantidade de Cart�es Cadastrados  = ' + qtd_cartoes + #13 + #10 +
                'Capacidade de Cart�es = ' + qtd_capacidade_ordenada + #13 + #10 +
                'Quantidade de Cart�es Cadastrados Lista N�o Ordenada = ' + qtd_cartoes_desordenado + #13 + #10 +
                'Capacidade de Cart�es Lista N�o Ordenada = ' + qtd_capacidade_desordenada + #13 + #10 +
                'Quantidade de Eventos = ' + qtd_eventos + #13 + #10 +
                'Capacidade de Eventos = ' + qtd_capacidade_eventos + #13 + #10 +
                'Quantidade de Turnos = ' + qtd_turnos + #13 + #10 +
                'Capacidade de Turnos = ' + qtd_capacidade_turnos + #13 + #10 +
                'Quantidade de Feriados = ' + qtd_feriados + #13 + #10 +
                'Capacidade de Feriados = ' + qtd_capacidade_feriados);
    end else if OK_Simples then ShowErro('Fun��o n�o dispon�vel para esta vers�o de Firmware !')
                else if Resp_Erro then
                        begin
                        if Resp_Erro_dados = 1 then
                        ShowAlerta('Erro na mem�ria da placa !');
                        end;
end;


procedure TForm1.Edit30Exit(Sender: TObject);
begin
  if not ConectaSocketServer then
    ShowErro('N�o foi poss�vel iniciar socket servidor. Causa prov�vel : Porta UDP '+
      edit30.Text + ' indispon�vel !');
end;

procedure TForm1.ComboBox9Change(Sender: TObject);
begin
  ComboBox9.Text := CorrigeSeTemAlgumaLetra(ComboBox9.Text);
  if ComboBox9.Text = '' then
    ComboBox9.Text := '500';
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Maxtool('25', '00080000');
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  novo_ip_para_comunicar;
  Form1.caption := descr_soft + ip_utrmvnet + ' -> *****]';
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;
end;

procedure TForm1.Edit3Exit(Sender: TObject);
begin
  novo_ip_para_comunicar;
  Form1.caption := descr_soft + ip_utrmvnet + ' -> *****]';
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;
end;

procedure TForm1.Edit18Exit(Sender: TObject);
begin
  novo_ip_para_comunicar;
  Form1.caption := descr_soft + ip_utrmvnet + ' -> *****]';
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;
end;

procedure TForm1.Edit19Exit(Sender: TObject);
begin
  novo_ip_para_comunicar;
  Form1.caption := descr_soft + ip_utrmvnet + ' -> *****]';
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    try
      Ip_Servidor := TIp_servidor.Create(Application);
      Ip_servidor.ShowModal;
    finally
      Ip_servidor.Close;
      Ip_servidor.release;
      Ip_servidor := nil;
    end;
  novo_ip_para_comunicar;
  Form1.caption := descr_soft + ip_utrmvnet + ' -> *****]';
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Maxtool('13', '06');
  DelayResposta(ComboBox9.text);  
end;


procedure TForm1.LogCompletoComunicao1Click(Sender: TObject);
begin
  LogCom.Show;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
  Maxtool('40', '0305');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn12Click(Sender: TObject);
begin
  Maxtool('3E', '03');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn22Click(Sender: TObject);
begin
  Maxtool('3C', '03');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn19Click(Sender: TObject);
begin
  Maxtool('3D', '03'+edit4.Text);
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn25Click(Sender: TObject);
var
  Tamanho,i : Integer;
  tempodisp, linha1, linha2 : string;
begin
  tempodisp := IntToHex((StrToInt(ComboBox40.Text))*2, 2);

  Edit9.Text := CompletaComEspacos(Edit9.text, 16);
  Edit11.Text := CompletaComEspacos(Edit11.text, 16);

  Tamanho := Length(Edit9.Text);
  for i := 1 to Tamanho do begin
  linha1:= linha1 + IntToHex(Ord(Edit9.Text[i]),2); //Linha do Erro
  end;

  Tamanho := Length(Edit11.Text);
  for i := 1 to Tamanho do begin
  linha2:= linha2 + IntToHex(Ord(Edit11.Text[i]),2); //Linha do Erro
  end;

  Maxtool('3F', '03'+tempodisp+linha1+linha2);
  DelayResposta(ComboBox9.text);  

end;

procedure TForm1.BitBtn16Click(Sender: TObject);
var
  dados, dado1 : String;
  bsensor : byte;
begin
  if PoolingAtivo then
    ParaPooling;
  CheckBox26.Font.Color := clBlack;
  CheckBox24.Font.Color := clBlack;

// Configura entradas de sensor
  if CheckBox26.Checked then
    begin
      bsensor := $00;
      //monta byte

      // IN1
      if (ComboBox41.Text = 'Habilitado') then
        bsensor := bsensor or $01
          else bsensor := bsensor and $FE;
      // IN2
      if (ComboBox42.Text = 'Habilitado') then
        bsensor := bsensor or $02
          else bsensor := bsensor and $FD;
      // INEXP1
      if (ComboBox45.Text = 'Habilitado') then
        bsensor := bsensor or $04
          else bsensor := bsensor and $FB;
      // INEXP2
      if (ComboBox44.Text = 'Habilitado') then
        bsensor := bsensor or $08
          else bsensor := bsensor and $F7;
      //INEXP3
      if (ComboBox46.Text = 'Habilitado') then
        bsensor := bsensor or $10
          else bsensor := bsensor and $EF;
      //INEXP4
      if (ComboBox48.Text = 'Habilitado') then
        bsensor := bsensor or $20
          else bsensor := bsensor and $DF;
      //INEXP5
      if (ComboBox47.Text = 'Habilitado') then
        bsensor := bsensor or $40
          else bsensor := bsensor and $BF;
      //INEXP6
      if (ComboBox49.Text = 'Habilitado') then
        bsensor := bsensor or $80
          else bsensor := bsensor and $7F;
      dados :=  IntToHex(bsensor, 2);
        Maxtool('31', dados);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox26.Font.Color := clBlue
    else
      CheckBox26.Font.Color := clRed;
    end;

// Configura entrada de incendio
  if Checkbox24.checked then
    begin
    dado1 := 'FF';
    if ComboBox43.Text = 'Desativado' then dado1 := 'FF';
    if ComboBox43.Text = 'INEXP6' then dado1 := '00';
    if ComboBox43.Text = 'IN2' then dado1 := '01';
    if ComboBox43.Text = 'IN3' then dado1 := '02';
    if ComboBox43.Text = 'IN4' then dado1 := '03';
    if ComboBox43.Text = 'INEXP1' then dado1 := '04';
    if ComboBox43.Text = 'INEXP2' then dado1 := '05';
    if ComboBox43.Text = 'INEXP3' then dado1 := '06';
    if ComboBox43.Text = 'INEXP4' then dado1 := '07';
    if ComboBox43.Text = 'INEXP5' then dado1 := '08';
    Maxtool('33', dado1);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox24.Font.Color := clBlue
    else
      CheckBox24.Font.Color := clRed;
    end;

end;

procedure TForm1.BitBtn24Click(Sender: TObject);
begin
  Maxtool('44', '');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn20Click(Sender: TObject);
begin
  Maxtool('46', '');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn26Click(Sender: TObject);
begin
  Maxtool('43', '');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn23Click(Sender: TObject);
begin
  Maxtool('47', '');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn27Click(Sender: TObject);
begin
  Maxtool('45', 'FF00');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn21Click(Sender: TObject);
begin
  Maxtool('45', edit10.Text);
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn28Click(Sender: TObject);
begin
  TesteLCD(Edit13.Text + edit12.Text);
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn31Click(Sender: TObject);
var
  dados, dado1 : String;
  bsaidas1 : byte;
  bsaidas2 : byte;
  bsaidas3 : byte;
  bsaidas4 : byte;
begin
  if PoolingAtivo then
    ParaPooling;
  CheckBox23.Font.Color := clBlack;
  CheckBox25.Font.Color := clBlack;
  CheckBox27.Font.Color := clBlack;

// Configura estado das sa�das na inicializa��o
  if CheckBox25.Checked then
    begin
      bsaidas1 := 0;
      bsaidas2 := 0;
      bsaidas3 := 0;
      bsaidas4 := 0;
      //monta byte

      // Sa�da Exp 3
      if (ComboBox61.Text = 'Ligado') then bsaidas1 := bsaidas1 + 128;
      if (CheckBox21.Checked) then bsaidas3 := bsaidas3 + 128;

      // Sa�da Exp 2
      if (ComboBox62.Text = 'Ligado') then bsaidas1 := bsaidas1 + 64;
      if (CheckBox22.Checked) then bsaidas3 := bsaidas3 + 64;

      // Sa�da Exp 1
      if (ComboBox64.Text = 'Ligado') then bsaidas1 := bsaidas1 + 32;
      if (CheckBox28.Checked) then bsaidas3 := bsaidas3 + 32;

      // Sa�da BZ L3
      if (ComboBox63.Text = 'Ligado') then bsaidas1 := bsaidas1 + 16;
      if (CheckBox29.Checked) then bsaidas3 := bsaidas3 + 16;

      //Sa�da BZ L2
      if (ComboBox65.Text = 'Ligado') then bsaidas1 := bsaidas1 + 8;
      if (CheckBox30.Checked) then bsaidas3 := bsaidas3 + 8;

      //Sa�da BZ L1
      if (ComboBox67.Text = 'Ligado') then bsaidas1 := bsaidas1 + 4;
      if (CheckBox31.Checked) then bsaidas3 := bsaidas3 + 4;

      //Sa�da PICTO 4
      if (ComboBox66.Text = 'Ligado') then bsaidas2 := bsaidas2 + 128;
      if (CheckBox32.Checked) then bsaidas4 := bsaidas4 + 128;

      //Sa�da PICTO 3
       if (ComboBox68.Text = 'Ligado') then bsaidas2 := bsaidas2 + 64;
      if (CheckBox33.Checked) then bsaidas4 := bsaidas4 + 64;

     //Sa�da PICTO 2
      if (ComboBox70.Text = 'Ligado') then bsaidas2 := bsaidas2 + 32;
      if (CheckBox34.Checked) then bsaidas4 := bsaidas4 + 32;

      //Sa�da PICTO 1
      if (ComboBox71.Text = 'Ligado') then bsaidas2 := bsaidas2 + 16;
      if (CheckBox35.Checked) then bsaidas4 := bsaidas4 + 16;

      //Sa�da 4
      if (ComboBox72.Text = 'Ligado') then bsaidas2 := bsaidas2 + 8;
      if (CheckBox36.Checked) then bsaidas4 := bsaidas4 + 8;

      //Sa�da 3
      if (ComboBox73.Text = 'Ligado') then bsaidas2 := bsaidas2 + 4;
      if (CheckBox37.Checked) then bsaidas4 := bsaidas4 + 4;

      //Sa�da 2
      if (ComboBox74.Text = 'Ligado') then bsaidas2 := bsaidas2 + 2;
      if (CheckBox38.Checked) then bsaidas4 := bsaidas4 + 2;

      //Sa�da 1
      if (ComboBox75.Text = 'Ligado') then inc(bsaidas2);
      if (CheckBox39.Checked) then inc(bsaidas4);

    dados :=  IntToHex(bsaidas1, 2) + IntToHex(bsaidas2, 2);
    dado1 :=  IntToHex(bsaidas3, 2) + IntToHex(bsaidas4, 2);

    Maxtool('4B', dado1 + dados);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox25.Font.Color := clBlue
    else
      CheckBox25.Font.Color := clRed;
    end;

// Configura Sa�da de Sirene para alarme de Porta:
  if Checkbox23.checked then
    begin
    dado1 := '08';
    if ComboBox60.Text = 'Desativado' then dado1 := '08';
    if ComboBox60.Text = 'PICTO 1' then dado1 := '01';
    if ComboBox60.Text = 'PICTO 2' then dado1 := '02';
    if ComboBox60.Text = 'PICTO 3' then dado1 := '03';
    if ComboBox60.Text = 'PICTO 4' then dado1 := '04';
    if ComboBox60.Text = 'SAIDA EXP 1' then dado1 := '05';
    if ComboBox60.Text = 'SAIDA EXP 2' then dado1 := '06';
    if ComboBox60.Text = 'SAIDA EXP 3' then dado1 := '07';
    Maxtool('42', dado1);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox23.Font.Color := clBlue
    else
      CheckBox23.Font.Color := clRed;
    end;



// Configura Tempo Acionamento do Cofre
  if Checkbox27.checked then
    begin
    dado1 := 'FF';
    if ComboBox69.Text <> 'Padr�o' then
    dado1 := IntToHex((Round(StrTofloat(ComboBox69.Text)*10)), 2);
    Maxtool('48', dado1);
    DelayResposta(ComboBox9.text);
    if Ok_Simples then
      CheckBox27.Font.Color := clBlue
    else
      CheckBox27.Font.Color := clRed;
    end;

end;


procedure TForm1.BitBtn33Click(Sender: TObject);
var
  qual_saida, qual_funcao, qual_tempo, qual_quantidade : Integer;
begin
  qual_funcao := 2;

  qual_saida := 0;
  case AnsiIndexStr(UpperCase(ComboBox76.Text), ['S1', 'S2','S3','S4','PICTO 1','PICTO 2','PICTO 3','PICTO 4','L1BZ','L2BZ','L3BZ','SAIDA EXP 1','SAIDA EXP 2','SAIDA EXP 3']) of
    0 : qual_saida := 0;
    1 : qual_saida := 1;
    2 : qual_saida := 2;
    3 : qual_saida := 3;
    4 : qual_saida := 4;
    5 : qual_saida := 5;
    6 : qual_saida := 6;
    7 : qual_saida := 7;
    8 : qual_saida := 10;
    9 : qual_saida := 11;
    10 : qual_saida := 12;
    11 : qual_saida := 13;
    12 : qual_saida := 14;
    13 : qual_saida := 15;
  end;


  if ComboBox77.Text = 'Desligar' then qual_funcao := 0
    else if ComboBox77.Text = 'Ligar' then qual_funcao := 1
      else if ComboBox77.Text = 'Alternar' then qual_funcao := 2;

  qual_tempo := (Round(StrTofloat(ComboBox78.Text)*10));

  qual_quantidade := StrToInt(combobox79.text);
  Maxtool('4A', IntToHex(qual_funcao, 2) + IntToHex(qual_tempo, 2) + IntToHex(qual_quantidade, 2) + IntToHex(qual_saida, 2));
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn18Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox51.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo4.Lines.Clear;
  Maxtool('4D' , IntToHex(q_leitor,2) + '01');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn30Click(Sender: TObject);
var
  q_leitor : Integer;
  q_formato : string;
  q_template : string;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox51.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  q_formato := '00';
  q_template := Edit14.Text;
  Memo4.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4D', IntToHex(q_leitor,2) + '15' + q_formato + q_template, True);
end;

procedure TForm1.BitBtn36Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox51.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo4.Lines.Clear;  
  Maxtool('4D' , IntToHex(q_leitor,2) + '1A' + '03');
  DelayResposta(ComboBox9.text);  
end;


procedure TForm1.BitBtn35Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox51.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo4.Lines.Clear;
  Maxtool('4D' , IntToHex(q_leitor,2) + '1A' + '00');
  DelayResposta(ComboBox9.text);  
end;

procedure TForm1.BitBtn37Click(Sender: TObject);
var
  q_leitor : Integer;
  q_formato : string;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox51.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  q_formato := '00';
  Memo4.Lines.Clear;
  Maxtool('4D' , IntToHex(q_leitor,2) + '16' + q_formato + '00');
end;


procedure TForm1.ComboBox25Change(Sender: TObject);
begin
  if ComboBox25.Text = 'Biometrico Virdi' then ComboBox26.Text := '19200' else ComboBox26.Text := '9600';  
end;

procedure TForm1.ComboBox30Change(Sender: TObject);
begin
  if ComboBox30.Text = 'Biometrico Virdi' then ComboBox31.Text := '19200' else ComboBox31.Text := '9600';
end;

procedure TForm1.ComboBox35Change(Sender: TObject);
begin
  if ComboBox35.Text = 'Biometrico Virdi' then ComboBox36.Text := '19200' else ComboBox36.Text := '9600';
end;

procedure TForm1.BitBtn40Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '021000000000000000000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn38Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '021100000000000000000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn34Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '028800000000000000000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn42Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '021A00000100000001000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn41Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '021A00000000000001000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn39Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '022000002500000001000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn43Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '022000002500000000000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn29Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '025C00000000000000000000900100000000FFFF' + Edit15.Text, True);
  DelayResposta(ComboBox9.text);
end;
   
procedure TForm1.Edit14Exit(Sender: TObject);
begin
  if (length(Edit14.text) = 0) then exit
  else if (length(Edit14.text) < 808) then
    begin
    Edit14.SetFocus;
    ShowMessage('Erro: H� MENOS de 404 bytes ! ');
    end;
end;

procedure TForm1.Edit15Exit(Sender: TObject);
begin
  if (length(Edit15.text) = 0) then exit
  else if (length(Edit15.text) < 800) then
    begin
    Edit15.SetFocus;
    ShowMessage('Erro: H� MENOS de 400 bytes ! ');
    end;
end;

procedure TForm1.BitBtn44Click(Sender: TObject);
var
  q_leitor : Integer;
  q_id : string;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  q_id := IntToHex(strtoint(CompletaComZeros(Edit16.Text, 8)), 8);
  q_id := Copy(q_id, 7, 2) + Copy(q_id, 5, 2) + Copy(q_id, 3, 2) + Copy(q_id, 1, 2);
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '029B0000' + q_id + '00000000000000000000FFFF', True);
  Edit16.Text := IntToStr(strtoint(Edit16.Text) + 1);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn45Click(Sender: TObject);
var
  str_buffer: String;
  indice, tot_cartoes : Integer;
  F: TextFile;
  lista: array[1..10000] of String;
  q_leitor : Integer;
  q_id, q_template : string;
  t_init, t_end, t_total : TDateTime;
begin
  if PoolingAtivo then
    ParaPooling;
  Memo5.Lines.Clear;  
  OpenDialog1.Execute;
  AssignFile(F, OpenDialog1.FileName);
  Reset(F);
  indice := 1;
  try
  while not EOF(F) do
    begin
    ReadLn(F, str_buffer);
    if length(str_buffer)=805 then
      begin
      lista[indice] := str_buffer;
      Inc(indice);
      end;
    end;
  CloseFile(F);
  tot_cartoes := indice - 1;
  if Confirma('Deseja enviar ' + IntToStr(tot_cartoes) + ' templates para a memoria interna do m�dulo ?') then
    begin
      q_leitor := 0;
      case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
        0 : q_leitor := 1;
        1 : q_leitor := 2;
        2 : q_leitor := 3;
      end;

    if Confirma('Deseja eliminar todos os templates da memoria interna do m�dulo antes de enviar a lista ?') then
      repeat
      t_init := Now;
      EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '028200000000000000000000000000000000FFFF', True);
      DelayResposta('10000');
      t_end := Now;
      t_total := t_end - t_init;
      Memo5.Lines.Add('Tempo Total para apagar log�s : ' + TimeToStr(t_total));
      t_init := Now;
      EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '027600000000000000000000000000000000FFFF', True);
      DelayResposta('10000');
      t_end := Now;
      t_total := t_end - t_init;
      Memo5.Lines.Add('Tempo Total para apagar templates : ' + TimeToStr(t_total));

      until not Ocorreu_TimeOut;
    ProgressBar2.Min := 0;
    ProgressBar2.Position := ProgressBar2.Min;
    ProgressBar2.Max := tot_cartoes;
    Label94.Caption := '0/' + IntToStr(tot_cartoes);
    Label94.Visible := True;
    ProgressBar2.Visible := true;
    Ocorreu_TimeOut := False;
    indice := 0;
    t_init := Now;

      repeat
        if not Ocorreu_TimeOut then
          inc(indice);
        ProgressBar2.Position := indice;
        Label94.Caption := IntToStr(indice) + '/' + IntToStr(tot_cartoes);
        q_id := '000' + Copy(lista[indice], 1, 5);
        q_template := Copy(lista[indice], 6, 800);
        q_id := IntToHex(StrtoInt(q_id), 8);
        q_id := Copy(q_id, 7, 2) + Copy(q_id, 5, 2) + Copy(q_id, 3, 2) + Copy(q_id, 1, 2);
        EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '02A50000' + q_id + '00000100900100000000FFFF' + q_template, True);
        DelayResposta(IntToStr((indice*5) + 1000));
        if Interromper then
          if Confirma('Deseja interromper o envio da lista de templates ?') then
            break;
      until (indice = tot_cartoes)
    end;
  t_end := Now;
  t_total := t_end - t_init;
  Memo5.Lines.Add('Tempo Total para carregar a lista na mem�ria : ' + TimeToStr(t_total));
  ProgressBar2.Visible := False;
  Label94.Visible := False;
  except
  CloseFile(F);
  end;
end;


procedure TForm1.Label7DblClick(Sender: TObject);
begin
  label27.Caption := '0';
end;

procedure TForm1.BitBtn46Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '024F00000000000000000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.BitBtn47Click(Sender: TObject);
begin
  novo_ip_para_comunicar;
  Form1.caption := descr_soft + ip_utrmvnet + ' -> *****]';
  StatusBar1.Panels[1].Text := ' IP''s: ' + meu_ip +
        ' (' + edit30.text + ') <-> ' + ip_cli;
  label61.Caption := ip_cli;
  label45.Caption := meu_ip;
  label55.Caption := meu_ip;
  label47.Caption := meu_host;

  Maxtool('06', '0A0A03'); //Envia Bip
  DelayResposta(ComboBox9.text);
  if Ok_Simples then
  begin
    Edit1.Color := clGreen;
    Edit3.Color := clGreen;
    Edit18.Color := clGreen;
    Edit19.Color := clGreen;
    Edit1.Font.Color := clWhite;
    Edit3.Font.Color := clWhite;
    Edit18.Font.Color := clWhite;
    Edit19.Font.Color := clWhite;
  end
  else
  begin
    Edit1.Color := clRed;
    Edit3.Color := clRed;
    Edit18.Color := clRed;
    Edit19.Color := clRed;
    Edit1.Font.Color := clWhite;
    Edit3.Font.Color := clWhite;
    Edit18.Font.Color := clWhite;
    Edit19.Font.Color := clWhite;
  end;
end;

procedure TForm1.Edit29Change(Sender: TObject);
begin
  Edit29.text := CorrigeSeTemAlgumaLetra(Edit29.Text);
  if (length(Edit29.text) = 3) then
    Perform (WM_NEXTDLGCTL,0,0);
end;


procedure TForm1.BitBtn49Click(Sender: TObject);
var
  q_leitor : Integer;
  dado: String;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  dado := '022000001B00000000000000000000000000FFFF';
  if ComboBox53.Text = 'Off (Default)' then
    dado := '022000001B00000000000000000000000000FFFF';
  if ComboBox53.Text = 'On' then
    dado := '022000001B00000001000000000000000000FFFF';
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + dado, True);
  DelayResposta(ComboBox9.text);
end;


procedure TForm1.BitBtn50Click(Sender: TObject);
var
  q_leitor : Integer;
  dado: String;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  dado := '022100000B00000001000000000000000000FFFF';
  if ComboBox54.Text = '19200' then
    dado := '022100000B00000001000000000000000000FFFF';
  if ComboBox54.Text = '115200' then
    dado := '022100000100000001000000000000000000FFFF';
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + dado, True);
  DelayResposta(ComboBox9.text);
end;

procedure TForm1.Label92DblClick(Sender: TObject);
begin
label93.Visible := True;
Edit16.Visible := True;
BitBtn44.Visible := True;
BitBtn38.Visible := True;
BitBtn45.Visible := True;
BitBtn34.Visible := True;
BitBtn46.Visible := True;
BitBtn39.Visible := True;
BitBtn43.Visible := True;
BitBtn42.Visible := True;
BitBtn41.Visible := True;
end;

procedure TForm1.BitBtn51Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  Ok_Bio := False;
  // Configurar Autenticacao Servidor
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '022000002500000001000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
  if Ok_Bio then
    Ok_Bio := False
  else
    Memo5.Lines.Add('Falha ao configurar Autenticacao Servidor.');

  // Habilita Auto Identify
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '021A00000100000001000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
  if Ok_Bio then
    Ok_Bio := False
  else
    Memo5.Lines.Add('Falha ao Habilitar Auto Identify.');

  // Set 19200 Baud Rate
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '022100000B00000001000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
  if Ok_Bio then
    Ok_Bio := False
  else
    Memo5.Lines.Add('Falha ao configurar baud rate para 19200.');
end;

procedure TForm1.BitBtn52Click(Sender: TObject);
var
  q_leitor : Integer;
begin
  q_leitor := 0;
  case AnsiIndexStr(UpperCase(ComboBox52.Text), ['LEITORA 1', 'LEITORA 2','LEITORA 3']) of
    0 : q_leitor := 1;
    1 : q_leitor := 2;
    2 : q_leitor := 3;
  end;
  Memo5.Lines.Clear;
  EnviaComandoUDP(ip_cli, '01', '4F', IntToHex(q_leitor,2) + '020500000000000000000000000000000000FFFF', True);
  DelayResposta(ComboBox9.text);
end;

end.

