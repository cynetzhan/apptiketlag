var menuState = false;
var viewCurrent, viewPrev, viewNext,loginstatus;
    $('document').ready(function() {
        $('a#exit').click(function() {
            navigator.app.exitApp();
          });
        if(typeof localStorage['tiket88-userid']=='undefined'){
          $('#loginstat').text("Login");
          loginstatus=false;
          } else {
          $('#loginstat').text("Logout ("+localStorage['tiket88-userNama']+")");
          loginstatus=true;
          }
		// kendali tombol bilah menu
        $('button.dropdown-toggle').on('click', function(e){
          if(!menuState){
            $(this).parent().toggleClass('open');
            $('.sidemenu').animate({left:'0'},500);
            $("body").css("overflow","hidden");
            menuState=true;
            console.log("menuState is "+menuState); //untuk keperluan debugging
          } else {
            $('.sidemenu').animate({left:'-100vw'},500,function() {
              $('button.dropdown-toggle').parent().toggleClass('open');
            });
            $("body").css("overflow","auto");
            menuState=false;
            console.log("menuState is "+menuState); //untuk keperluan debugging
          }
          });
		  
		  // kendali tombol refresh
          $('button.refresh').click(function(vw) {
            viewRefresh(vw);
          });
        });

//  !--kumpulan fungsi kendali link--!  //
        $('#loginmenubtn').click(function() {
          if(loginstatus){
            localStorage.removeItem("tiket88-userid");
            localStorage.removeItem("tiket88-userpass");
            localStorage.removeItem("tiket88-usertel");
            localStorage.removeItem("tiket88-userNama");
            localStorage.setItem("ref","login");
            sessionStorage.clear();
            window.location.replace("login.html");
          } else {
            window.location.replace("login.html");
          }
        });

// !--navigation control function--!  //
function viewRoute(vw){  // fungsi routing ke fungsi kendali link
  switch(vw){
 
    case 'home':
      viewHome();
      break;
    default:
      console.log('There is no such menu');
      break;
  }
  console.log("refreshing: "+vw);
}

function menuOpen(){
  $(this).parent().toggleClass('open');
  $('.sidemenu').animate({left:'0'},500);
  $("body").css("overflow","hidden");
  menuState=true;
}

function menuClose(){
  if(menuState){
    $('.sidemenu').animate({left:'-100vw'},500,function() {
      $('button.dropdown-toggle').parent().toggleClass('open');
    });
    menuState=false;
  }
  
}

function viewLoading(){
  $('div#contentView').html("<span class='glyphicon glyphicon-refresh loading-ico'></span><br>Sedang Memuat...");
}

function viewTimeout(){
  $('div#contentView').html("<h3>Tidak dapat memuat. Periksa sambungan internet anda.</h3>")
}

function viewRefresh(){
  viewRoute(viewCurrent);
}

function prevHist(){
  window.history.back();
}

function onBackKeyDown(){
  console.log("BackKeyPressed");
  if(menuState){
      menuClose();
  } else {
    prevHist();
  }
}

function bookFilmTemp($idfilm){
  sessionStorage.setItem("filmBookCurrent",$idfilm);
  localStorage.setItem("ref","film");
  console.log(sessionStorage.filmBookCurrent);
  }

function generateBookId(){
  $("[name=bookid]").val(new Date().getTime());
}
    function tglFull(tgl){
        var bulan=['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];
        var teks=tgl.getDate()+" "+bulan[tgl.getMonth()]+" "+tgl.getFullYear();
        return teks;
        }

function checkLogin(page){
  usertel=localStorage['tiket88-usertel'];
  userpass=localStorage['tiket88-userpass'];
  $.get("http://localhost/bioskop88/proseslogin.php",{usrname:usertel, pswd:userpass}, function(res){
    if(res=="true"){ window.location.replace(page+'.html'); }
    else { window.location.replace('login.html'); }
    });
}
function redirLogin(){
            if(localStorage.getItem('ref')=='film'){window.location.replace('bookstep1.html')}
            else{window.location.replace('index.html')}
            }

//  !--end of navigation control function--!  //

