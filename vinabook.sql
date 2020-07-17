/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     11/20/2019 9:13:09 PM                        */
/*==============================================================*/
CREATE DATABASE VINABOOK
GO
USE VINABOOK
GO
if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET_DON_HANG') and o.name = 'FK_CHI_TIET_CHI_TIET__DON_HANG')
alter table CHI_TIET_DON_HANG
   drop constraint FK_CHI_TIET_CHI_TIET__DON_HANG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET_DON_HANG') and o.name = 'FK_CHI_TIET_CHI_TIET__SACH')
alter table CHI_TIET_DON_HANG
   drop constraint FK_CHI_TIET_CHI_TIET__SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DICH_SACH') and o.name = 'FK_DICH_SAC_DICH_SACH_TAC_GIA')
alter table DICH_SACH
   drop constraint FK_DICH_SAC_DICH_SACH_TAC_GIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DICH_SACH') and o.name = 'FK_DICH_SAC_DICH_SACH_SACH')
alter table DICH_SACH
   drop constraint FK_DICH_SAC_DICH_SACH_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DON_HANG') and o.name = 'FK_DON_HANG_GIAO_HANG_NHAN_VIE')
alter table DON_HANG
   drop constraint FK_DON_HANG_GIAO_HANG_NHAN_VIE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DON_HANG') and o.name = 'FK_DON_HANG_SU_DUNG_GIAM_GIA')
alter table DON_HANG
   drop constraint FK_DON_HANG_SU_DUNG_GIAM_GIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DON_HANG') and o.name = 'FK_DON_HANG_THANH_TOA_THANH_TO')
alter table DON_HANG
   drop constraint FK_DON_HANG_THANH_TOA_THANH_TO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DON_HANG') and o.name = 'FK_DON_HANG_THUOC_VE_TAI_KHOA')
alter table DON_HANG
   drop constraint FK_DON_HANG_THUOC_VE_TAI_KHOA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KHO') and o.name = 'FK_KHO_QUAN_LY_NHAN_VIE')
alter table KHO
   drop constraint FK_KHO_QUAN_LY_NHAN_VIE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KHO_SACH') and o.name = 'FK_KHO_SACH_KHO_SACH_SACH')
alter table KHO_SACH
   drop constraint FK_KHO_SACH_KHO_SACH_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KHO_SACH') and o.name = 'FK_KHO_SACH_KHO_SACH2_KHO')
alter table KHO_SACH
   drop constraint FK_KHO_SACH_KHO_SACH2_KHO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHAN_VIEN') and o.name = 'FK_NHAN_VIE_LAM_VIEC_KHO')
alter table NHAN_VIEN
   drop constraint FK_NHAN_VIE_LAM_VIEC_KHO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHAN_VIEN') and o.name = 'FK_NHAN_VIE_QUAN_LY2_KHO')
alter table NHAN_VIEN
   drop constraint FK_NHAN_VIE_QUAN_LY2_KHO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHAN_VIEN') and o.name = 'FK_NHAN_VIE_THUOC_LOA_LOAI_NV')
alter table NHAN_VIEN
   drop constraint FK_NHAN_VIE_THUOC_LOA_LOAI_NV
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHAN_XET') and o.name = 'FK_NHAN_XET_NHAN_XET_TAI_KHOA')
alter table NHAN_XET
   drop constraint FK_NHAN_XET_NHAN_XET_TAI_KHOA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NHAN_XET') and o.name = 'FK_NHAN_XET_NHAN_XET2_SACH')
alter table NHAN_XET
   drop constraint FK_NHAN_XET_NHAN_XET2_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH') and o.name = 'FK_SACH_PHAT_HANH_NPH')
alter table SACH
   drop constraint FK_SACH_PHAT_HANH_NPH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH') and o.name = 'FK_SACH_XUAT_BAN__NXB')
alter table SACH
   drop constraint FK_SACH_XUAT_BAN__NXB
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TG_SACH') and o.name = 'FK_TG_SACH_TG_SACH_TAC_GIA')
alter table TG_SACH
   drop constraint FK_TG_SACH_TG_SACH_TAC_GIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TG_SACH') and o.name = 'FK_TG_SACH_TG_SACH2_SACH')
alter table TG_SACH
   drop constraint FK_TG_SACH_TG_SACH2_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TL_SACH') and o.name = 'FK_TL_SACH_TL_SACH_SACH')
alter table TL_SACH
   drop constraint FK_TL_SACH_TL_SACH_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TL_SACH') and o.name = 'FK_TL_SACH_TL_SACH2_THE_LOAI')
alter table TL_SACH
   drop constraint FK_TL_SACH_TL_SACH2_THE_LOAI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHI_TIET_DON_HANG')
            and   name  = 'CHI_TIET_DON_HANG2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHI_TIET_DON_HANG.CHI_TIET_DON_HANG2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CHI_TIET_DON_HANG')
            and   name  = 'CHI_TIET_DON_HANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index CHI_TIET_DON_HANG.CHI_TIET_DON_HANG_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHI_TIET_DON_HANG')
            and   type = 'U')
   drop table CHI_TIET_DON_HANG
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DICH_SACH')
            and   name  = 'DICH_SACH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index DICH_SACH.DICH_SACH2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DICH_SACH')
            and   name  = 'DICH_SACH_FK'
            and   indid > 0
            and   indid < 255)
   drop index DICH_SACH.DICH_SACH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DICH_SACH')
            and   type = 'U')
   drop table DICH_SACH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DON_HANG')
            and   name  = 'GIAO_HANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index DON_HANG.GIAO_HANG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DON_HANG')
            and   name  = 'THANH_TOAN_BANG_FK'
            and   indid > 0
            and   indid < 255)
   drop index DON_HANG.THANH_TOAN_BANG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DON_HANG')
            and   name  = 'SU_DUNG_FK'
            and   indid > 0
            and   indid < 255)
   drop index DON_HANG.SU_DUNG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DON_HANG')
            and   name  = 'THUOC_VE_FK'
            and   indid > 0
            and   indid < 255)
   drop index DON_HANG.THUOC_VE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DON_HANG')
            and   type = 'U')
   drop table DON_HANG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GIAM_GIA')
            and   type = 'U')
   drop table GIAM_GIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KHO')
            and   name  = 'QUAN_LY_FK'
            and   indid > 0
            and   indid < 255)
   drop index KHO.QUAN_LY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHO')
            and   type = 'U')
   drop table KHO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KHO_SACH')
            and   name  = 'KHO_SACH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index KHO_SACH.KHO_SACH2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KHO_SACH')
            and   name  = 'KHO_SACH_FK'
            and   indid > 0
            and   indid < 255)
   drop index KHO_SACH.KHO_SACH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KHO_SACH')
            and   type = 'U')
   drop table KHO_SACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOAI_NV')
            and   type = 'U')
   drop table LOAI_NV
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHAN_VIEN')
            and   name  = 'LAM_VIEC_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHAN_VIEN.LAM_VIEC_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHAN_VIEN')
            and   name  = 'QUAN_LY2_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHAN_VIEN.QUAN_LY2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHAN_VIEN')
            and   name  = 'THUOC_LOAI_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHAN_VIEN.THUOC_LOAI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHAN_VIEN')
            and   type = 'U')
   drop table NHAN_VIEN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHAN_XET')
            and   name  = 'NHAN_XET2_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHAN_XET.NHAN_XET2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('NHAN_XET')
            and   name  = 'NHAN_XET_FK'
            and   indid > 0
            and   indid < 255)
   drop index NHAN_XET.NHAN_XET_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NHAN_XET')
            and   type = 'U')
   drop table NHAN_XET
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NPH')
            and   type = 'U')
   drop table NPH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NXB')
            and   type = 'U')
   drop table NXB
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SACH')
            and   name  = 'PHAT_HANH_BOI_FK'
            and   indid > 0
            and   indid < 255)
   drop index SACH.PHAT_HANH_BOI_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SACH')
            and   name  = 'XUAT_BAN_BOI_FK'
            and   indid > 0
            and   indid < 255)
   drop index SACH.XUAT_BAN_BOI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SACH')
            and   type = 'U')
   drop table SACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAC_GIA')
            and   type = 'U')
   drop table TAC_GIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAI_KHOAN')
            and   type = 'U')
   drop table TAI_KHOAN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TG_SACH')
            and   name  = 'TG_SACH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TG_SACH.TG_SACH2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TG_SACH')
            and   name  = 'TG_SACH_FK'
            and   indid > 0
            and   indid < 255)
   drop index TG_SACH.TG_SACH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TG_SACH')
            and   type = 'U')
   drop table TG_SACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THANH_TOAN')
            and   type = 'U')
   drop table THANH_TOAN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THE_LOAI')
            and   type = 'U')
   drop table THE_LOAI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TL_SACH')
            and   name  = 'TL_SACH2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TL_SACH.TL_SACH2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TL_SACH')
            and   name  = 'TL_SACH_FK'
            and   indid > 0
            and   indid < 255)
   drop index TL_SACH.TL_SACH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TL_SACH')
            and   type = 'U')
   drop table TL_SACH
go

/*==============================================================*/
/* Table: CHI_TIET_DON_HANG                                     */
/*==============================================================*/
create table CHI_TIET_DON_HANG (
   MA_DH                int                  not null,
   MA_SACH              int                  not null,
   SO_LUONG             int                  null,
   constraint PK_CHI_TIET_DON_HANG primary key (MA_DH, MA_SACH)
)
go

/*==============================================================*/
/* Index: CHI_TIET_DON_HANG_FK                                  */
/*==============================================================*/




create nonclustered index CHI_TIET_DON_HANG_FK on CHI_TIET_DON_HANG (MA_DH ASC)
go

/*==============================================================*/
/* Index: CHI_TIET_DON_HANG2_FK                                 */
/*==============================================================*/




create nonclustered index CHI_TIET_DON_HANG2_FK on CHI_TIET_DON_HANG (MA_SACH ASC)
go

/*==============================================================*/
/* Table: DICH_SACH                                             */
/*==============================================================*/
create table DICH_SACH (
   MA_TG                int                  not null,
   MA_SACH              int                  not null,
   constraint PK_DICH_SACH primary key (MA_TG, MA_SACH)
)
go

/*==============================================================*/
/* Index: DICH_SACH_FK                                          */
/*==============================================================*/




create nonclustered index DICH_SACH_FK on DICH_SACH (MA_TG ASC)
go

/*==============================================================*/
/* Index: DICH_SACH2_FK                                         */
/*==============================================================*/




create nonclustered index DICH_SACH2_FK on DICH_SACH (MA_SACH ASC)
go

/*==============================================================*/
/* Table: DON_HANG                                              */
/*==============================================================*/
create table DON_HANG (
   MA_DH                int                  not null,
   MA_NV                int                  null,
   MA_TK                int                  null,
   MA_GIAM              int                  null,
   MA_TT                int                  null,
   SDT                  char(10)             null,
   SO_NHA               varchar(10)          null,
   DUONG                varchar(50)         null,
   QUAN_HUYEN           varchar(50)         null,
   TINH_THANH           varchar(50)         null,
   GHI_CHU              varchar(200)         null,
   NGAY_DAT             datetime             null,
   TONG_TIEN_HANG       money                null,
   TIEN_SHIP            money                null,
   TONG_TIEN            money                null,
   constraint PK_DON_HANG primary key (MA_DH)
)
go

/*==============================================================*/
/* Index: THUOC_VE_FK                                           */
/*==============================================================*/




create nonclustered index THUOC_VE_FK on DON_HANG (MA_TK ASC)
go

/*==============================================================*/
/* Index: SU_DUNG_FK                                            */
/*==============================================================*/




create nonclustered index SU_DUNG_FK on DON_HANG (MA_GIAM ASC)
go

/*==============================================================*/
/* Index: THANH_TOAN_BANG_FK                                    */
/*==============================================================*/




create nonclustered index THANH_TOAN_BANG_FK on DON_HANG (MA_TT ASC)
go

/*==============================================================*/
/* Index: GIAO_HANG_FK                                          */
/*==============================================================*/




create nonclustered index GIAO_HANG_FK on DON_HANG (MA_NV ASC)
go

/*==============================================================*/
/* Table: GIAM_GIA                                              */
/*==============================================================*/
create table GIAM_GIA (
   MA_GIAM              int                  not null,
   CODE                 varchar(11)          null,
   TI_LE_GIAM           float                null,
   NGAY_BD              datetime             null,
   NGAY_KT              datetime             null,
   NOI_DUNG             nvarchar(20)         null,
   constraint PK_GIAM_GIA primary key (MA_GIAM)
)
go

/*==============================================================*/
/* Table: KHO                                                   */
/*==============================================================*/
create table KHO (
   MA_KHO               int                  not null,
   MA_NV                int                  null,
   TEN_KHO              nvarchar(10)         null,
   SO_NHA               varchar(10)          null,
   DUONG                nvarchar(30)         null,
   QUAN_HUYEN           nvarchar(20)         null,
   TINH_THANH           nvarchar(20)         null,
   constraint PK_KHO primary key (MA_KHO)
)
go

/*==============================================================*/
/* Index: QUAN_LY_FK                                            */
/*==============================================================*/




create nonclustered index QUAN_LY_FK on KHO (MA_NV ASC)
go

/*==============================================================*/
/* Table: KHO_SACH                                              */
/*==============================================================*/
create table KHO_SACH (
   MA_SACH              int                  not null,
   MA_KHO               int                  not null,
   SO_LUONG             int                  null,
   constraint PK_KHO_SACH primary key (MA_SACH, MA_KHO)
)
go

/*==============================================================*/
/* Index: KHO_SACH_FK                                           */
/*==============================================================*/




create nonclustered index KHO_SACH_FK on KHO_SACH (MA_SACH ASC)
go

/*==============================================================*/
/* Index: KHO_SACH2_FK                                          */
/*==============================================================*/




create nonclustered index KHO_SACH2_FK on KHO_SACH (MA_KHO ASC)
go

/*==============================================================*/
/* Table: LOAI_NV                                               */
/*==============================================================*/
create table LOAI_NV (
   MA_LOAI              int                  not null,
   TEN_LOAI             nvarchar(40)         null,
   LUONG                int                  null,
   constraint PK_LOAI_NV primary key (MA_LOAI)
)
go

/*==============================================================*/
/* Table: NHAN_VIEN                                             */
/*==============================================================*/
create table NHAN_VIEN (
   MA_NV                int                  not null,
   MA_LOAI              int                  null,
   MA_KHO               int                  null,
   HO_TEN               varchar(50)         null,
   SDT                  char(10)             null,
   CMND                 varchar(12)          null,
   constraint PK_NHAN_VIEN primary key (MA_NV)
)
go

/*==============================================================*/
/* Index: THUOC_LOAI_FK                                         */
/*==============================================================*/




create nonclustered index THUOC_LOAI_FK on NHAN_VIEN (MA_LOAI ASC)
go

/*==============================================================*/
/* Index: QUAN_LY2_FK                                           */
/*==============================================================*/





/*==============================================================*/
/* Index: LAM_VIEC_FK                                           */
/*==============================================================*/




create nonclustered index LAM_VIEC_FK on NHAN_VIEN (MA_KHO ASC)
go

/*==============================================================*/
/* Table: NHAN_XET                                              */
/*==============================================================*/
create table NHAN_XET (
   MA_NX				int					 not null,
   MA_TK                int                  not null,
   MA_SACH              int                  not null,
   NOI_DUNG				varchar(50)		 not null,
   constraint PK_NHAN_XET primary key (MA_TK, MA_SACH)
)
go

/*==============================================================*/
/* Index: NHAN_XET_FK                                           */
/*==============================================================*/




create nonclustered index NHAN_XET_FK on NHAN_XET (MA_TK ASC)
go

/*==============================================================*/
/* Index: NHAN_XET2_FK                                          */
/*==============================================================*/




create nonclustered index NHAN_XET2_FK on NHAN_XET (MA_SACH ASC)
go

/*==============================================================*/
/* Table: NPH                                                   */
/*==============================================================*/
create table NPH (
   MA_NPH               int                  not null,
   TEN_NPH              varchar(50)         null,
   GIOI_THIEU           varchar(200)        null,
   constraint PK_NPH primary key (MA_NPH)
)
go

/*==============================================================*/
/* Table: NXB                                                   */
/*==============================================================*/
create table NXB (
   MA_NXB               int                  not null,
   TEN_NXB              varchar(50)         null,
   GIOI_THIEU           varchar(200)        null,
   constraint PK_NXB primary key (MA_NXB)
)
go

/*==============================================================*/
/* Table: SACH                                                  */
/*==============================================================*/
create table SACH (
   MA_SACH              int                  not null,
   MA_NXB               int                  null,
   MA_NPH               int                  null,
   TEN_SACH             varchar(50)         null,
   GIOI_THIEU           varchar(200)        null,
   CHIEU_RONG           tinyint              null,
   CHIEU_DAI            tinyint              null,
   SO_TRANG             smallint             null,
   KHOI_LUONG           smallint             null,
   CHAT_LUONG           char(1)              null,
   NGAY_PHAT_HANH       datetime             null,
   DINH_DANG            bit                  null,
   DIEM_DANH_GIA        float                null,
   GIA_TIEN             money                null,
   GIAM_GIA             float                null,
   constraint PK_SACH primary key (MA_SACH)
)
go

/*==============================================================*/
/* Index: XUAT_BAN_BOI_FK                                       */
/*==============================================================*/




create nonclustered index XUAT_BAN_BOI_FK on SACH (MA_NXB ASC)
go

/*==============================================================*/
/* Index: PHAT_HANH_BOI_FK                                      */
/*==============================================================*/




create nonclustered index PHAT_HANH_BOI_FK on SACH (MA_NPH ASC)
go

/*==============================================================*/
/* Table: TAC_GIA                                               */
/*==============================================================*/
create table TAC_GIA (
   MA_TG                int                  not null,
   TEN_TG               varchar(50)         null,
   GIOI_THIEU           varchar(200)        null,
   constraint PK_TAC_GIA primary key (MA_TG)
)
go

/*==============================================================*/
/* Table: TAI_KHOAN                                             */
/*==============================================================*/
create table TAI_KHOAN (
   MA_TK                int                  not null,
   ID                   varchar(20)          null,
   PASS                 varchar(20)          null,
   HO_TEN               nvarchar(50)         null,
   NGAY_SINH            datetime             null,
   GIOI_TINH            nvarchar(6)          null,
   EMAIL                nvarchar(40)         null,
   DIEM_TICH_LUY        int                  null,
   constraint PK_TAI_KHOAN primary key (MA_TK)
)
go

/*==============================================================*/
/* Table: TG_SACH                                               */
/*==============================================================*/
create table TG_SACH (
   MA_TG                int                  not null,
   MA_SACH              int                  not null,
   constraint PK_TG_SACH primary key (MA_TG, MA_SACH)
)
go

/*==============================================================*/
/* Index: TG_SACH_FK                                            */
/*==============================================================*/




create nonclustered index TG_SACH_FK on TG_SACH (MA_TG ASC)
go

/*==============================================================*/
/* Index: TG_SACH2_FK                                           */
/*==============================================================*/




create nonclustered index TG_SACH2_FK on TG_SACH (MA_SACH ASC)
go

/*==============================================================*/
/* Table: THANH_TOAN                                            */
/*==============================================================*/
create table THANH_TOAN (
   MA_TT                int                  not null,
   LOAI_TT              nvarchar(40)         null,
   constraint PK_THANH_TOAN primary key (MA_TT)
)
go

/*==============================================================*/
/* Table: THE_LOAI                                              */
/*==============================================================*/
create table THE_LOAI (
   MA_TL                int                  not null,
   TEN_TL               nvarchar(40)         null,
   constraint PK_THE_LOAI primary key (MA_TL)
)
go

/*==============================================================*/
/* Table: TL_SACH                                               */
/*==============================================================*/
create table TL_SACH (
   MA_SACH              int                  not null,
   MA_TL                int                  not null,
   constraint PK_TL_SACH primary key (MA_SACH, MA_TL)
)
go
--Gio
create table gio(
	matk int not null,
	ma_sach int not null,
	so_luong int not null,
	constraint PK_gio primary key (matk, ma_sach)
)
go
/*==============================================================*/
/* Index: TL_SACH_FK                                            */
/*==============================================================*/




create nonclustered index TL_SACH_FK on TL_SACH (MA_SACH ASC)
go

/*==============================================================*/
/* Index: TL_SACH2_FK                                           */
/*==============================================================*/




create nonclustered index TL_SACH2_FK on TL_SACH (MA_TL ASC)
go

alter table CHI_TIET_DON_HANG
   add constraint FK_CHI_TIET_CHI_TIET__DON_HANG foreign key (MA_DH)
      references DON_HANG (MA_DH)
go

alter table CHI_TIET_DON_HANG
   add constraint FK_CHI_TIET_CHI_TIET__SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table DICH_SACH
   add constraint FK_DICH_SAC_DICH_SACH_TAC_GIA foreign key (MA_TG)
      references TAC_GIA (MA_TG)
go

alter table DICH_SACH
   add constraint FK_DICH_SAC_DICH_SACH_SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table DON_HANG
   add constraint FK_DON_HANG_GIAO_HANG_NHAN_VIE foreign key (MA_NV)
      references NHAN_VIEN (MA_NV)
go

alter table DON_HANG
   add constraint FK_DON_HANG_SU_DUNG_GIAM_GIA foreign key (MA_GIAM)
      references GIAM_GIA (MA_GIAM)
go

alter table DON_HANG
   add constraint FK_DON_HANG_THANH_TOA_THANH_TO foreign key (MA_TT)
      references THANH_TOAN (MA_TT)
go

alter table DON_HANG
   add constraint FK_DON_HANG_THUOC_VE_TAI_KHOA foreign key (MA_TK)
      references TAI_KHOAN (MA_TK)
go

alter table KHO
   add constraint FK_KHO_QUAN_LY_NHAN_VIE foreign key (MA_NV)
      references NHAN_VIEN (MA_NV)
go

alter table KHO_SACH
   add constraint FK_KHO_SACH_KHO_SACH_SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table KHO_SACH
   add constraint FK_KHO_SACH_KHO_SACH2_KHO foreign key (MA_KHO)
      references KHO (MA_KHO)
go

alter table NHAN_VIEN
   add constraint FK_NHAN_VIE_LAM_VIEC_KHO foreign key (MA_KHO)
      references KHO (MA_KHO)
go

alter table NHAN_VIEN
   add constraint FK_NHAN_VIE_THUOC_LOA_LOAI_NV foreign key (MA_LOAI)
      references LOAI_NV (MA_LOAI)
go

alter table NHAN_XET
   add constraint FK_NHAN_XET_NHAN_XET_TAI_KHOA foreign key (MA_TK)
      references TAI_KHOAN (MA_TK)
go

alter table NHAN_XET
   add constraint FK_NHAN_XET_NHAN_XET2_SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table SACH
   add constraint FK_SACH_PHAT_HANH_NPH foreign key (MA_NPH)
      references NPH (MA_NPH)
go

alter table SACH
   add constraint FK_SACH_XUAT_BAN__NXB foreign key (MA_NXB)
      references NXB (MA_NXB)
go

alter table TG_SACH
   add constraint FK_TG_SACH_TG_SACH_TAC_GIA foreign key (MA_TG)
      references TAC_GIA (MA_TG)
go

alter table TG_SACH
   add constraint FK_TG_SACH_TG_SACH2_SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table TL_SACH
   add constraint FK_TL_SACH_TL_SACH_SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table TL_SACH
   add constraint FK_TL_SACH_TL_SACH2_THE_LOAI foreign key (MA_TL)
      references THE_LOAI (MA_TL)
go

