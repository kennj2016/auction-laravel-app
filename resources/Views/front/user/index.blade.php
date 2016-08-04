@extends('front._master')

@section('css')
    <link rel="stylesheet" href="/admin/core/third_party/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
@endsection

@section('js')
    <script type="text/javascript" src="/admin/core/third_party/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
@endsection

@section('js-init')
    <script type="text/javascript">
        $(document).ready(function () {
            $('.js-date-picker').datepicker({
                orientation: "left",
                autoclose: true
            });
        });
        $(document).on('click', '#close-preview', function(){ 
		    $('.image-preview').popover('hide');
		    // Hover befor close the preview
		    $('.image-preview').hover(
		        function () {
		           $('.image-preview').popover('show');
		        }, 
		         function () {
		           $('.image-preview').popover('hide');
		        }
		    );    
		});

		$(function() {
		    // Create the close button
		    var closebtn = $('<button/>', {
		        type:"button",
		        text: 'x',
		        id: 'close-preview',
		        style: 'font-size: initial;',
		    });
		    closebtn.attr("class","close pull-right");
		    // Set the popover default content
		    $('.image-preview').popover({
		        trigger:'manual',
		        html:true,
		        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
		        content: "There's no image",
		        placement:'bottom'
		    });
		    // Clear event
		    $('.image-preview-clear').click(function(){
		        $('.image-preview').attr("data-content","").popover('hide');
		        $('.image-preview-filename').val("");
		        $('.image-preview-clear').hide();
		        $('.image-preview-input input:file').val("");
		        $(".image-preview-input-title").text("Browse"); 
		    }); 
		    // Create the preview image
		    $(".image-preview-input input:file").change(function (){     
		        var img = $('<img/>', {
		            id: 'dynamic',
		            width:250,
		            height:200
		        });      
		        var file = this.files[0];
		        var reader = new FileReader();
		        // Set preview image into the popover data-content
		        reader.onload = function (e) {
		            $(".image-preview-input-title").text("Change");
		            $(".image-preview-clear").show();
		            $(".image-preview-filename").val(file.name);            
		            img.attr('src', e.target.result);
		            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
		        }        
		        reader.readAsDataURL(file);
		    });  
		});
    </script>
@endsection

@section('content')
<div class="page-head">
    <h3>My account</h3>
</div>
<div class="container">
	<div class="row profile">
        <div class="col-md-4">
            <!-- BEGIN PROFILE SIDEBAR -->
            <div class="profile-sidebar">
                <!-- PORTLET MAIN -->
                <div class="portlet light profile-sidebar-portlet pad-bot-20">
                    <!-- SIDEBAR USERPIC -->
                    <div class="profile-userpic">
                        <img src="{{ (isset($loggedInUser) && $loggedInUser->avatar) ? $loggedInUser->avatar : '/admin/images/no-image.png' }}" class="img-responsive" alt=""></div>
                    <!-- END SIDEBAR USERPIC -->
                    <!-- SIDEBAR USER TITLE -->
                    <div class="profile-usertitle">
                        <div class="profile-usertitle-name">{{ $loggedInUser->first_name or '' }} {{ $loggedInUser->last_name or '' }}</div>
                    </div>
                    <!-- END SIDEBAR USER TITLE -->
                </div>
                <!-- END PORTLET MAIN -->
            </div>
            <!-- END BEGIN PROFILE SIDEBAR -->
        </div>
        <div class="col-md-8">
            <!-- BEGIN PROFILE CONTENT -->
            <div class="profile-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="caption">
                                    <i class="icon-globe theme-font hide"></i>
                                    <span class="caption-subject font-dark bold uppercase">Profile Account</span>
                                </div>
                                <span class="pull-right">
	                                <ul class="nav panel-tabs">
	                                    <li class="active">
	                                        <a href="#tab_1_1" data-toggle="tab">Personal Info</a>
	                                    </li>
	                                    <li>
	                                        <a href="#tab_1_2" data-toggle="tab">Change Avatar</a>
	                                    </li>
	                                    <li>
	                                        <a href="#tab_1_3" data-toggle="tab">Change Password</a>
	                                    </li>
	                                    <div class="cleafix"></div>
	                                </ul>
                                </span>
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <!-- PERSONAL INFO TAB -->
                                    <div class="tab-pane active" id="tab_1_1">
                                        <form class="js-validate-form" method="POST" accept-charset="utf-8" action="{{ action('Front\UserController@postEdit') }}">
                                            {!! csrf_field() !!}
                                            <div class="form-group">
                                                <label class="control-label "><b>Email</b></label>
                                                <input type="text" value="{{ $loggedInUser->email or '' }}"
                                                       name="email"
                                                       autocomplete="off"
                                                       {{ isset($loggedInUser) && $loggedInUser->id != 0 ? 'disabled' : '' }}
                                                       class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label "><b>First name</b></label>
                                                <input type="text" value="{{ $loggedInUser->first_name or '' }}"
                                                       name="first_name"
                                                       autocomplete="off"
                                                       class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label"><b>Last name</b></label>
                                                <input type="text" value="{{ $loggedInUser->last_name or '' }}"
                                                       name="last_name"
                                                       autocomplete="off"
                                                       class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label"><b>Phone</b></label>
                                                <input type="text" value="{{ $loggedInUser->phone or '' }}"
                                                       name="phone"
                                                       autocomplete="off"
                                                       class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label"><b>Birthday</b></label>
                                                <input type="text" value="{{ $loggedInUser->date_of_birth or '' }}"
                                                       name="date_of_birth"
                                                       data-date-format="yyyy-mm-dd"
                                                       autocomplete="off"
                                                       readonly
                                                       class="form-control js-date-picker"/>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label"><b>Sex</b></label>
                                                <br>
                                                <label>
                                                    <input type="radio" name="sex" value="1"
                                                            {{ (isset($loggedInUser) && $loggedInUser->sex == 1) ? 'checked' : '' }}> Male
                                                </label>
                                                <label>
                                                    <input type="radio" name="sex" value="0"
                                                            {{ (!isset($loggedInUser) || $loggedInUser->sex == 0 || !$loggedInUser->sex) ? 'checked' : '' }}> Female
                                                </label>
                                                <label>
                                                    <input type="radio" name="sex" value="2"
                                                            {{ (isset($loggedInUser) && $loggedInUser->sex == 2) ? 'checked' : '' }}> Other
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label"><b>About</b></label>
                                                <textarea class="form-control"
                                                          name="description"
                                                          rows="3">{!! $loggedInUser->description or '' !!}</textarea>
                                            </div>
                                            <div class="mar-top-10">
                                                <button type="submit" class="btn  btn-success">Save Changes</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- END PERSONAL INFO TAB -->
                                    <!-- CHANGE AVATAR TAB -->
                                    <div class="tab-pane" id="tab_1_2">
                                        <form class="js-validate-form-change-avatar" enctype="multipart/form-data" method="POST" accept-charset="utf-8" action="{{ action('Front\UserController@postEdit') }}"
                                              novalidate>
                                            {!! csrf_field() !!}
                           
                                            <div class="input-group image-preview">
								                <input type="text" class="form-control image-preview-filename" disabled="disabled"> 
								                <span class="input-group-btn">
								                    <!-- image-preview-clear button -->
								                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
								                        <span class="glyphicon glyphicon-remove"></span> Clear
								                    </button>
								                    <!-- image-preview-input -->
								                    <div class="btn btn-default image-preview-input">
								                        <span class="glyphicon glyphicon-folder-open"></span>
								                        <span class="image-preview-input-title">Browse</span>
								                        <input type="file" accept="image/png, image/jpeg, image/gif" name="avatar"/>
								                    </div>
								                </span>
								            </div>
                                            <div class="mar-top-10">
                                                <button type="submit" class="btn btn-success">Save Changes</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- END CHANGE AVATAR TAB -->
                                    <!-- CHANGE PASSWORD TAB -->
                                    <div class="tab-pane" id="tab_1_3">
                                        <form class="js-validate-form-change-password" method="POST" accept-charset="utf-8" action="{{ action('Front\UserController@postEdit') }}">
                                            {{ csrf_field() }}
                                            <div class="form-group">
                                                <label><b>Old password <span class="text-danger">(*)</span></b></label>
                                                <input type="password" class="form-control" value="" required name="old_password" autocomplete="off">
                                            </div>
                                            <div class="form-group">
                                                <label><b>New password <span class="text-danger">(*)</span></b></label>
                                                <input type="password" class="form-control" value="" required name="password" autocomplete="off">
                                            </div>
                                            <div class="form-group">
                                                <label><b>Re-type password <span class="text-danger">(*)</span></b></label>
                                                <input type="password" class="form-control" value="" required name="password_confirmation" autocomplete="off">
                                            </div>
                                            <div class="mar-top-10">
                                                <button type="submit" class="btn  btn-success">Save Changes</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- END CHANGE PASSWORD TAB -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PROFILE CONTENT -->
        </div>
    </div>
</div>
@endsection
