<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>A O N !</title>
    
    <link rel="stylesheet" href="/resources/include/css/reset.css">
    <!-- Bootstrap -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/resources/bootstrap/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/resources/bootstrap/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/resources/bootstrap/css/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="/resources/bootstrap/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="/resources/bootstrap/css/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="/resources/bootstrap/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="/resources/bootstrap/css/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="/resources/bootstrap/css/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="/resources/bootstrap/css/daterangepicker.css" rel="stylesheet">
    <!-- Font awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- JQVMap -->
    <link href="/resources/bootstrap/css/jqvmap.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="/resources/bootstrap/css/custom.min.css" rel="stylesheet">
    
    <!-- Datatables -->
    <link href="/resources/bootstrap/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/scroller.bootstrap.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>A O N !</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- sidebar menu -->
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
        
            <div class="clearfix"></div>
  
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <p>&nbsp;</p>
                <h3>Menu</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-gift"></i> 상품관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/product">상품관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 주문관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="orderlist" id="orderlist">주문내역</a></li>
                      <li><a class="orderPaymentList" id="orderPaymentList">결제관리</a></li>
                      <li><a class="RefundList" id="RefundList">환불관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-address-book-o" aria-hidden="true"></i> 회원관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="mInfo" id="mInfo">회원조회</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-address-book-o" aria-hidden="true"></i> 약관관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/policy">약관목록</a></li>
                      <li><a href="/admin/policyAgr">약관여부</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> 재고관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="main" id="main">재고관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bug"></i> 게시판관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="notice" id="notice">공지사항관리</a></li>
                      <li><a class="reviewList" id="reviewList">후기관리</a></li>
                      <li><a class="commentQnAList" id="commentQnAList">문의관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 공통코드관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="size" id="size">사이즈관리</a></li>
                      <li><a class="color" id="color">색상관리</a></li>
                      <li><a class="type" id="type">상품타입관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 화면 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="mImage" id="mImage">메인 이미지 관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 카테고리관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/category">카테고리관리</a></li>
                    </ul>
                  </li>                  
                </ul>
              </div>
            </div>
          </div>
        </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    ${vo.a_id }님
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="/admin/myPage">Profile</a></li>
                    <li><a href="/admin/joinForm">Register</a></li>
                    <li><a href="/admin/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>회원 관리</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                </div>
              </div>
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원조회 <small>회원관리>회원조회</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <form id="getNo" name="getNo">
                    <input type="hidden" name="m_no" value="${mDetail.m_no}">
                  </form>
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                        <input type="hidden" name="m_no" value="${mDetail.m_no}">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">회원번호 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_no" value="${mDetail.m_no}" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">회원아이디 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_id" value="${mDetail.m_id}" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">비밀번호</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_pwd" value="${mDetail.m_pwd}" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">이름</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_name" value="${mDetail.m_name}" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">성별</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_gender" value="${mDetail.m_gender}" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">전화번호</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_tel" value="${mDetail.m_tel}" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">이메일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_email" value="${mDetail.m_email}" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">지역</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_leave" value="${mDetail.m_addr}" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">가입일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" readonly name="m_date" value="${mDetail.m_date}" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                        <div class="form-group">
                          <div class="col-md-6 col-md-offset-3">
                            <input type="button" id="mInfoListBtn" name="mInfoListBtn" value="목록" class="btn btn-info">
                            <input type="button" id="mInfoDeleteBtn" name="mInfoDeleteBtn" value="삭제" class="btn btn-danger">
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>

        <!-- /page content -->

        <!-- footer content -->
        <!-- /footer content -->
      </div>
    </div>
        </div>
      </div>

    <!-- jQuery -->
    <script src="/resources/bootstrap/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/resources/bootstrap/js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/resources/bootstrap/js/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="/resources/bootstrap/js/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="/resources/bootstrap/js/icheck.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/resources/bootstrap/js/moment.min.js"></script>
    <script src="/resources/bootstrap/js/daterangepicker.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="/resources/bootstrap/js/bootstrap-wysiwyg.min.js"></script>
    <script src="/resources/bootstrap/js/jquery.hotkeys.js"></script>
    <script src="/resources/bootstrap/js/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="/resources/bootstrap/js/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="/resources/bootstrap/js/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="/resources/bootstrap/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="/resources/bootstrap/js/parsley.min.js"></script>
    <!-- Autosize -->
    <script src="/resources/bootstrap/js/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="/resources/bootstrap/js/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="/resources/bootstrap/js/starrr.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/resources/bootstrap/js/custom.min.js"></script>

    <!-- bootstrap-daterangepicker -->
    <script>
    $(function() {
    	
    	  /* 삭제 버튼 클릭시 */
    	  $("#mInfoDeleteBtn").click(function(){
					$("#getNo").attr({
						"method" : "post",
						"action" : "/admin/mInfoDelete"
					});
					$("#getNo").submit();
				});
    	
    	  /*목록 버튼 클릭시*/
		  $("#mInfoListBtn").click(function() {
			  location.href="/admin/mInfoList";
		  });
    	
		  // 회원조회 클릭 시
		  $(".mInfo").click(function() {
			  location.href = "/admin/mInfoList";
		  });
		  
		  $(".notice").click(function() {
			  location.href = "/admin/noticeList";
		  });
		  
		  $(".mImage").click(function() {
			  location.href = "/admin/imageUploadList";
		  });
		  
		  $(".size").click(function() {
			  location.href = "/admin/sCommonCodeList";
		  });
		  
		  $(".color").click(function() {
			  location.href = "/admin/cCommonCodeList";
		  });
		  
		  $(".type").click(function() {
			  location.href = "/admin/tCommonCodeList";
		  });
    });
		  
      $(document).ready(function() {
        $('#birthday').daterangepicker({
          singleDatePicker: true,
          calender_style: "picker_4"
        }, function(start, end, label) {
          console.log(start.toISOString(), end.toISOString(), label);
        });
      });
    </script>
    <!-- /bootstrap-daterangepicker -->

    <!-- bootstrap-wysiwyg -->
    <script>
      $(document).ready(function() {
        function initToolbarBootstrapBindings() {
          var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
              'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
              'Times New Roman', 'Verdana'
            ],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
          $.each(fonts, function(idx, fontName) {
            fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
          });
          $('a[title]').tooltip({
            container: 'body'
          });
          $('.dropdown-menu input').click(function() {
              return false;
            })
            .change(function() {
              $(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
            })
            .keydown('esc', function() {
              this.value = '';
              $(this).change();
            });

          $('[data-role=magic-overlay]').each(function() {
            var overlay = $(this),
              target = $(overlay.data('target'));
            overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
          });

          if ("onwebkitspeechchange" in document.createElement("input")) {
            var editorOffset = $('#editor').offset();

            $('.voiceBtn').css('position', 'absolute').offset({
              top: editorOffset.top,
              left: editorOffset.left + $('#editor').innerWidth() - 35
            });
          } else {
            $('.voiceBtn').hide();
          }
        }

        function showErrorAlert(reason, detail) {
          var msg = '';
          if (reason === 'unsupported-file-type') {
            msg = "Unsupported format " + detail;
          } else {
            console.log("error uploading file", reason, detail);
          }
          $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
            '<strong>File upload error</strong> ' + msg + ' </div>').prependTo('#alerts');
        }

        initToolbarBootstrapBindings();

        $('#editor').wysiwyg({
          fileUploadError: showErrorAlert
        });

        window.prettyPrint;
        prettyPrint();
      });
    </script>
    <!-- /bootstrap-wysiwyg -->

    <!-- Select2 -->
    <script>
      $(document).ready(function() {
        $(".select2_single").select2({
          placeholder: "Select a state",
          allowClear: true
        });
        $(".select2_group").select2({});
        $(".select2_multiple").select2({
          maximumSelectionLength: 4,
          placeholder: "With Max Selection limit 4",
          allowClear: true
        });
      });
    </script>
    <!-- /Select2 -->

    <!-- jQuery Tags Input -->
    <script>
      function onAddTag(tag) {
        alert("Added a tag: " + tag);
      }

      function onRemoveTag(tag) {
        alert("Removed a tag: " + tag);
      }

      function onChangeTag(input, tag) {
        alert("Changed a tag: " + tag);
      }

      $(document).ready(function() {
        $('#tags_1').tagsInput({
          width: 'auto'
        });
      });
    </script>
    <!-- /jQuery Tags Input -->

    <!-- Parsley -->
    <script>
      $(document).ready(function() {
        $.listen('parsley:field:validate', function() {
          validateFront();
        });
        $('#demo-form .btn').on('click', function() {
          $('#demo-form').parsley().validate();
          validateFront();
        });
        var validateFront = function() {
          if (true === $('#demo-form').parsley().isValid()) {
            $('.bs-callout-info').removeClass('hidden');
            $('.bs-callout-warning').addClass('hidden');
          } else {
            $('.bs-callout-info').addClass('hidden');
            $('.bs-callout-warning').removeClass('hidden');
          }
        };
      });

      $(document).ready(function() {
        $.listen('parsley:field:validate', function() {
          validateFront();
        });
        $('#demo-form2 .btn').on('click', function() {
          $('#demo-form2').parsley().validate();
          validateFront();
        });
        var validateFront = function() {
          if (true === $('#demo-form2').parsley().isValid()) {
            $('.bs-callout-info').removeClass('hidden');
            $('.bs-callout-warning').addClass('hidden');
          } else {
            $('.bs-callout-info').addClass('hidden');
            $('.bs-callout-warning').removeClass('hidden');
          }
        };
      });
      try {
        hljs.initHighlightingOnLoad();
      } catch (err) {}
    </script>
    <!-- /Parsley -->

    <!-- Autosize -->
    <script>
      $(document).ready(function() {
        autosize($('.resizable_textarea'));
      });
    </script>
    <!-- /Autosize -->

    <!-- jQuery autocomplete -->
    <script>
      $(document).ready(function() {
        var countries = { AD:"Andorra",A2:"Andorra Test",AE:"United Arab Emirates",AF:"Afghanistan",AG:"Antigua and Barbuda",AI:"Anguilla",AL:"Albania",AM:"Armenia",AN:"Netherlands Antilles",AO:"Angola",AQ:"Antarctica",AR:"Argentina",AS:"American Samoa",AT:"Austria",AU:"Australia",AW:"Aruba",AX:"Åland Islands",AZ:"Azerbaijan",BA:"Bosnia and Herzegovina",BB:"Barbados",BD:"Bangladesh",BE:"Belgium",BF:"Burkina Faso",BG:"Bulgaria",BH:"Bahrain",BI:"Burundi",BJ:"Benin",BL:"Saint Barthélemy",BM:"Bermuda",BN:"Brunei",BO:"Bolivia",BQ:"British Antarctic Territory",BR:"Brazil",BS:"Bahamas",BT:"Bhutan",BV:"Bouvet Island",BW:"Botswana",BY:"Belarus",BZ:"Belize",CA:"Canada",CC:"Cocos [Keeling] Islands",CD:"Congo - Kinshasa",CF:"Central African Republic",CG:"Congo - Brazzaville",CH:"Switzerland",CI:"Côte d’Ivoire",CK:"Cook Islands",CL:"Chile",CM:"Cameroon",CN:"China",CO:"Colombia",CR:"Costa Rica",CS:"Serbia and Montenegro",CT:"Canton and Enderbury Islands",CU:"Cuba",CV:"Cape Verde",CX:"Christmas Island",CY:"Cyprus",CZ:"Czech Republic",DD:"East Germany",DE:"Germany",DJ:"Djibouti",DK:"Denmark",DM:"Dominica",DO:"Dominican Republic",DZ:"Algeria",EC:"Ecuador",EE:"Estonia",EG:"Egypt",EH:"Western Sahara",ER:"Eritrea",ES:"Spain",ET:"Ethiopia",FI:"Finland",FJ:"Fiji",FK:"Falkland Islands",FM:"Micronesia",FO:"Faroe Islands",FQ:"French Southern and Antarctic Territories",FR:"France",FX:"Metropolitan France",GA:"Gabon",GB:"United Kingdom",GD:"Grenada",GE:"Georgia",GF:"French Guiana",GG:"Guernsey",GH:"Ghana",GI:"Gibraltar",GL:"Greenland",GM:"Gambia",GN:"Guinea",GP:"Guadeloupe",GQ:"Equatorial Guinea",GR:"Greece",GS:"South Georgia and the South Sandwich Islands",GT:"Guatemala",GU:"Guam",GW:"Guinea-Bissau",GY:"Guyana",HK:"Hong Kong SAR China",HM:"Heard Island and McDonald Islands",HN:"Honduras",HR:"Croatia",HT:"Haiti",HU:"Hungary",ID:"Indonesia",IE:"Ireland",IL:"Israel",IM:"Isle of Man",IN:"India",IO:"British Indian Ocean Territory",IQ:"Iraq",IR:"Iran",IS:"Iceland",IT:"Italy",JE:"Jersey",JM:"Jamaica",JO:"Jordan",JP:"Japan",JT:"Johnston Island",KE:"Kenya",KG:"Kyrgyzstan",KH:"Cambodia",KI:"Kiribati",KM:"Comoros",KN:"Saint Kitts and Nevis",KP:"North Korea",KR:"South Korea",KW:"Kuwait",KY:"Cayman Islands",KZ:"Kazakhstan",LA:"Laos",LB:"Lebanon",LC:"Saint Lucia",LI:"Liechtenstein",LK:"Sri Lanka",LR:"Liberia",LS:"Lesotho",LT:"Lithuania",LU:"Luxembourg",LV:"Latvia",LY:"Libya",MA:"Morocco",MC:"Monaco",MD:"Moldova",ME:"Montenegro",MF:"Saint Martin",MG:"Madagascar",MH:"Marshall Islands",MI:"Midway Islands",MK:"Macedonia",ML:"Mali",MM:"Myanmar [Burma]",MN:"Mongolia",MO:"Macau SAR China",MP:"Northern Mariana Islands",MQ:"Martinique",MR:"Mauritania",MS:"Montserrat",MT:"Malta",MU:"Mauritius",MV:"Maldives",MW:"Malawi",MX:"Mexico",MY:"Malaysia",MZ:"Mozambique",NA:"Namibia",NC:"New Caledonia",NE:"Niger",NF:"Norfolk Island",NG:"Nigeria",NI:"Nicaragua",NL:"Netherlands",NO:"Norway",NP:"Nepal",NQ:"Dronning Maud Land",NR:"Nauru",NT:"Neutral Zone",NU:"Niue",NZ:"New Zealand",OM:"Oman",PA:"Panama",PC:"Pacific Islands Trust Territory",PE:"Peru",PF:"French Polynesia",PG:"Papua New Guinea",PH:"Philippines",PK:"Pakistan",PL:"Poland",PM:"Saint Pierre and Miquelon",PN:"Pitcairn Islands",PR:"Puerto Rico",PS:"Palestinian Territories",PT:"Portugal",PU:"U.S. Miscellaneous Pacific Islands",PW:"Palau",PY:"Paraguay",PZ:"Panama Canal Zone",QA:"Qatar",RE:"Réunion",RO:"Romania",RS:"Serbia",RU:"Russia",RW:"Rwanda",SA:"Saudi Arabia",SB:"Solomon Islands",SC:"Seychelles",SD:"Sudan",SE:"Sweden",SG:"Singapore",SH:"Saint Helena",SI:"Slovenia",SJ:"Svalbard and Jan Mayen",SK:"Slovakia",SL:"Sierra Leone",SM:"San Marino",SN:"Senegal",SO:"Somalia",SR:"Suriname",ST:"São Tomé and Príncipe",SU:"Union of Soviet Socialist Republics",SV:"El Salvador",SY:"Syria",SZ:"Swaziland",TC:"Turks and Caicos Islands",TD:"Chad",TF:"French Southern Territories",TG:"Togo",TH:"Thailand",TJ:"Tajikistan",TK:"Tokelau",TL:"Timor-Leste",TM:"Turkmenistan",TN:"Tunisia",TO:"Tonga",TR:"Turkey",TT:"Trinidad and Tobago",TV:"Tuvalu",TW:"Taiwan",TZ:"Tanzania",UA:"Ukraine",UG:"Uganda",UM:"U.S. Minor Outlying Islands",US:"United States",UY:"Uruguay",UZ:"Uzbekistan",VA:"Vatican City",VC:"Saint Vincent and the Grenadines",VD:"North Vietnam",VE:"Venezuela",VG:"British Virgin Islands",VI:"U.S. Virgin Islands",VN:"Vietnam",VU:"Vanuatu",WF:"Wallis and Futuna",WK:"Wake Island",WS:"Samoa",YD:"People's Democratic Republic of Yemen",YE:"Yemen",YT:"Mayotte",ZA:"South Africa",ZM:"Zambia",ZW:"Zimbabwe",ZZ:"Unknown or Invalid Region" };

        var countriesArray = $.map(countries, function(value, key) {
          return {
            value: value,
            data: key
          };
        });

        // initialize autocomplete with custom appendTo
        $('#autocomplete-custom-append').autocomplete({
          lookup: countriesArray
        });
      });
    </script>
    <!-- /jQuery autocomplete -->

    <!-- Starrr -->
    <script>
      $(document).ready(function() {
        $(".stars").starrr();

        $('.stars-existing').starrr({
          rating: 4
        });

        $('.stars').on('starrr:change', function (e, value) {
          $('.stars-count').html(value);
        });

        $('.stars-existing').on('starrr:change', function (e, value) {
          $('.stars-count-existing').html(value);
        });
      });
    </script>
    <!-- /Starrr -->
  </body>
</html>
