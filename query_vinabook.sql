--Dang ky
GO
CREATE PROC sp_DangKy
	@ID varchar(20),
	@PASS varchar(20),
	@Ho_ten nvarchar(50),
	@ngay_sinh datetime,
	@gioi_tinh nvarchar(6),
	@email nvarchar(40)
AS
BEGIN TRANSACTION
	BEGIN TRY
		IF((@ID IS NULL) OR (@PASS IS NULL) OR (@Ho_ten IS NULL) OR (@ngay_sinh IS NULL) OR (@gioi_tinh IS NULL) OR (@email IS NULL))
		BEGIN
			PRINT'Nhap thieu'
			ROLLBACK TRAN
			RETURN
		END
		IF(EXISTS(SELECT * FROM TAI_KHOAN WHERE ID = @ID))
		BEGIN 
			PRINT'Đã có id này'
			ROLLBACK TRAN
			RETURN
		END
		IF(EXISTS(SELECT * FROM TAI_KHOAN WHERE EMAIL = @EMAIL))
		BEGIN
			PRINT'Đã có email này'
			ROLLBACK TRAN
			RETURN
		END
	END TRY
	BEGIN CATCH
		PRINT'lỗi đăng nhập'
		ROLLBACK TRAN
	END CATCH
	DECLARE @STT INT
	SET @STT = (SELECT MAX(MA_TK) FROM TAI_KHOAN) + 1
	IF (@STT is null)
		Set @STT = 0
	INSERT INTO TAI_KHOAN VALUES(@STT,@ID,@PASS,@Ho_ten,@ngay_sinh,@gioi_tinh,@email,0)
	PRINT'Đăng ký thành công'
COMMIT TRAN
--DANG NHAP
GO
CREATE PROC SP_DangNhap
	@user varchar(20),
	@pass varchar(20)
AS
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM TAI_KHOAN WHERE @user = ID)
		BEGIN
			PRINT'Không có tài khoản'
			ROLLBACK TRAN
			RETURN 0
		END
		IF NOT EXISTS(SELECT* FROM TAI_KHOAN WHERE @user = ID AND @pass = PASS)
		BEGIN
			PRINT'Không đúng mật khẩu'
			ROLLBACK TRAN
			RETURN 0
		END
	END TRY
	BEGIN CATCH
		PRINT'Lỗi đăng nhập'
		ROLLBACK TRAN
	END CATCH
	SELECT* FROM TAI_KHOAN WHERE @user = ID AND @pass = PASS
	PRINT'Đăng nhập thành công'
COMMIT TRAN
GO
--kiếm sách theo tên 
CREATE PROC sp_KiemSach @TenSach varchar(50)
AS
BEGIN TRAN 
	SELECT * 
	FROM SACH S
	WHERE S.TEN_SACH LIKE '%'+@TenSach+'%'
COMMIT TRAN

--Them don hang
GO
CREATE PROC sp_ThemDonHang 
	@id varchar(20),
	@code varchar(11),
	@thanhtoan nvarchar(40), 
	@sdt char(10), 
	@so_nha varchar(10),
	@duong varchar(50),
	@quan_huyen varchar(50),
	@tinh_thanh varchar(50),
	@ghi_chu varchar(200)
AS
Declare @ma_tk int = (select MA_TK from TAI_KHOAN where ID = @id)
Declare @ma_giam int = (select MA_GIAM from GIAM_GIA where CODE = @code)
Declare @ma_tt int = (select MA_TT from THANH_TOAN where LOAI_TT = @thanhtoan)
Declare @ma_nv int = (select TOP 1 MA_NV from NHAN_VIEN ORDER BY NEWID())
Declare @ngay_dat datetime = GETDATE()
Declare @tien_ship money = 15000 --giả sử 15k
Declare @tong_tien_hang money = (SELECT SUM(G.so_luong*S.GIA_TIEN)
									FROM gio G,SACH S
									WHERE G.ma_sach = S.MA_SACH and G.matk = @ma_tk
									group by G.matk)
Declare @tong_tien money = @tong_tien_hang + @tien_ship
BEGIN TRANSACTION
	BEGIN TRY
		IF((@ma_tk IS NULL) OR (@Ma_nv IS NULL) OR (@ma_tt IS NULL) OR (@sdt IS NULL) OR (@so_nha IS NULL) OR (@duong IS NULL) OR (@quan_huyen IS NULL) OR (@tinh_thanh IS NULL))
		BEGIN
			PRINT'Nhap thieu'
			ROLLBACK TRAN
			RETURN
		END
	END TRY
	BEGIN CATCH
		PRINT'lỗi thêm đơn hàng'
		ROLLBACK TRAN
	END CATCH
	DECLARE @STT INT = (SELECT MAX(MA_DH)
							FROM DON_HANG) + 1
	INSERT INTO DON_HANG VALUES(@STT,@Ma_nv,@ma_tk,@ma_giam,@ma_tt,@sdt,@so_nha,@duong,@quan_huyen,@tinh_thanh,@ghi_chu,@ngay_dat,@tong_tien_hang,@tien_ship,@tong_tien)
	DECLARE @COUNT INT = (SELECT COUNT(ma_sach)
							FROM gio
							where matk = @ma_tk
							group by matk)
	DECLARE cursorGio CURSOR FOR SELECT ma_sach,so_luong FROM gio where matk = @ma_tk
	OPEN cursorGio
	DECLARE @ma_sach INT
	DECLARE @sl INT
	FETCH NEXT FROM cursorGio INTO @ma_sach, @sl
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO CHI_TIET_DON_HANG VALUES (@STT,@ma_sach,@sl)

		FETCH NEXT FROM cursorGio INTO @ma_sach, @sl
	END
	CLOSE cursorGio
	DEALLOCATE cursorGio
	delete from gio WHERE matk = @ma_tk
	PRINT'Thêm thành công'
COMMIT TRAN

--cap nhat so luong sach trong kho
GO
CREATE PROC sp_CapNhatSoLuongSach
	@ma_sach int,
	@ma_kho int,
	@so_luong int
AS
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS(SELECT*FROM KHO_SACH WHERE @ma_sach = MA_SACH and @ma_kho = MA_KHO) 
		BEGIN
			PRINT'Không có sách trong kho'
			rollback tran
			return
		end
		if(@so_luong = (select so_luong from KHO_SACH where @ma_sach = MA_SACH and @ma_kho = MA_KHO))
		begin
			print'số lượng giống nhau'
			rollback tran
			return
		end
	end try
	begin catch
		print'lỗi cập nhật'
		rollback tran
	end catch
	update KHO_SACH set SO_LUONG = @so_luong where MA_SACH = @ma_sach and MA_KHO = @ma_kho
	print' cap nhat thanh cong'
commit tran

--thong ke theo ngay
drop proc sp_ThongKeDonTheoNgay
GO
create proc sp_ThongKeDonTheoNgay
AS
BEGIN TRAN
	select count(*) as don_hang, NGAY_DAT
	from DON_HANG
	group by NGAY_DAT
	ORDER BY NGAY_DAT DESC 
commit tran

--HỦY DƠN HÀNG
GO
create proc sp_XoaDonHang 
	@ma_dh int
as
begin tran
	begin try
		if not exists(select*from DON_HANG where @ma_dh = MA_DH)
		begin
			print'khong co don hàng cần xóa'
			rollback tran
			return
		end
		if not exists(select*from CHI_TIET_DON_HANG where @ma_dh = MA_DH)
		begin
			print'khong co don hàng cần xóa'
			rollback tran
			return
		end
	end try
	begin catch
		print'loi xóa'
		rollback
	end catch
	delete from CHI_TIET_DON_HANG WHERE @ma_dh = MA_DH
	delete from DON_HANG WHERE @ma_dh = MA_DH
	PRINT'Xóa thành công'
commit tran
--them vao gio
GO
create proc sp_ThemGio
	@id varchar(20),
	@ma_sach int,
	@sl int
as
Declare @matk int = (select MA_TK from TAI_KHOAN where ID = @id)
begin tran
	if exists(select * from gio where @matk = matk and @ma_sach = ma_sach)
		update gio set so_luong = so_luong + @sl where @matk = matk and @ma_sach = ma_sach
	else
		insert into gio values(@matk,@ma_sach,@sl)
	select * from gio where @matk = matk
commit tran
GO
create proc sp_XoaGio
	@id varchar(20),
	@ma_sach int,
	@sl int
as 
Declare @matk int = (select MA_TK from TAI_KHOAN where ID = @id)
begin tran
	 begin try
		if not exists(select * from gio where @matk = matk and @ma_sach = ma_sach)
		begin
			print'không xóa được vì không có'
			rollback tran
			return
		end
		if (@sl > (select so_luong from gio where @matk = matk and @ma_sach = ma_sach))
		begin
			print'không xóa được vì không đúng sl'
			rollback tran
			return
		end
	end try
	begin catch
		print'lỗi xóa'
		rollback tran
	end catch
	if(@sl != (select so_luong from gio where @matk = matk and @ma_sach = ma_sach))
		update gio set so_luong = so_luong - @sl where @matk = matk and @ma_sach = ma_sach
	else
		delete from gio where @matk = matk and @ma_sach = ma_sach
	select * from gio where @matk = matk
commit tran
GO