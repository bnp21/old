<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 14. 6. 26
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section>
    <ol class="breadcrumb">
        <li><a href="http://localhost/CodeCovers/www.codecovers.com/boostbox">home</a></li>
        <li class="active">Fileuploads</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> File upload</h3>
    </div>
    <div class="section-body">
        <!-- START FILE UPLOAD -->
        <div class="row">
            <div class="col-lg-12">
                <div class="box">
                    <div class="box-head">
                        <header><h4 class="text-light"><i class="fa fa-font fa-fw"></i> Multiple <strong>file upload</strong></h4></header>
                    </div>
                    <div class="box-body">
                        <blockquote>
                            <p>
                                File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery.<br>
                                Supports cross-domain, chunked and resumable file uploads and client-side image resizing.<br>
                                Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.
                            </p>
                        </blockquote>
                        <form id="fileupload" action="//jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data">
                            <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                            <div class="row fileupload-buttonbar">
                                <div class="col-lg-7">
                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                    <div class="btn-group">
														<span class="btn btn-success btn-rounded fileinput-button">
															<i class="glyphicon glyphicon-plus"></i>
															<span>Add files...</span>
															<input type="file" name="files[]" multiple="">
														</span>
                                        <button type="submit" class="btn btn-primary btn-rounded start">
                                            <i class="glyphicon glyphicon-upload"></i>
                                            <span>Start upload</span>
                                        </button>
                                        <button type="reset" class="btn btn-warning btn-rounded cancel">
                                            <i class="glyphicon glyphicon-ban-circle"></i>
                                            <span>Cancel upload</span>
                                        </button>
                                        <button type="button" class="btn btn-danger btn-rounded delete">
                                            <i class="glyphicon glyphicon-trash"></i>
                                            <span>Delete</span>
                                        </button>
                                    </div>
                                    <input type="checkbox" class="toggle">
                                    <!-- The global file processing state -->
                                    <span class="fileupload-process"></span>
                                </div>
                                <!-- The global progress state -->
                                <div class="col-lg-5 fileupload-progress fade">
                                    <!-- The global progress bar -->
                                    <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                        <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                                    </div>
                                    <!-- The extended global progress state -->
                                    <div class="progress-extended">&nbsp;</div>
                                </div>
                            </div>
                            <!-- The table listing the files available for upload/download -->
                            <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
                        </form>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Demo Notes</h3>
                            </div>
                            <div class="panel-body">
                                <ul>
                                    <li>The maximum file size for uploads in this demo is <strong>5 MB</strong> (default file size is unlimited).</li>
                                    <li>Only image files (<strong>JPG, GIF, PNG</strong>) are allowed in this demo (by default there is no file type restriction).</li>
                                    <li>Uploaded files will be deleted automatically after <strong>5 minutes</strong> (demo setting).</li>
                                    <li>You can <strong>drag &amp; drop</strong> files from your desktop on this webpage (see <a href="https://github.com/blueimp/jQuery-File-Upload/wiki/Browser-support">Browser support</a>).</li>
                                    <li>Please refer to the <a href="https://github.com/blueimp/jQuery-File-Upload">project website</a> and <a href="https://github.com/blueimp/jQuery-File-Upload/wiki">documentation</a> for more information.</li>
                                    <li>Built with Twitter's <a href="http://twitter.github.com/bootstrap/">Bootstrap</a> CSS framework and Icons from <a href="http://glyphicons.com/">Glyphicons</a>.</li>
                                </ul>
                            </div>
                        </div>
                    </div><!--end .box-body -->
                </div><!--end .box -->
            </div><!--end .col-lg-12 -->
        </div><!--end .row -->
        <!-- END FILE UPLOAD -->

    </div><!--end .section-body -->
</section>

<content tag="local_script">
    <script src="/resources/admin/js/libs/blueimp-file-upload/vendor/jquery.ui.widget.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/vendor/tmpl.min.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/vendor/load-image.min.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/vendor/jquery.blueimp-gallery.min.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.iframe-transport.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-process.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-image.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-audio.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-video.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-validate.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-ui.js"></script>

    <script>
        $(function() {
            'use strict';

            // Initialize the jQuery File Upload widget:
            $('#fileupload').fileupload({
                // Uncomment the following to send cross-domain cookies:
                //xhrFields: {withCredentials: true},
                url: 'server/php/'
            });

            // Enable iframe cross-domain access via redirect option:
            $('#fileupload').fileupload(
                    'option',
                    'redirect',
                    window.location.href.replace(
                            /\/[^\/]*$/,
                            '/cors/result.html?%s'
                    )
            );


            // Initialize the jQuery File Upload widget:
            $('#fileupload').fileupload({
                // Uncomment the following to send cross-domain cookies:
                //xhrFields: {withCredentials: true},
                autoUpload: true,
                url: '//localhost/notice/getNoticeList'
            });
        });


        $(document).ready(function() {
            $("#name").focus();
        });


    </script>

    <!-- START FILE UPLOAD TEMPLATES -->
    <script id="template-upload" type="text/x-tmpl">
			{% for (var i=0, file; file=o.files[i]; i++) { %}
			<tr class="template-upload fade">
				<td>
					<span class="preview"></span>
				</td>
				<td>
					<p class="name">{%=file.name%}</p>
					<strong class="error text-danger"></strong>
				</td>
				<td>
					<p class="size">Processing...</p>
					<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
				</td>
				<td>
					{% if (!i && !o.options.autoUpload) { %}
					<button class="btn btn-primary start" disabled>
						<i class="glyphicon glyphicon-upload"></i>
						<span>Start</span>
					</button>
					{% } %}
					{% if (!i) { %}
					<button class="btn btn-warning cancel">
						<i class="glyphicon glyphicon-ban-circle"></i>
						<span>Cancel</span>
					</button>
					{% } %}
				</td>
			</tr>
			{% } %}
		</script>
    <script id="template-download" type="text/x-tmpl">
			{% for (var i=0, file; file=o.files[i]; i++) { %}
			<tr class="template-download fade">
				<td>
					<span class="preview">
						{% if (file.thumbnailUrl) { %}
						<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
						{% } %}
					</span>
				</td>
				<td>
					<p class="name">
						{% if (file.url) { %}
						<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
						{% } else { %}
						<span>{%=file.name%}</span>
						{% } %}
					</p>
					{% if (file.error) { %}
					<div><span class="label label-danger">Error</span> {%=file.error%}</div>
					{% } %}
				</td>
				<td>
					<span class="size">{%=o.formatFileSize(file.size)%}</span>
				</td>
				<td>
					{% if (file.deleteUrl) { %}
					<button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
						<i class="glyphicon glyphicon-trash"></i>
						<span>Delete</span>
					</button>
					<input type="checkbox" name="delete" value="1" class="toggle">
					{% } else { %}
					<button class="btn btn-warning cancel">
						<i class="glyphicon glyphicon-ban-circle"></i>
						<span>Cancel</span>
					</button>
					{% } %}
				</td>
			</tr>
			{% } %}
		</script>
</content>