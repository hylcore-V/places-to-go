<%@ Page Title="" Language="C#" MasterPageFile="~/PlacesToGo.master" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .header-1-d-none {
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- ============================ User Dashboard ================================== -->
			<section class="error-wrap">
				<div class="container">
					<div class="row justify-content-center">
						
						<div class="col-lg-6 col-md-10">
							<div class="text-center">
								
								<img src="assets/img/404.png" class="img-fluid" alt="">
								<p>Maecenas quis consequat libero, a feugiat eros. Nunc ut lacinia tortor morbi ultricies laoreet ullamcorper phasellus semper</p>
								<a class="btn btn-theme" href="Default.aspx">Back To Home</a>
								
							</div>
						</div>
						
					</div>
				</div>
			</section>
			<!-- ============================ User Dashboard End ================================== -->
			
			<!-- ============================ Call To Action Start ================================== -->
			<section class="call-to-act" style="background:#e4074e url(assets/img/landing-bg.png) no-repeat">
				<div class="container">
					<div class="row justify-content-center">
					
						<div class="col-lg-7 col-md-8">
							<div class="clt-caption text-center mb-4">
								<h3>Subscribe Now!</h3>
								<p>Simple pricing plans. Unlimited web maintenance service</p>
							</div>
							<div class="inner-flexible-box subscribe-box">
								<div class="input-group">
									<input type="text" class="form-control large" placeholder="Enter your mail here">
									<button class="btn btn-subscribe" type="button"><i class="fa fa-arrow-right"></i></button>
								</div>
							</div>
						</div>				
					</div>
				</div>
			</section>
			<!-- ============================ Call To Action End ================================== --> 
</asp:Content>

