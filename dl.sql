USE [OnlineShop]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionT]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionT](
	[MaA] [int] NOT NULL,
	[TenA] [nvarchar](100) NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[MaA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONHANG]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONHANG](
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuongMua] [int] NULL,
 CONSTRAINT [PK_CHITIETDONHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [int] NOT NULL,
	[Ten] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV_Q_A]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV_Q_A](
	[MaA] [int] NOT NULL,
	[MaCV] [int] NOT NULL,
	[MaQ] [int] NOT NULL,
	[Ten] [nvarchar](50) NULL,
 CONSTRAINT [PK_CV_Q_A] PRIMARY KEY CLUSTERED 
(
	[MaA] ASC,
	[MaCV] ASC,
	[MaQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHGIASANPHAM]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHGIASANPHAM](
	[MaTaiKhoan] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[DanhGia] [int] NULL,
	[NoiDungBinhLuan] [nvarchar](200) NULL,
	[NgayDanhGia] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUCSANPHAM]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCSANPHAM](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](30) NULL,
 CONSTRAINT [PK_DANHMUCSANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[TongTien] [bigint] NULL,
	[TinhTrang] [int] NULL,
	[NgayLap] [date] NULL,
 CONSTRAINT [PK_DONHANG] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaTaiKhoan] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[soluong] [int] NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANGSANXUAT]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGSANXUAT](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](20) NULL,
 CONSTRAINT [PK_HANGSANXUAT] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQ] [int] NOT NULL,
	[ActionName] [nvarchar](200) NULL,
	[Ten] [nvarchar](200) NULL,
	[ControllerName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[MoTa] [nvarchar](1000) NULL,
	[Anh1] [nvarchar](20) NULL,
	[Anh2] [nvarchar](20) NULL,
	[Anh3] [nvarchar](20) NULL,
	[Anh4] [nvarchar](20) NULL,
	[Anh5] [nvarchar](20) NULL,
	[Anh6] [nvarchar](20) NULL,
	[SoLuongDaBan] [int] NULL,
	[SoLuongTrongKho] [int] NULL,
	[GiaTien] [bigint] NULL,
	[MaHang] [int] NULL,
	[MaDanhMuc] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](30) NULL,
	[NgaySinh] [date] NULL,
	[SDT] [nchar](15) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[MaCV] [int] NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VANCHUYEN]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VANCHUYEN](
	[MaDonHang] [int] NOT NULL,
	[NguoiNhan] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](20) NULL,
	[HinhThucVanChuyen] [nvarchar](20) NULL,
 CONSTRAINT [PK_VANCHUYEN] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202212230057448_tkdoanhthu', N'Shopdogiadung.Migrations.Configuration', 0x1F8B0800000000000400ED1DDB6EE3BAF1BD40FFC1F0535BEC8973D92C4E03E71C78EDDD4DB01B275D3B8BED53C0D88C2D54965C5D16098A7E591FFA49FD8552B64451BC93A26405E76081452C9133C3E170389CA166FEF79FFF0E7F7DDEF8BD1F308ABD30B8EC9F1C1DF77B3058844B2F585DF6D3E4E9A79FFBBFFEF2C73F0C3F2C37CFBD6F45BBB3AC1DEA19C497FD75926C2F068378B1861B101F6DBC4514C6E15372B4083703B00C07A7C7C77F1D9C9C0C2002D147B07ABDE1D73448BC0DDCFD403FC761B080DB2405FE4DB8847E9C3F476F663BA8BD29D8C0780B16F0B23F5B87DB65B8F2C0320D5647FBF6FDDEC8F700A26506FDA77E0F0441988004517A711FC3591285C16AB6450F803F7FD942D4EE09F831CC47705136D71DCCF169369841D9B100B548E324DC18023C39CBB933A0BB5BF1B88FB987F8F701F13979C946BDE3E1657F7C753DBFFE309FDC4EAF46D34FFD1E8DF262EC4759733EA38FAADDDFF42A8DDE6001417294FD7BD31BA77E9246F03280691201FF4DEF2E7DF4BDC567F8320FFF0183CB20F57D926044327A5779801EDD45E11646C9CB57F8940FE3064CC2E00A04AB7E6FA0D37A7647371C0E6844B8238B63CF91EB20393BEDF7A68866F0E8432C4604F7664918C14F30801148E0F20E24098C90144CC300320430E83222DBC0340BBFA46849DCA480C247759B821FDE6A878D0280A5E72BF477EFE3B5B7DDAFBEA3FCDD435552D012FD18859BAFA15F76A79B3CCC41B48209A22994B79B8569B46047292477369ADE5D8D6EB8E4E6EF64E40A9A30E48ADAF1C81D0ECA95295DAFB60BB5BB2BB4D58577BD843B8EAA17DF1C789FD72108E44B82EA3647CB68EE41B2D3BBB7CA4E5EB09E47ECF0E4BDA62BF0F2056C8B3E1334CC39DA42F5570123E16E176F21E5AAC55BAC1A5DB2E7A3EBCF57B7A32997DEE2E5038F52E625B362D916A6AAE5DB683ABEBAFFFB073E79050F88562C23F14B210BCB163CE669AB92929386BAA4E8784865522E4F736D2258DA0DAA9379A91290F9E9654BFD063C7F81C12A5923EB1919CF1FBD67B82C1EE4F8EF030F59DEA84F12A5CA4D3CD30733A4495885C08C4B610D4CE6125A4FCE295AF7B419913AF1C078ED49909CBB60C8870DF07C09925317486E40F2790D5219C38E5DE0F95BFA2215A1132B2462836E34BDFA743DCA2D18FEDE502A4BBA314FE556DB30AA4DD8D0747B906E6786DB839848DBCDEB931766768C82BAB21587BAE2A5983ADCA2D6EE509D08737BB3D2BD8B3B85D393A1BB2DA55B47C30908D69F3CC5B990DE89426F8226F93DDA8CBEA440A6B54E9DE8C66CE7A3E834B78675CE8412452768223C138AF4A1632BD842338B6D620D92B5B58BAD5AE9803EB153102E16AC81B559A26BCC24B909E7408EC4059651B03E69DA8843384E5BC071D6028EB72DE0386F01C7BBA671E43ECF09786FE8E2C93BCEB32002DAF28DFAA21DCAD83B7403389E2F55976C3BBC491796EE5C1DCF500D3F296DB8AAFCA986641B7877715321D1C54F05CDC54FE3D38AC639AB86F521A2BAF6210BF5BFB91FCB385D6DF2C0A35AD08475FB0BDA99DA4CD2C357019D77F6A2DF09F92A3D79C948CB041E01F97E3F9A73A923DE7359C97BCFF091DBA89615472F23BBE0E16FDAA6D339848D413035DD033E7B8BF57C9D860BC946AAF43B6AF90BC759343D0549E388D0B9720682EF72544E8C03F4BF1A9363975B23DB96222449EF6ED68E227233B0701495DD0F1A9F2C8C268BF824D7DE6AF68847E17416575049A8205268BFDF33612E855D6025A5F9D66C2C9E79BFDF1D98AFD48119877E765CB33C09E928652D8B51A4881993D2AD03502F922074F949A9D35E7A15E3D670F9117D0FB9046DEFADB47B69056D0A244267D691DD8E607566A1F702E9C1C64A1A89BB1786B2887BFED62F51E9E8DDE92A0DBDE95A1AFE7112E66FE73281FC52849343C755760D6C9D2EBE8160BC5684FB1DAF639DFB9B9A7796447736D95B4D56AB377E89971E58456063BC7CCBAE875BBF39010FDED27C01937DDBDA510290C550C547E0D39FB5E4D0F006D216215A785BE06B8C550E29FF90C1C873B2844F5EE02544B7F75E00A297CAC8D19FFC91EB48F5288EC385B79BA0EA0264BCE955423F04CB9EE6A5CBFD8C11EB17518F64DADB22294614A1A963D8A0868ED776099DFE7CA08AE42F0C12B4146094C91EF0C748CDA0C5E50509BB6EF2F9D71B2DD5DD6CE3CC6609E3A3DF4CE01606D952D1634C6D42303E4A35A8B8361C102225973451DC46240BCA204E290BF8B0A42F69CAABF42D4B9A62B47A13CC1EC08D844CC1933A34B42F5F854C680A00136E73295D8C5394112E018EE3A323168D0BF9A2867B08F1A298F24AA48B8E85AA2440181875225FC22B54C42E4CDDA66C547B0946DBAA780978D271F91279B1859692CAA55D9500324CA2A162D4783892D6AC882906AC6901F1032D66A6989C23B5096951996127AD4ACFB0F70F9CA82FD60F5C82C561934615163DB05635153DFC8EAB28AE5B5534C5721F6B39CD1517BD916692DF3C694B2DC9C6A9379FB5CF863246D423A105A112DE18174DBBFAC39E72EACB5095BE6E525F4F6FD9B6520D586F8A25A15C7D4953F1A63E29AD4A9CCA0321F92E4B2D630AED25F92458E941732E5856CE06C71265E56CE88A28290D29C947748ED4D5E16C29E1D80E21477636D581E5888D74A91CE49C4FF59D38DE39E1B4122E11886BCA4D251C5FFBAE768615DD73B2EF833CA84F827AC028A7E136F0D1AF2CD0C88954DEC7300F56C6798C8C16890CE40C26A22F32CAC092C03DCEC85815A004922E8862B1F360943A544507FD51034B0E65DD29004A20E982A87A4625CCD60558F5558806493A871400CB6B5D0C24BCC9284010C7151E98CA8150010A2F511E20425B29C094F1791E1C32F04F0122962523E0ECF749446BEA86833424C6D5D3A2A0181E1AB9D0184DA41F7025E031E3A1AF1154B9A1C129514490C329ADE0A12C0423E354B93C249C52050CDBE4145EAD4A4671A3602671B09A6CA2235F2C9744506B708951ED623649BD0E46011D5B4689DC0CE44AA6C7539B53C23BF31C1DA51398300A4D5023ABEC4F3255A58844684C400D992A373EB130F14F817A0E755BF1618E7D04A092E6DA6CE05FA96559A1F611EB7B898991546D06095BA44EE16624449CF382658F9EB7D3CCDF498C8A308C253C527A381B553D9C4C48323EA9377AB197AE066724BBBBC36D9DF3B58484171AEA45EC66B2E7454B1A8673DB576C300B1C259AAE125B2399758E1090C8B38836338A7B9AF8088FDF0D07FB84D3F983E14090997A7803B65B0F4D41D9337FD29BEDD3548F7F9A99676FDEEC610C161569A31D0E185312466005A9B7D907BA4BF8D18BE2640212F008B25BAAE3E5866946382C0407B50211DF27C1CE5C71842BFA657FE7FBB93A9734C7D193C3F98846B9C93C45BBCBCD428B9F05D0CBF287031F44E24F23C6A19F6E02A51749062B8B0C57C1F062C56208643666120EF99C85361C50DC61FC5ECC7C50CB839E662D217037FBF6D37EE0F92EBDD65560626FB6185A993F9884553E3580542615AE802A1FEBC3C2A9864948F8616764B1DC516B0B23F65F9A4BA3B86B4B22C4488F99E0947964E9D9DE3F355064D93753150D36619C89B2FEC5975D2488E2993E943C0D2C09247F64B2C8F32CAFD5E9C91FEAC3C9B3B89250F2479D5944EA2391A95EAFFAEF2DD4BB02403BCBAAFEBE8E535456E4B97868B040E9F49A95754ABF345BF85C1A2B2F3A23A8EE24D45E342D64B2AE14E5B91D29056F06639FB9B142C5EE893E847D564612C2FE891184530602F36D9E02C21903E1CC10C25B060293904F01E19C81706E08E11D03E19DC57921CF64C83931E46F8C2196290E3940CB97FA7071FA43121E7E68A28B79C6BBB9E58EAF7F53A700D1ADF083E93A3A48E3EAA86DAFF954009A538038191A09043FD4874324482321118F0D68C229D02A44E1A7469B3BCE3C46EDEBF8B90134228F59051AF1BC33424E47A19C589EC4A50A3BCB5306C0A56691ECF75C60E4F3CE4CA1C4376E3877C53516F34913F67C2DE7049CB18A04821F7666AE2BC1C0DAF34DDE37329F7369EF66AD089C73895A9C2238079A2D222E527BAE84611F8D9992F46DC35B4B6425AA9E70F1E3B6DD53759D649CAC412434CEEBCEC82479E1AFB65012F703CDA552D659C478321D0FC971718A1F19B4006489764838FB27FA10AA49734848D537FA1071F21C12187EA80F874CA853E114F1BC65A16422BE74138C3D7F827FE3886F1E6D55172866C2AFFB26FD1E62D30F6F99855E672F710237475983A3D93FFDB18F0EC449D9E00604DE138C937DEEA9FEE9F1C92955E1B83BD5860771BCACA4C652961CAECE5A77ABFD7AD9943037F9AF83257CBEECFF6BD7EBA277FDFD01777CD3BB8DD0EC5DF48E7BFF36CE5C456648D5C73CBBAB85942D04BC435D4261D3CA1917AE7539DDB6B3A8CC8A663C5974FA5CFD292B7A8A264E2775205D76F6D15B29278E0385AE436B0183AA4ABB44FC75243FFCB8EA21CA853622424485D0E00788166B1031B9BCCDA7822C084ACF856931D080A129AB056A465335592777A0E7C603AD14FAE4C23C358649D5F5E442DD95D132035B29E32900EA4ADF4AC2A69DCE3CEE4E757677A3A5CA15DA285A7E914581F85B290F8A4887BABC9650D6ADD5D294FA2E31B8D21664853D114C63A064413D47CA92AC9FE70EE4997B906FDD833C770FF29D6390BC5277161A4750F8CE02125506CFCE5AAD26D7D7D7DCB293991E5EAAF08AC1B970DF511FBB6D21AEC3E9D536364FAA1C9685EC30C5B1DC58DC74252C47763C53F6CA915E983255AE9AB74845E1D4F66B343565065068AC0E73C6558D7EB7EE85041C4041513587DCF9D08471CE36EBD834B570481C561ACEA2044C179C91ADB99499922C8EFC2F8D387548C7939BED4E585FA5596113C5160F5130A491A5BB0F54CA0C88AC4A88831220941EB5290062612BB2E540D0181F771541FEB401CF7FB61313672540EAA61CA3F34649524A3559DBA3C5CC62CACF4C0D1177B76847DD04D187960DF1CD4D3DFBB479B138782104B3321B8E048207ADE50A1AADCA840B9CDD2D8E515728E8047D92DC7DAF5F4B28BF66EC9444D42B67E1AE7C8581A43552A7A2C5BA14CE3076B000455D4D817353F2F255BE7EDD20FE66A1534AC1B68084A38211EDEB02F9B705BA6EB206B5C06B2CFC503B65FAA1CD06498A0F436779C3D64357B2EB6B176A705198C1C0BBF19AE5C1E8B0D91541D02EB3505B47B46F301C420ACCEC86D75624A1AE8392C84448006AAF08428B9E49D9877587764A52DFCBE01B0F746A417A1AB9A9F5B11894CE71815F71FFADCC657FF9985D38DA7BD9ED4A1DC82A1DF0B0989641905641E021B0AC91A05122813B1CAB320AB22A0A3C2CBAE0696FA1480EA4C86A5561D028C22062A379A106599D061E168B220EAA1A0E3C3456451EE4351E78686C4A40282A40F0D054EA4750880E56228297E696A3AFC53117A2BB42EF75B3F2032FDF77571980C97357D0C176F8BCEE0A7DD7CD4A0DC60CE0EF76BC4C80F519D062010649C105293B0CD8D899BA0AC6734E6D93953C2EF507D97CD50451958403CE6C4BF510B829ED3BB3BE1BAB7260316C7D7BA04B250CCC07DAEC5A6EAA3E81B19DC6D8C3547A1BFDA11A541F60734EA0137D8A7A6FF697CB8613187BAB12C410C10CE0A27296C76DAE83A7B0F02A5014154DE8FBAB30014B74D01F4589F70416097ABD8071EC6533FB0DF829CCBEC57D84CBEBE0364DB66982860C378FFE0BC98CCC3521C3BF2BB150A57978BBCD7EC52E8680C8F4B20F196F83F7A9E72F31DD1FD9CB84221099CF23BF3E99CD65925DA35CBD6048D330D00494B30FBB6AE670B3F511B0F83698811FD086B6FB187E812BB0782952878881A827A2CAF6E1243F5CE530CAFEE82792E1E5E6F997FF031223102A41BE0000, N'6.4.4')
GO
INSERT [dbo].[ActionT] ([MaA], [TenA]) VALUES (1, N'Không truy cập')
INSERT [dbo].[ActionT] ([MaA], [TenA]) VALUES (2, N'Chỉ xem')
INSERT [dbo].[ActionT] ([MaA], [TenA]) VALUES (3, N'Có thể sửa đổi')
GO
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (3, 5, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (3, 20, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (4, 9, 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (4, 10, 3)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (5, 9, 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (5, 10, 3)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (6, 18, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (6, 20, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (7, 5, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (10, 5, 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (10, 9, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (11, 16, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (12, 23, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (151, 16, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (152, 15, 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (153, 20, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (154, 16, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (154, 23, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (160, 23, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (161, 11, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (161, 18, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (162, 18, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (163, 59, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (164, 18, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (164, 19, 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDonHang], [MaSP], [SoLuongMua]) VALUES (164, 59, 9)
GO
INSERT [dbo].[ChucVu] ([MaCV], [Ten]) VALUES (1, N'Admin')
INSERT [dbo].[ChucVu] ([MaCV], [Ten]) VALUES (2, N'Nhân viên')
INSERT [dbo].[ChucVu] ([MaCV], [Ten]) VALUES (3, N'Khách hàng')
INSERT [dbo].[ChucVu] ([MaCV], [Ten]) VALUES (4, N'Trưởng phòng')
GO
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 2, 1, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 3, 1, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 3, 2, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 3, 3, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 3, 4, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 3, 5, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 3, 6, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 4, 1, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 4, 2, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 4, 3, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 4, 4, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 4, 5, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 4, 6, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (1, 4, 7, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (2, 2, 2, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (2, 2, 6, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 1, 1, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 1, 2, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 1, 3, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 1, 4, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 1, 5, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 1, 6, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 1, 7, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 2, 3, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 2, 4, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 2, 5, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 2, 7, NULL)
INSERT [dbo].[CV_Q_A] ([MaA], [MaCV], [MaQ], [Ten]) VALUES (3, 3, 7, NULL)
GO
INSERT [dbo].[DANHGIASANPHAM] ([MaTaiKhoan], [MaSP], [DanhGia], [NoiDungBinhLuan], [NgayDanhGia]) VALUES (4, 5, 5, N'Tốt', CAST(N'2022-12-07' AS Date))
INSERT [dbo].[DANHGIASANPHAM] ([MaTaiKhoan], [MaSP], [DanhGia], [NoiDungBinhLuan], [NgayDanhGia]) VALUES (4, 18, 5, N'Sản phẩm tốt', CAST(N'2022-12-15' AS Date))
INSERT [dbo].[DANHGIASANPHAM] ([MaTaiKhoan], [MaSP], [DanhGia], [NoiDungBinhLuan], [NgayDanhGia]) VALUES (4, 18, 3, N'Tốt', CAST(N'2022-12-15' AS Date))
INSERT [dbo].[DANHGIASANPHAM] ([MaTaiKhoan], [MaSP], [DanhGia], [NoiDungBinhLuan], [NgayDanhGia]) VALUES (4, 18, 5, N'Tốt', CAST(N'2022-12-15' AS Date))
INSERT [dbo].[DANHGIASANPHAM] ([MaTaiKhoan], [MaSP], [DanhGia], [NoiDungBinhLuan], [NgayDanhGia]) VALUES (4, 23, 5, N'tốt', CAST(N'2022-12-24' AS Date))
INSERT [dbo].[DANHGIASANPHAM] ([MaTaiKhoan], [MaSP], [DanhGia], [NoiDungBinhLuan], [NgayDanhGia]) VALUES (4, 16, 5, N'tốt', CAST(N'2022-12-26' AS Date))
INSERT [dbo].[DANHGIASANPHAM] ([MaTaiKhoan], [MaSP], [DanhGia], [NoiDungBinhLuan], [NgayDanhGia]) VALUES (4, 6, 5, N'Tốt', CAST(N'2022-12-07' AS Date))
GO
SET IDENTITY_INSERT [dbo].[DANHMUCSANPHAM] ON 

INSERT [dbo].[DANHMUCSANPHAM] ([MaDanhMuc], [TenDanhMuc]) VALUES (1, N'Máy giặt')
INSERT [dbo].[DANHMUCSANPHAM] ([MaDanhMuc], [TenDanhMuc]) VALUES (2, N'Điều hòa')
INSERT [dbo].[DANHMUCSANPHAM] ([MaDanhMuc], [TenDanhMuc]) VALUES (3, N'Tủ lạnh')
INSERT [dbo].[DANHMUCSANPHAM] ([MaDanhMuc], [TenDanhMuc]) VALUES (6, N'Nồi cơm điện')
INSERT [dbo].[DANHMUCSANPHAM] ([MaDanhMuc], [TenDanhMuc]) VALUES (7, N'Ti vi')
INSERT [dbo].[DANHMUCSANPHAM] ([MaDanhMuc], [TenDanhMuc]) VALUES (8, N'Quạt điện')
INSERT [dbo].[DANHMUCSANPHAM] ([MaDanhMuc], [TenDanhMuc]) VALUES (9, N'Máy lọc nước')
INSERT [dbo].[DANHMUCSANPHAM] ([MaDanhMuc], [TenDanhMuc]) VALUES (13, N'Lò vi sóng')
SET IDENTITY_INSERT [dbo].[DANHMUCSANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[DONHANG] ON 

INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (3, 4, 24600000, 2, CAST(N'2023-10-29' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (4, 4, 28908000, 4, CAST(N'2023-09-29' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (5, 4, 28908000, 3, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (6, 4, 22080000, 4, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (7, 4, 27310000, 3, CAST(N'2023-07-30' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (10, 4, 37989000, 0, CAST(N'2023-06-09' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (11, 4, 24030000, 3, CAST(N'2023-12-14' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (12, 4, 14160000, 3, CAST(N'2023-01-14' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (150, 4, 13300000, 3, CAST(N'2023-02-26' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (151, 4, 10730000, 3, CAST(N'2023-03-26' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (152, 4, 15980000, 4, CAST(N'2023-04-26' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (153, 4, 10590000, 4, CAST(N'2023-05-26' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (154, 4, 11590000, 3, CAST(N'2023-12-26' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (160, 14, 860000, 1, CAST(N'2023-11-23' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (161, 3, 27480000, 1, CAST(N'2023-11-24' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (162, NULL, 11490000, 1, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (163, 14, 1000000, 1, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[DONHANG] ([MaDonHang], [MaTaiKhoan], [TongTien], [TinhTrang], [NgayLap]) VALUES (164, 14, 32980000, 3, CAST(N'2023-12-18' AS Date))
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[HANGSANXUAT] ON 

INSERT [dbo].[HANGSANXUAT] ([MaHang], [TenHang]) VALUES (1, N'Samsung')
INSERT [dbo].[HANGSANXUAT] ([MaHang], [TenHang]) VALUES (2, N'Sony')
INSERT [dbo].[HANGSANXUAT] ([MaHang], [TenHang]) VALUES (3, N'Pananonic')
INSERT [dbo].[HANGSANXUAT] ([MaHang], [TenHang]) VALUES (4, N'LG')
INSERT [dbo].[HANGSANXUAT] ([MaHang], [TenHang]) VALUES (5, N'Aqua')
INSERT [dbo].[HANGSANXUAT] ([MaHang], [TenHang]) VALUES (6, N'Kangaroo')
SET IDENTITY_INSERT [dbo].[HANGSANXUAT] OFF
GO
INSERT [dbo].[Quyen] ([MaQ], [ActionName], [Ten], [ControllerName]) VALUES (1, N'QuanLyTK', N'Quản lý tài khoản ', N'Admin')
INSERT [dbo].[Quyen] ([MaQ], [ActionName], [Ten], [ControllerName]) VALUES (2, N'QuanLySP', N'Quản lý sản phẩm', N'Admin')
INSERT [dbo].[Quyen] ([MaQ], [ActionName], [Ten], [ControllerName]) VALUES (3, N'QuanLyHang', N'Quản lý hãng', N'Admin')
INSERT [dbo].[Quyen] ([MaQ], [ActionName], [Ten], [ControllerName]) VALUES (4, N'QuanLyDM', N'Quản lý danh mục', N'Admin')
INSERT [dbo].[Quyen] ([MaQ], [ActionName], [Ten], [ControllerName]) VALUES (5, N'QuanLyDH', N'Quản lý đơn hàng', N'Admin')
INSERT [dbo].[Quyen] ([MaQ], [ActionName], [Ten], [ControllerName]) VALUES (6, N'QuanLyQH', N'Quản lý quyền hạn', N'Admin')
INSERT [dbo].[Quyen] ([MaQ], [ActionName], [Ten], [ControllerName]) VALUES (7, N'Index', N'Người dùng', N'Home')
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (5, N'Smart Tivi NanoCell LG 4K 55 inch 55NANO75TPA ', N'Smart Tivi NanoCell LG 4K 55 inch 55NANO75TPA với thiết kế tinh tế, sang trọng phù hợp với mọi không gian. Bên cạnh đó, tivi trang bị các công nghệ xử lý hình ảnh, âm thanh như 4K AI Upscaling, Image Enhancing, AI Sound,... Đây là chiếc tivi đáng cân nhắc đối với những ai có nhu cầu tìm mua tivi.', N'Anh2.1.jpg', N'Anh2.2.jpg', N'Anh2.3.jpg', N'Anh2.4.jpg', N'Anh2.5.jpg', N'Anh2.6.jpg', 20, 32, 14010000, 4, 7)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (6, N'Google Tivi Sony 4K 55 inch KD-55X75K', N'Google Tivi Sony 4K 55 inch KD-55X75K sở hữu diện mạo thanh lịch, xem tivi thỏa mãn với hình ảnh đẹp mắt nhờ bộ xử lý X1 4K HDR, hệ điều hành tiên tiến, điều khiển bằng giọng nói tiếng Việt thân thiện và nhiều tính năng tiện ích mà khi khám phá bạn sẽ rất hài lòng với những gì mẫu tivi này đem lại đấy.', N'Anh3.1.jpg', N'Anh3.2.jpg', N'Anh3.3.jpg', N'Anh3.4.jpg', N'Anh3.5.jpg', N'Anh3.6.jpg', 9, 12, 13900000, 2, 7)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (7, N'Smart Tivi QLED 4K 43 inch Samsung QA43Q65A', N'Smart Tivi QLED 4K 43 inch Samsung QA43Q65A sở hữu diện mạo thanh lịch, xem tivi thỏa mãn với hình ảnh đẹp mắt nhờ bộ xử lý X1 4K HDR, hệ điều hành tiên tiến, điều khiển bằng giọng nói tiếng Việt thân thiện và nhiều tính năng tiện ích mà khi khám phá bạn sẽ rất hài lòng với những gì mẫu tivi này đem lại đấy.', N'Anh4.1.jpg', N'Anh4.2.jpg', N'Anh4.3.jpg', N'Anh4.4.jpg', N'Anh4.5.jpg', N'Anh4.6.jpg', 11, 34, 12800000, 1, 7)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (8, N'Google Tivi Sony 4K 55 inch KD-55X80K', N'Google Tivi Sony 4K 55 inch KD-55X80K đáp ứng đa dạng các nhu cầu giải trí cho người dùng nhờ sở hữu màn hình lớn 55 inch với chất lượng hình ảnh được nâng cấp lên chuẩn 4K nhờ công nghệ hình ảnh 4K X-Reality PRO mang lại trải nghiệm xem hoàn hảo với hình ảnh chi tiết, sắc nét, màu sắc chân thực, chuyển cảnh mượt mà,... Âm thanh vòm 3D sống động mang lại trải nghiệm như trong rạp chiếu.', N'Anh5.1.jpg', N'Anh5.2.jpg', N'Anh5.3.jpg', N'Anh5.4.jpg', N'Anh5.5.jpg', N'Anh5.6.jpg', 10, 18, 16000000, 2, 7)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (9, N'Tủ lạnh Aqua Inverter 320 lít AQR-B399MA(WHB)', N'tủ lạnh Aqua AQR-B399MA(WHB) với một thiết kế sang trọng và cao cấp, còn trang bị các công nghệ hiện đại như ngăn Magic room, Twin Inverter, lấy nước ngoài,... chắc chắn sẽ là một thiết bị gia dụng hỗ trợ bạn tốt nhất chăm sóc cho gia đình.', N'Anh6.1.jpg', N'Anh6.2.jpg', N'Anh6.3.jpg', N'Anh6.4.jpg', N'Anh6.5.jpg', N'Anh6.6.jpg', 16, 14, 9969000, 5, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (10, N'Tủ lạnh Aqua 90 lít AQR-D99FA(BS)', N'Tủ lạnh Aqua 90 lít AQR-D99FA(BS) thuộc dòng tủ lạnh mini có thiết kế nhỏ gọn, phù hợp với những không gian vừa và nhỏ. Với kiểu dáng nhỏ gọn, chiếc tủ lạnh mini 90 lít này sẽ là sự lựa chọn lý tưởng cho những gia đình nhỏ 1- 2 người hay các bạn sinh viên', N'Anh7.1.jpg', N'Anh7.2.jpg', N'Anh7.3.jpg', N'Anh7.4.jpg', N'Anh7.5.jpg', N'Anh7.6.jpg', 8, 14, 2990000, 5, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (11, N'Tủ lạnh LG Inverter 394 lít GN-D392BLA', N'Dòng tủ lạnh LG 394 lít GN-D392BLA này với những công nghệ hiện đại nổi bật như Door Cooling+, Hygiene Fresh+... cùng với tiện ích lấy nước ngoài tiện lợi kết hợp với gam màu tối ấn tượng, độc đáo. Do đó, sản phẩm sẽ là một sự lựa chọn đáng quan tâm cho gia đình từ 3 - 4 người khi bạn có nhu cầu mua tủ lạnh mới.', N'Anh8.1.jpg', N'Anh8.2.jpg', N'Anh8.3.jpg', N'Anh8.4.jpg', N'Anh8.5.jpg', N'Anh8.6.jpg', 14, 28, 15990000, 4, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (12, N'Tủ lạnh Samsung Inverter 299 lít RT29K5532BY/SV', N'chiếc tủ lạnh này là một lựa chọn đáng để bạn cân nhắc với những ưu điểm vượt trội như 2 dàn lạnh riêng biệt, Digital Inverter tiết kiệm điện, tấm giữ nhiệt Coolpack duy trì độ lạnh khi mất điện,... Một chiếc tủ lạnh khá hoàn hảo cho không gian bếp của các gia đình.', N'Anh9.1.jpg', N'Anh9.2.jpg', N'Anh9.3.jpg', N'Anh9.4.jpg', N'Anh9.5.jpg', N'Anh9.6.jpg', 9, 20, 7990000, 1, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (13, N'Tủ lạnh Panasonic Inverter 188 lít NR-BA229PKVN', N'Panasonic Inverter 188 lít NR-BA229PKVN là chiếc tủ lạnh phù hợp cho những hộ gia đình nhỏ và yêu thích kiểu tủ ngăn đá trên truyền thống. Bên cạnh việc trang bị công nghệ kháng khuẩn, khử mùi tối ưu, chiếc tủ lạnh này còn mang lại khả năng siêu tiết kiệm điện cho người dùng.', N'Anh10.1.jpg', N'Anh10.2.jpg', N'Anh10.3.jpg', N'Anh10.4.jpg', N'Anh10.5.jpg', N'Anh10.6.jpg', 10, 30, 7990000, 3, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (14, N'Điều hòa Panasonic Inverter 1 HP CU/CS-PU9XKH-8M', N'Sản phẩm là một sự lựa chọn đáng cân nhắc cho những gia đình muốn sở hữu một chiếc máy lạnh Inverter có các chế độ làm lạnh hiện đại Powerful, Nanoe G… cũng như công nghệ tiết kiệm năng lượng hiệu quả Inverter, Eco…', N'Anh11.1.jpg', N'Anh11.2.jpg', N'Anh11.3.jpg', N'Anh11.4.jpg', N'Anh11.5.jpg', N'Anh11.6.jpg', 15, 40, 11300000, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (15, N'Điều hòa Samsung Inverter 1 HP AR09TYHQASINSV', N'máy lạnh Samsung Inverter 1 HP AR09TYHQASINSV sẽ là sự lựa chọn phù hợp cho căn phòng dưới 15 m2 với những công nghệ hiện đại giúp việc làm lạnh được hiệu quả, tiết kiệm chi phí điện hằng tháng và giữ bầu không khí luôn trong lành với công nghệ Digital Inverter, bộ lọc HD, công nghệ DuraFin,... Đây chắc chắn là một sản phẩm đáng sở hữu cho gia đình trong thời gian tới.', N'Anh12.1.jpg', N'Anh12.2.jpg', N'Anh12.3.jpg', N'Anh12.4.jpg', N'Anh12.5.jpg', N'Anh12.6.jpg', 29, 20, 7990000, 1, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (16, N'Điều hòa LG Inverter 1.5 HP V13ENH1', N'Với nhiều tính năng tiện ích, nổi bật nhất là công nghệ Dual Inverter tiết kiệm năng lượng hiệu quả và làm lạnh nhanh hơn, máy lạnh LG V13ENH1 sẽ là một lựa chọn lý tưởng cho gia đình bạn.', N'Anh13.1.jpg', N'Anh13.2.jpg', N'Anh13.3.jpg', N'Anh13.4.jpg', N'Anh13.5.jpg', N'Anh13.6.jpg', 37, 17, 10730000, 4, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (17, N'Máy lạnh Aqua Inverter 1 HP AQA-KCRV10TR', N'Máy lạnh Aqua Inverter 1 HP AQA-KCRV10TR được hãng Aqua cho ra đời với công nghệ tiết kiệm điện PID Inverter, cùng cơ chế tự làm sạch Self-clean tăng hiệu quả làm sạch cũng như hỗ trợ gia tăng tuổi thọ cho máy.', N'Anh14.1.jpg', N'Anh14.2.jpg', N'Anh14.3.jpg', N'Anh14.4.jpg', N'Anh14.5.jpg', N'Anh14.6.jpg', 13, 39, 8990000, 5, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (18, N'Máy giặt Samsung Inverter 9 kg WW90T634DLN/SV', N'Máy giặt Samsung Inverter 9kg WW90T634DLN/SV thuộc kiểu máy giặt lồng ngang cửa trước với thiết kế gọn đẹp, tích hợp đa dạng chương trình giặt và nhiều công nghệ thông minh như AI Dispenser, bảng điều khiển thông minh AI Control, giặt hơi nước diệt khuẩn Hygiene Steam,… cùng động cơ Digital Inverter vận hành ổn định, tiết kiệm điện năng.', N'Anh15.1.jpg', N'Anh15.2.jpg', N'Anh15.3.jpg', N'Anh15.4.jpg', N'Anh15.5.jpg', N'Anh15.6.jpg', 31, 2, 11490000, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (19, N'Máy giặt LG Inverter 10.5 kg FV1450S3W2', N'máy giặt LG Inverter 10.5 kg FV1450S3W2 phù hợp với gia đình trên 7 người, sở hữu nhiều công nghệ hiện đại như: giặt hơi nước diệt khuẩn, giặt nhanh,... tiết kiệm thời gian cho người sử dụng trong cuộc sống bận rộn hiện nay.', N'16.1.jpg', N'16.2.jpg', N'16.3.jpg', N'16.4.jpg', N'16.5.jpg', N'16.6.jpg', 21, 21, 12490000, 4, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (20, N'Máy giặt Panasonic Inverter 10.5 Kg NA-FD10AR1BV', N'Panasonic Inverter 10.5 Kg NA-FD10AR1BV là một trong những máy giặt lồng đứng phù hợp với những hộ gia đình có trên 7 thành viên. Ngoài việc sở hữu nhiều công nghệ giặt sạch tiên tiến, máy giặt Panasonic này còn mang lại hiệu quả tiết kiệm điện, nước bên cạnh yếu tố vận hành êm ái trong suốt thời gian sử dụng. ', N'17.1.jpg', N'17.2.jpg', N'17.3.jpg', N'17.4.jpg', N'17.5.jpg', N'17.6.jpg', 15, 26, 10590000, 3, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (21, N'Máy giặt Aqua Inverter 8 KG AQD-A800F W ', N'máy giặt Aqua Inverter 8 KG AQD-A800F W là lựa chọn phù hợp cho những gia đình từ 3 - 5 thành viên. Sản phẩm mang lại hiệu quả tiết kiệm điện kèm với khả năng loại bỏ các tác nhân gây dị ứng bám trên quần áo một cách tối ưu, rất phù hợp cho những gia đình có trẻ nhỏ hoặc người có làn da nhạy cảm. ', N'18.1.jpg', N'18.2.jpg', N'18.3.jpg', N'18.4.jpg', N'18.5.jpg', N'18.6.jpg', 10, 18, 6990000, 5, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (22, N'Máy giặt Aqua 8.8 KG AQW-FR88GT.BK', N'Máy giặt Aqua 8,8 KG AQW-FR88GT.BK trang bị nhiều công nghệ hiện đại: Kháng khuẩn ABT, nắp kính cường lực, giảm chấn, đóng mở nhẹ nhàng, lồng giặt, van mực nước thấp… Là một lựa chọn phù hợp cho cho nhu cầu giặt giũ của mọi gia đình.', N'19.1.jpg', N'19.2.jpg', N'19.3.jpg', N'19.4.jpg', N'19.5.jpg', N'19.6.jpg', 15, 22, 5990000, 5, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (23, N'Nồi cơm điện Kangaroo 1.2 lít KG822 đỏ', N'Nồi cơm nắp gài Kangaroo KG822 đỏ sản phẩm đẹp, nấu cơm ngon, dễ sử dụng, hỗ trợ tích cực cho công việc bà nội trợ.', N'20.1.jpg', N'20.2.jpg', N'20.3.jpg', N'20.4.jpg', N'20.5.jpg', N'20.6.jpg', 51, 12, 860000, 6, 6)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (24, N'Nồi cơm điện cao tần Kangaroo 1.8 lít KG599N', N'Nồi cơm điện cao tần Kangaroo KG599N thiết kế đẹp, nhiều tính năng, nấu ăn ngon, hiệu quả, xứng đáng có mặt trong gia đình Việt', N'21.1.jpg', N'21.2.jpg', N'21.3.jpg', N'21.4.jpg', N'21.5.jpg', N'21.6.jpg', 13, 24, 2626000, 6, 6)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (25, N'Nồi cơm điện tử Kangaroo 1.8 lít KG18DR8', N'Nồi cơm điện tử Kangaroo 1.8 lít KG18DR8, thiết kế hiện đại, nhiều chức năng, dùng tốt, chất lượng vượt trội mà giá mềm bất ngờ, là sản phẩm nên có trong mọi nhà', N'22.1.jpg', N'22.2.jpg', N'22.3.jpg', N'22.4.jpg', N'22.5.jpg', N'22.6.jpg', 14, 23, 1686000, 6, 6)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (26, N'Nồi cơm nắp gài Kangaroo 2.2 lít KG22R1', N'Nồi cơm nắp gài Kangaroo KG22R1 2.2 lít đẹp, dễ dùng, thương hiệu tốt, nấu cơm nhanh, lựa chọn tốt cho gia đình đông người.', N'23.1.jpg', N'23.2.jpg', N'23.3.jpg', N'23.4.jpg', N'23.5.jpg', N'23.6.jpg', 10, 23, 932000, 6, 6)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (27, N'Quạt đứng Kangaroo KG725', N'quạt đứng Kangaroo KG725 thương hiệu Kangaroo với 3 mức độ gió cho bạn tùy chỉnh theo nhu cầu, công suất hoạt động 55W với 5 cánh quạt làm mát nhanh chóng, động cơ bạc đạn bền bỉ, hoạt động êm ái, sẽ là một lựa chọn đáng cân nhắc cho gia đình bạn', N'24.1.jpg', N'24.2.jpg', N'24.3.jpg', N'24.4.jpg', N'24.5.jpg', N'24.6.jpg', 13, 20, 1260000, 6, 8)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (47, N'đ', N'đ', N'admin1.jpg', N'admin1.jpg', N'admin1.jpg', N'admin1.jpg', N'admin1.jpg', N'admin1.jpg', 0, 5, 5, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [MoTa], [Anh1], [Anh2], [Anh3], [Anh4], [Anh5], [Anh6], [SoLuongDaBan], [SoLuongTrongKho], [GiaTien], [MaHang], [MaDanhMuc]) VALUES (59, N'Sp123', N'sp123', N'16.1.jpg', N'16.6.jpg', N'16.3.jpg', N'17.1.jpg', N'17.1.jpg', N'17.2.jpg', 10, 0, 1000000, 5, 2)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[TAIKHOAN] ON 

INSERT [dbo].[TAIKHOAN] ([MaTaiKhoan], [Ten], [NgaySinh], [SDT], [DiaChi], [Email], [MatKhau], [MaCV]) VALUES (3, N'Trần Văn Dũng', CAST(N'2022-11-13' AS Date), N'08456613       ', N'Hai Bà Trưng, Hà Nội', N'q3@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[TAIKHOAN] ([MaTaiKhoan], [Ten], [NgaySinh], [SDT], [DiaChi], [Email], [MatKhau], [MaCV]) VALUES (4, N'Trần Doãn Tuấn', CAST(N'2022-11-13' AS Date), N'0123456789     ', N'Hưng Hà, Thái Bình', N'q2@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', 3)
INSERT [dbo].[TAIKHOAN] ([MaTaiKhoan], [Ten], [NgaySinh], [SDT], [DiaChi], [Email], [MatKhau], [MaCV]) VALUES (11, N'Nguyễn Văn Đức', CAST(N'2000-11-08' AS Date), N'0896123456     ', N'Thái bình', N'q1@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[TAIKHOAN] ([MaTaiKhoan], [Ten], [NgaySinh], [SDT], [DiaChi], [Email], [MatKhau], [MaCV]) VALUES (14, N'Nguyễn Hồng Quân', CAST(N'2002-12-16' AS Date), N'0981293743     ', N'Xuân Lộc, Thanh Thủy, Phú Thọ', N'q@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[TAIKHOAN] ([MaTaiKhoan], [Ten], [NgaySinh], [SDT], [DiaChi], [Email], [MatKhau], [MaCV]) VALUES (21, N'Nguyễn Hoàng Nam', CAST(N'2002-01-23' AS Date), N'0971259398     ', N'Hưng Nhân, Hưng Hà, Thái Bình', N'nam@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', 3)
SET IDENTITY_INSERT [dbo].[TAIKHOAN] OFF
GO
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (3, N'Trần Doãn Tuấn', N'Thái Bình', N'0843123456     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (4, N'Trần Doãn Tuấn', N'Thái Bình', N'0843123456     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (5, N'Trần Doãn Tuấn', N'Thái Bình', N'0843123456     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (6, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (7, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (10, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'012345', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (11, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (12, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (150, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (151, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (152, N'Trần Văn Tỉnh', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (153, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (154, N'Trần Doãn Tuấn', N'Hưng Hà, Thái Bình', N'0123456789     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (160, N'gdfsg', N'Xuân Lộc, Thanh Thủy, Phú Thọ', N'0981293743     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (161, N'Nguyễn Thúy Quỳnh', N'Hai Bà Trưng, Hà Nội', N'08456613       ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (162, N'hhh', N'212121', N'0000', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (163, N'hhjjjj', N'Xuân Lộc, Thanh Thủy, Phú Thọ', N'0981293743     ', N'Giao tận nhà')
INSERT [dbo].[VANCHUYEN] ([MaDonHang], [NguoiNhan], [DiaChi], [SDT], [HinhThucVanChuyen]) VALUES (164, N'hhhjjj', N'Xuân Lộc, Thanh Thủy, Phú Thọ', N'0981293743     ', N'Giao tận nhà')
GO
ALTER TABLE [dbo].[CHITIETDONHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONHANG_DONHANG] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONHANG] ([MaDonHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CHITIETDONHANG] CHECK CONSTRAINT [FK_CHITIETDONHANG_DONHANG]
GO
ALTER TABLE [dbo].[CHITIETDONHANG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDONHANG_SANPHAM] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CHITIETDONHANG] CHECK CONSTRAINT [FK_CHITIETDONHANG_SANPHAM]
GO
ALTER TABLE [dbo].[CV_Q_A]  WITH CHECK ADD  CONSTRAINT [FK_CV_Q_A_ActionT] FOREIGN KEY([MaA])
REFERENCES [dbo].[ActionT] ([MaA])
GO
ALTER TABLE [dbo].[CV_Q_A] CHECK CONSTRAINT [FK_CV_Q_A_ActionT]
GO
ALTER TABLE [dbo].[CV_Q_A]  WITH CHECK ADD  CONSTRAINT [FK_CV_Q_A_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[CV_Q_A] CHECK CONSTRAINT [FK_CV_Q_A_ChucVu]
GO
ALTER TABLE [dbo].[CV_Q_A]  WITH CHECK ADD  CONSTRAINT [FK_CV_Q_A_Quyen] FOREIGN KEY([MaQ])
REFERENCES [dbo].[Quyen] ([MaQ])
GO
ALTER TABLE [dbo].[CV_Q_A] CHECK CONSTRAINT [FK_CV_Q_A_Quyen]
GO
ALTER TABLE [dbo].[DANHGIASANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIASANPHAM_SANPHAM] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DANHGIASANPHAM] CHECK CONSTRAINT [FK_DANHGIASANPHAM_SANPHAM]
GO
ALTER TABLE [dbo].[DANHGIASANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIASANPHAM_TAIKHOAN] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([MaTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DANHGIASANPHAM] CHECK CONSTRAINT [FK_DANHGIASANPHAM_TAIKHOAN]
GO
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG_TAIKHOAN] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([MaTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [FK_DONHANG_TAIKHOAN]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SANPHAM] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SANPHAM]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_TAIKHOAN] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TAIKHOAN] ([MaTaiKhoan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_TAIKHOAN]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_DANHMUCSANPHAM] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DANHMUCSANPHAM] ([MaDanhMuc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_DANHMUCSANPHAM]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_HANGSANXUAT] FOREIGN KEY([MaHang])
REFERENCES [dbo].[HANGSANXUAT] ([MaHang])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_HANGSANXUAT]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_ChucVu]
GO
ALTER TABLE [dbo].[VANCHUYEN]  WITH CHECK ADD  CONSTRAINT [FK_VANCHUYEN_DONHANG] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONHANG] ([MaDonHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VANCHUYEN] CHECK CONSTRAINT [FK_VANCHUYEN_DONHANG]
GO
/****** Object:  StoredProcedure [dbo].[TKBYNam]    Script Date: 3/5/2024 9:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TKBYNam]
    @year [int]
AS
BEGIN
    select MONTH(DONHANG.NgayLap) as Thang, SUM(DONHANG.TongTien) as DoanhThu from DONHANG where ( YEAR(DONHANG.NgayLap)= @year and DONHANG.TinhTrang = '3')
    group by MONTH(DONHANG.NgayLap)
END
GO
