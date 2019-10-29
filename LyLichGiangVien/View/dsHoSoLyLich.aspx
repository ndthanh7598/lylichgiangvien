<%@ Page Title="Hồ sơ lý lịch" Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="dsHoSoLyLich.aspx.cs" Inherits="LyLichGiangVien.View.dsHoSoLyLich" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<div class="">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="">
				<div class="col-lg-12">
					<h2>Hồ sơ lý lịch </h2>
					<hr />
					<div class="panel panel-default" style="height: 435px">
						<div class="panel-heading">
							Danh sách hồ sơ lý lịch 
						</div>
						<div class="panel-body" style="height: calc(100% - 51px);">
							<div class="filter" style="height: 50px">
								<div class="col-lg-6" style="display: flex; flex-flow: inherit; padding: 0px">
									<input placeholder="Nhập từ khóa ..." class="form-control" />
									<button title="Xóa" class="btn btn-sm btn-primary-outline">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="grid" style="height: calc(100% - 50px);">
								<table class="table table-striped table-bordered table-responsive" style="height: 200px">
									<thead>
										<tr>
											<th scope="col">STT</th>
											<th scope="col">TênGV</th>
											<th scope="col">Giới tính</th>
											<th scope="col">Đơn vị</th>
											<th scope="col">Học hàm</th>
											<th scope="col">ĐTNC</th>
											<th scope="col">Bắt đầu</th>
											<th scope="col">Kết thúc</th>
											<th scope="col">Giải thưởng</th>
											<th scope="col">Trạng thái</th>
											<th scope="col">Hành động</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>NHQ</td>
											<td>Nam</td>
											<td>FITHOU</td>
											<td>GS</td>
											<td>Mark</td>
											<td>Otto</td>
											<td>Mark</td>
											<td>Otto</td>
											<td>Mark</td>
											<td>
												<button>
													<i class="fa fa-trash" aria-hidden="true"></i>
												</button>
												<button>
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>NTA</td>
											<td>Nam</td>
											<td>FITHOU</td>
											<td>GS</td>
											<td>X</td>
											<td>S</td>
											<td>M</td>
											<td>B</td>
											<td>fat</td>
											<td>
												<button>
													<i class="fa fa-trash" aria-hidden="true"></i>
												</button>
												<button>
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>TMV</td>
											<td>Nam</td>
											<td>FITHOU</td>
											<td>GS</td>
											<td>twitter</td>
											<td>twitter</td>
											<td>twitter</td>
											<td>twitter</td>
											<td>twitter</td>
											<td>
												<button>
													<i class="fa fa-trash" aria-hidden="true"></i>
												</button>
												<button>
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>NCP</td>
											<td>Nam</td>
											<td>@FITHOU</td>
											<td>@GS</td>
											<td>@twitter</td>
											<td>@twitter</td>
											<td>@twitter</td>
											<td>@twitter</td>
											<td>@twitter</td>
											<td>
												<button>
													<i class="fa fa-trash" aria-hidden="true"></i>
												</button>
												<button>
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row">4</th>
											<td>D.T</td>
											<td>Nam</td>
											<td>FITHOU</td>
											<td>GS</td>
											<td>twitter</td>
											<td>twitter</td>
											<td>twitter</td>
											<td>twitter</td>
											<td>twitter</td>
											<td>
												<button>
													<i class="fa fa-trash" aria-hidden="true"></i>
												</button>
												<button>
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</button>
											</td>
										</tr>
										<tr>
											<th scope="row">5</th>
											<td>MX</td>
											<td>Nam</td>
											<td>FITHOU</td>
											<td>GS</td>
											<td>Tt</td>
											<td>Tt</td>
											<td>Tt</td>
											<td>Tt</td>
											<td>Tt</td>
											<td>
												<button>
													<i class="fa fa-trash" aria-hidden="true"></i>
												</button>
												<button>
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
								<ul class="pagination" style="margin:0px">
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
								</ul>
							</div>
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
