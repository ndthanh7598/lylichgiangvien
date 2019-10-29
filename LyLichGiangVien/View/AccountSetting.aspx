<%@ Page Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="AccountSetting.aspx.cs" Inherits="LyLichGiangVien.View.AccountSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<div class="">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="">
				<div class="col-lg-12">
					<h2>Thông tin tài khoản </h2>
					<hr />
					<div class="panel panel-default" style="height: 400px">
						<div class="panel-heading">
							Cập nhật thông tin
						</div>
						<div class="panel-body" style="height: calc(100% - 51px);">
							<form class="form-horizontal col-lg-offset-1 col-lg-9" action="">
								<div class="form-group">
									<label class="control-label col-sm-2">Tên tài khoản</label>
									<div class="col-sm-10">
										<input class="form-control" placeholder="Nhập username ...">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Mật khẩu</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" placeholder="Enter password ...">
									</div>
								</div>


								<div class="form-group">
									<label class="control-label col-sm-2">Trạng thái</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" placeholder="...">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Giảng viên</label>
									<div class="col-sm-10">
										<select class="form-control"></select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Cán bộ</label>
									<div class="col-sm-10">
										<select class="form-control"></select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">Quyền</label>
									<div class="col-sm-10">
										<select class="form-control"></select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-center">
										<button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Cập nhật</button>
										<button type="submit" class="btn btn-default"><i class="fa fa-times" aria-hidden="true"></i> Hủy</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<style type="text/css">
		.welcome-text {
			font-size: 40px;
			margin-top: 10px;
		}

		@media screen and (max-width: 768px) {
			.welcome-text {
				font-size: 30px;
				margin-top: 10px;
				padding-left: 15px;
				padding-right: 15px;
			}
		}

		@media screen and (max-width: 425px) {
			.welcome-text {
				font-size: 25px;
				margin-top: 10px;
				padding-left: 10px;
				padding-right: 10px;
			}
		}
	</style>
</asp:Content>
